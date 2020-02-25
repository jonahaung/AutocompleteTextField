
import XCTest

class AutocompleteTextFieldUITests: XCTestCase {
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
        let field = XCUIApplication().textFields["Domain"]
        field.tap()

        field.typeText("w")
        XCTAssertEqual(field.value! as! String, "www.google.com/")
        field.typeText(XCUIKeyboardKeyDelete)
        XCTAssertEqual(field.value! as! String, "w")
        field.typeText("ww.yah")
        XCTAssertEqual(field.value! as! String, "www.yahoo.com/")
        field.typeText(XCUIKeyboardKeyDelete)
        XCTAssertEqual(field.value! as! String, "www.yah")
        field.typeText(XCUIKeyboardKeyDelete)
        XCTAssertEqual(field.value! as! String, "www.ya")
        field.typeText(XCUIKeyboardKeyDelete)
        field.typeText(XCUIKeyboardKeyDelete)
        field.typeText(XCUIKeyboardKeyDelete)
        field.typeText(XCUIKeyboardKeyDelete)
        field.typeText(XCUIKeyboardKeyDelete)
        field.typeText(XCUIKeyboardKeyDelete)
        XCTAssertEqual(field.value! as! String, "")
        field.typeText("g")
        XCTAssertEqual(field.value! as! String, "google.com/")
        field.typeText("z")
        XCTAssertEqual(field.value! as! String, "gz")
        field.typeText(XCUIKeyboardKeyDelete)
        XCTAssertEqual(field.value! as! String, "g")
        field.typeText("o")
        XCTAssertEqual(field.value! as! String, "google.com/")
    }
}
