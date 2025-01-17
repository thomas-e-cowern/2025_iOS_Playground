import XCTest
import OSLog
import Foundation
@testable import SimpleShop

let logger: Logger = Logger(subsystem: "SimpleShop", category: "Tests")

@available(macOS 13, *)
final class SimpleShopTests: XCTestCase {

    func testSimpleShop() throws {
        logger.log("running testSimpleShop")
        XCTAssertEqual(1 + 2, 3, "basic test")
    }

    func testDecodeType() throws {
        // load the TestData.json file from the Resources folder and decode it into a struct
        let resourceURL: URL = try XCTUnwrap(Bundle.module.url(forResource: "TestData", withExtension: "json"))
        let testData = try JSONDecoder().decode(TestData.self, from: Data(contentsOf: resourceURL))
        XCTAssertEqual("SimpleShop", testData.testModuleName)
    }

}

struct TestData : Codable, Hashable {
    var testModuleName: String
}
