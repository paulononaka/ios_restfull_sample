import XCTest

class UserDetailsUITests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchEnvironment["TEST"] = "1"
        app.launch()
        
        let navigation = app.navigationBars["Users"].staticTexts["Users"]
        let exists = NSPredicate(format: "exists == 1")
        expectationForPredicate(exists, evaluatedWithObject: navigation, handler: nil)
        waitForExpectationsWithTimeout(5, handler: nil)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldShowUserInfo() {
        
        // Given I have a user Ronald Sander
        
        let user = app.tables.staticTexts["Ronald Sanders"]
        let exists = NSPredicate(format: "exists == 1")
        expectationForPredicate(exists, evaluatedWithObject: user, handler: nil)
        waitForExpectationsWithTimeout(5, handler: nil)

        // When I select this user from the list
        
        user.tap()
        
        // Then I should see
        
        XCTAssert(app.staticTexts["ronald.sanders@gmail.com"].exists)
        XCTAssert(app.staticTexts["Ronald Sanders"].exists)
    }
    
}
