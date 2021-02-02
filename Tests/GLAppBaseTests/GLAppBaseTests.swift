import XCTest
@testable import GLAppBase

class MockRenderObject: RenderObject {
    func render() {
        
    }
    
}

final class GLAppBaseTests: XCTestCase {
    func testCreateApp() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let app = GLAppBase.init()
        XCTAssert((app.renderObject == nil))
    }
    
    func testCreateAppSetRenderObject() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let app = GLAppBase.init()
        app.renderObject = MockRenderObject()
        XCTAssert((app.renderObject != nil))
    }

    static var allTests = [
        ("testExample", testCreateApp),
    ]
}
