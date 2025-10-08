//
//  APIService.swift
//  ApiServiceTest
//
//  Created by Thomas Cowern on 10/3/25.
//

import Foundation
import SwiftUI

//// MARK: - Endpoints (add your own)
//enum Endpoint: String {
//    case users
//    case products
//
//    var fileName: String { rawValue + ".json" }   // e.g., "users.json"
//    var path: String { "/" + rawValue }           // e.g., "/users"
//}
//
//// MARK: - API errors
//enum APIError: LocalizedError {
//    case notFound(String)
//    case decoding(Error)
//    case encoding(Error)
//    case io(Error)
//    case http(Int)
//    case unknown
//
//    var errorDescription: String? {
//        switch self {
//        case .notFound(let s): return "Not found: \(s)"
//        case .decoding(let e): return "Decoding failed: \(e.localizedDescription)"
//        case .encoding(let e): return "Encoding failed: \(e.localizedDescription)"
//        case .io(let e):       return "I/O error: \(e.localizedDescription)"
//        case .http(let code):  return "HTTP \(code)"
//        case .unknown:         return "Unknown error"
//        }
//    }
//}
//
//// MARK: - Service protocol
//protocol APIService {
//    func list<T: Decodable>(_ type: T.Type, from endpoint: Endpoint) async throws -> [T]
//    func get<T: Decodable & Identifiable>(_ type: T.Type, id: T.ID, from endpoint: Endpoint) async throws -> T? where T.ID: Equatable
//    func create<T: Codable & Identifiable>(_ item: T, at endpoint: Endpoint) async throws where T.ID: Equatable
//    func update<T: Codable & Identifiable>(_ item: T, at endpoint: Endpoint) async throws where T.ID: Equatable
//    // NOTE: include the type in signature so T is used and the existential knows the element type
//    func delete<T: Codable & Identifiable>(_ type: T.Type, id: T.ID, at endpoint: Endpoint) async throws where T.ID: Equatable
//}
//
//// MARK: - JSON Store (Documents/MockData) — actor = safe for concurrent use
//actor JSONStore {
//    private let root: URL
//    private let seedBundle: Bundle
//    private let decoder = JSONDecoder()
//    private let encoder: JSONEncoder = {
//        let e = JSONEncoder()
//        e.outputFormatting = [.prettyPrinted, .sortedKeys]
//        return e
//    }()
//
//    init(folderName: String = "MockData", seedBundle: Bundle = .main) {
//        self.seedBundle = seedBundle
//        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        self.root = docs.appendingPathComponent(folderName, isDirectory: true)
//        try? FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
//    }
//
//    private func fileURL(for endpoint: Endpoint) -> URL {
//        root.appendingPathComponent(endpoint.fileName)
//    }
//
//    private func seedURL(for endpoint: Endpoint) -> URL? {
//        let name = (endpoint.fileName as NSString).deletingPathExtension
//        let ext  = (endpoint.fileName as NSString).pathExtension
//        // Looks in Resources/Mock/
//        return seedBundle.url(forResource: name, withExtension: ext, subdirectory: "Mock")
//    }
//
//    private func ensureSeed(for endpoint: Endpoint) throws {
//        let dest = fileURL(for: endpoint)
//        guard !FileManager.default.fileExists(atPath: dest.path) else { return }
//
//        if let seed = seedURL(for: endpoint) {
//            do { try FileManager.default.copyItem(at: seed, to: dest) }
//            catch { throw APIError.io(error) }
//        } else {
//            // Start empty array if no seed provided
//            do { try Data("[]".utf8).write(to: dest, options: .atomic) }
//            catch { throw APIError.io(error) }
//        }
//    }
//
//    func readArray<T: Decodable>(_ type: T.Type, from endpoint: Endpoint) throws -> [T] {
//        try ensureSeed(for: endpoint)
//        let url = fileURL(for: endpoint)
//        do {
//            let data = try Data(contentsOf: url)
//            return try decoder.decode([T].self, from: data)
//        } catch let err as DecodingError {
//            throw APIError.decoding(err)
//        } catch {
//            throw APIError.io(error)
//        }
//    }
//
//    func writeArray<T: Encodable>(_ items: [T], to endpoint: Endpoint) throws {
//        let url = fileURL(for: endpoint)
//        do {
//            let data = try encoder.encode(items)
//            try data.write(to: url, options: .atomic)
//        } catch let err as EncodingError {
//            throw APIError.encoding(err)
//        } catch {
//            throw APIError.io(error)
//        }
//    }
//}
//
//// MARK: - Mock service (reads/writes JSON files)
//struct MockAPIService: APIService {
//    private let store: JSONStore
//
//    init(store: JSONStore = JSONStore()) {
//        self.store = store
//    }
//
//    func list<T: Decodable>(_ type: T.Type, from endpoint: Endpoint) async throws -> [T] {
//        try await store.readArray(T.self, from: endpoint)
//    }
//
//    func get<T: Decodable & Identifiable>(_ type: T.Type, id: T.ID, from endpoint: Endpoint) async throws -> T? where T.ID: Equatable {
//        let all: [T] = try await store.readArray(T.self, from: endpoint)
//        return all.first { $0.id == id }
//    }
//
//    func create<T: Codable & Identifiable>(_ item: T, at endpoint: Endpoint) async throws where T.ID: Equatable {
//        var all: [T] = try await store.readArray(T.self, from: endpoint)
//        if let i = all.firstIndex(where: { $0.id == item.id }) {
//            all[i] = item
//        } else {
//            all.append(item)
//        }
//        try await store.writeArray(all, to: endpoint)
//    }
//
//    func update<T: Codable & Identifiable>(_ item: T, at endpoint: Endpoint) async throws where T.ID: Equatable {
//        try await create(item, at: endpoint)
//    }
//
//    func delete<T: Codable & Identifiable>(_ type: T.Type, id: T.ID, at endpoint: Endpoint) async throws where T.ID: Equatable {
//        var all: [T] = try await store.readArray(T.self, from: endpoint)
//        all.removeAll { $0.id == id }
//        try await store.writeArray(all, to: endpoint)
//    }
//}
//
//// MARK: - Live service (basic URLSession version — fill in your baseURL)
//struct LiveAPIService: APIService {
//    let baseURL: URL
//    var session: URLSession = .shared
//
//    func list<T: Decodable>(_ type: T.Type, from endpoint: Endpoint) async throws -> [T] {
//        let url = baseURL.appendingPathComponent(endpoint.path)
//        let (data, resp) = try await session.data(from: url)
//        guard let http = resp as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
//            throw APIError.http((resp as? HTTPURLResponse)?.statusCode ?? -1)
//        }
//        do { return try JSONDecoder().decode([T].self, from: data) }
//        catch { throw APIError.decoding(error) }
//    }
//
//    func get<T: Decodable & Identifiable>(_ type: T.Type, id: T.ID, from endpoint: Endpoint) async throws -> T? where T.ID: Equatable {
//        let url = baseURL.appendingPathComponent(endpoint.path).appendingPathComponent(String(describing: id))
//        let (data, resp) = try await session.data(from: url)
//        guard let http = resp as? HTTPURLResponse else { throw APIError.unknown }
//        switch http.statusCode {
//        case 200: return try JSONDecoder().decode(T.self, from: data)
//        case 404: return nil
//        default: throw APIError.http(http.statusCode)
//        }
//    }
//
//    func create<T: Codable & Identifiable>(_ item: T, at endpoint: Endpoint) async throws where T.ID: Equatable {
//        var req = URLRequest(url: baseURL.appendingPathComponent(endpoint.path))
//        req.httpMethod = "POST"
//        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        do { req.httpBody = try JSONEncoder().encode(item) } catch { throw APIError.encoding(error) }
//        let (_, resp) = try await session.data(for: req)
//        guard let http = resp as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
//            throw APIError.http((resp as? HTTPURLResponse)?.statusCode ?? -1)
//        }
//    }
//
//    func update<T: Codable & Identifiable>(_ item: T, at endpoint: Endpoint) async throws where T.ID: Equatable {
//        var req = URLRequest(
//            url: baseURL.appendingPathComponent(endpoint.path).appendingPathComponent(String(describing: item.id))
//        )
//        req.httpMethod = "PUT"
//        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        do { req.httpBody = try JSONEncoder().encode(item) } catch { throw APIError.encoding(error) }
//        let (_, resp) = try await session.data(for: req)
//        guard let http = resp as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
//            throw APIError.http((resp as? HTTPURLResponse)?.statusCode ?? -1)
//        }
//    }
//
//    func delete<T: Codable & Identifiable>(_ type: T.Type, id: T.ID, at endpoint: Endpoint) async throws where T.ID: Equatable {
//        var req = URLRequest(
//            url: baseURL.appendingPathComponent(endpoint.path).appendingPathComponent(String(describing: id))
//        )
//        req.httpMethod = "DELETE"
//        let (_, resp) = try await session.data(for: req)
//        guard let http = resp as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
//            throw APIError.http((resp as? HTTPURLResponse)?.statusCode ?? -1)
//        }
//    }
//}
//
//// MARK: - SwiftUI Dependency Injection
//private struct APIServiceKey: EnvironmentKey {
//    static var defaultValue: any APIService = MockAPIService() // default to mock
//}
//
//extension EnvironmentValues {
//    var apiService: any APIService {
//        get { self[APIServiceKey.self] }
//        set { self[APIServiceKey.self] = newValue }
//    }
//}
