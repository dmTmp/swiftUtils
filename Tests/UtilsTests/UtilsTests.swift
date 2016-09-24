import XCTest
@testable import Utils

class UtilsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Utils().text, "Hello, World!")
    }


    static var allTests : [(String, (UtilsTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
