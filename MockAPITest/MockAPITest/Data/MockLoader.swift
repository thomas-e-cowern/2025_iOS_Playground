//
//  MockLoader.swift
//  MockAPITest
//
//  Created by Thomas Cowern on 10/3/25.
//

import Foundation

private final class _BundleToken {}

enum MockLoadError: LocalizedError {
    case fileNotFound(String)
    case unreadable(URL)
    case decoding(Error, String)

    var errorDescription: String? {
        switch self {
        case .fileNotFound(let name): return "Mock file not found: \(name)"
        case .unreadable(let url):    return "Cannot read mock file at: \(url.lastPathComponent)"
        case .decoding(let err, let name): return "Failed to decode \(name): \(err)"
        }
    }
}

private var isPreview: Bool {
    ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}

private var appBundleForPreviewAware: Bundle {
    #if DEBUG
    isPreview ? Bundle(for: _BundleToken.self) : .main
    #else
    .main
    #endif
}

/// Load and decode a JSON file from your app bundle.
/// - Parameters:
///   - filename: e.g. "Mock/users.json"
///   - as: The Decodable type to decode.
///   - fallback: Optional value to return in previews if loading fails (previews won't crash).
func loadMock<T: Decodable>(
    _ filename: String,
    as type: T.Type = T.self,
    fallback: @autoclosure () -> T? = nil
) throws -> T {
    let bundle = appBundleForPreviewAware

    // Accept both "Mock/users.json" and "users.json" (folder is part of the name)
    func url(for name: String) -> URL? {
        let ns = name as NSString
        let base = ns.deletingPathExtension
        let ext  = ns.pathExtension.isEmpty ? "json" : ns.pathExtension
        return bundle.url(forResource: base, withExtension: ext)
    }

    guard let url = url(for: filename) ?? url(for: "Resources/\(filename)") ?? url(for: "Mock/\(filename)") else {
        if isPreview, let stub = fallback() { return stub }
        throw MockLoadError.fileNotFound(filename)
    }

    guard let data = try? Data(contentsOf: url) else {
        if isPreview, let stub = fallback() { return stub }
        throw MockLoadError.unreadable(url)
    }

    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        if isPreview, let stub = fallback() { return stub }
        throw MockLoadError.decoding(error, filename)
    }
}

