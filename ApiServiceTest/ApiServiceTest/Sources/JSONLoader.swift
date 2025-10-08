//
//  JSONLoader.swift
//  ApiServiceTest
//
//  Created by Thomas Cowern on 10/3/25.
//

import Foundation

// Put this file in the **app target** unless you’re using SwiftPM resources.
private final class _AppBundleAnchor {} // must live in the module that owns the JSON

private var isPreview: Bool {
    ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}

enum JSON {
    /// Load & decode JSON from known bundles. Never traps; uses fallback on failure.
    static func load<T: Decodable>(
        _ filename: String,
        subdir: String? = "Mock",
        as type: T.Type = T.self,
        fallback: @autoclosure () -> T
    ) -> T {
        let (name, ext) = split(filename)

        // Candidate bundles, in order:
        var bundles: [Bundle] = []
        #if SWIFT_PACKAGE
        bundles.append(.module)                // SwiftPM resource bundle
        #endif
        bundles.append(.main)                  // App bundle
        bundles.append(Bundle(for: _AppBundleAnchor.self)) // Anchor bundle (this module)

        // Try each bundle & location
        for b in bundles {
            if let url = url(for: name, ext: ext, subdir: subdir, in: b)
                      ?? url(for: name, ext: ext, subdir: nil, in: b)  // also try root
            {
                return decode(T.self, from: url, fallback: fallback())
            }
        }

        log("Missing file “\(filename)” in any known bundle. " +
            debugHints(filename: filename, subdir: subdir, bundles: bundles))
        return fallback()
    }

    // MARK: - Helpers

    private static func split(_ filename: String) -> (name: String, ext: String) {
        let ns = filename as NSString
        let name = ns.deletingPathExtension
        let ext  = ns.pathExtension.isEmpty ? "json" : ns.pathExtension
        return (name, ext)
    }

    private static func url(for name: String, ext: String, subdir: String?, in bundle: Bundle) -> URL? {
        // Accept exact "name.ext" or nested in subdir
        if let sub = subdir {
            if let u = bundle.url(forResource: name, withExtension: ext, subdirectory: sub) { return u }
            if let u = bundle.url(forResource: "\(sub)/\(name)", withExtension: ext) { return u } // some bundles prefer this form
        }
        return bundle.url(forResource: name, withExtension: ext)
    }

    private static func decode<T: Decodable>(_ type: T.Type, from url: URL, fallback: @autoclosure () -> T) -> T {
        guard let data = try? Data(contentsOf: url) else {
            log("Unreadable file at \(url.lastPathComponent)"); return fallback()
        }
        do { return try JSONDecoder().decode(T.self, from: data) }
        catch { log("Decoding failed for \(url.lastPathComponent): \(error)"); return fallback() }
    }

    private static func log(_ message: String) {
        #if DEBUG
        print("⚠️ [JSON] \(message)\(isPreview ? " (Preview)" : "")")
        #endif
    }

    private static func debugHints(filename: String, subdir: String?, bundles: [Bundle]) -> String {
        let bundleSummaries = bundles.map { b in
            let path = b.bundlePath
            let found = (b.urls(forResourcesWithExtension: "json", subdirectory: subdir ?? "") ?? [])
                .map { $0.lastPathComponent }
                .joined(separator: ", ")
            return "\n  • \(path)\(subdir.map { " / \($0)" } ?? ""): [\(found)]"
        }.joined()
        return "\nSearched bundles:\(bundleSummaries)\nChecks: 1) Target Membership ✓  2) Copy Bundle Resources ✓  3) File name/case ✓"
    }
}
