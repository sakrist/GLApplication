import XCTest
@testable import GLAppBase

final class GLAppBaseTests: XCTestCase {
    func testCreateApp() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        _ app = GLAppBase.init()
        
//        XCTAssertEqual(GLAppBase().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testCreateApp),
    ]
}
