import XCTest
@testable import GLApplication

#if os(Windows)
import Win.GL
#else
import OpenGL
#endif

class MockRenderObject: RenderObject {
    func render() {
        
    }
    
}

final class GLApplicationTests: XCTestCase {
    func testCreateApp() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let app = Application.init()
        XCTAssert((app.renderObject == nil))
    }

    func testOpenGL() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        var no_of_extensions: GLint = 0;
        glGetIntegerv(GLenum(GL_NUM_EXTENSIONS), &no_of_extensions);
        print (no_of_extensions)
    }
    
    func testCreateAppSetRenderObject() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let app = Application.init()
        app.renderObject = MockRenderObject()
        XCTAssert((app.renderObject != nil))
    }

    static var allTests = [
        ("testExample", testCreateApp),
    ]
}
