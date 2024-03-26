//
//  ios_exercise_2UITests.swift
//  ios-exercise-2UITests
//
//  Created by bayteq on 25/3/24.
//

import XCTest

final class ios_exercise_2UITests: XCTestCase {

  
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func testSetCredentialsForLogin(user : String, password : String) throws{
        XCTAssertTrue(app.staticTexts[TestIdentifiers.welcomeLabel].exists, TestFailureMessage.welcomeLabelNotFound)

        let userField = app.textFields[TestIdentifiers.userTextField]
        XCTAssertTrue(userField.exists, TestFailureMessage.userTextFieldlNotFound)
        userField.tap()
        userField.typeText(user)

        let userButton = app.buttons[TestIdentifiers.userButton]
        XCTAssertTrue(userButton.exists, TestFailureMessage.userButtonNotFound)
        userButton.tap()

        XCTAssertTrue(app.otherElements[TestIdentifiers.passwordScreen].exists, TestFailureMessage.passwordScreenNotFound)
        
        let passwordField = app.secureTextFields[TestIdentifiers.passwordTextField]
        XCTAssertTrue(passwordField.exists, TestFailureMessage.passwordTextFieldNotFound)
        passwordField.tap()
        passwordField.typeText(password)

        let passwordButton = app.buttons[TestIdentifiers.passwordButton]
        XCTAssertTrue(passwordButton.exists, TestFailureMessage.passwordButtonNotFound)
        passwordButton.tap()
    }
    
    func testLoginSuccessFlow() throws {
        try testSetCredentialsForLogin(user: "kminchelle", password: "0lelplR")
        XCTAssertTrue(app.otherElements[TestIdentifiers.homeScreen].waitForExistence(timeout: 4), TestFailureMessage.homeScreenNotFound)
            
        }
 
    
    func testLoginErrorFlow() throws {
        try testSetCredentialsForLogin(user: "f", password: "f")
            let errorAlert = app.alerts["Error"]
            XCTAssertTrue(errorAlert.waitForExistence(timeout: 4), TestFailureMessage.alertError)
            errorAlert.scrollViews.otherElements.buttons["Ok"].tap()
            
    }

    
    func testSavedSession() throws {
       
        let usernameLabel = app.staticTexts[TestIdentifiers.usernameLabel]
        XCTAssertTrue(usernameLabel.exists, TestFailureMessage.usernameLabelNotFound)
       
        let hourLabel = app.staticTexts[TestIdentifiers.hourLabel]
        XCTAssertTrue(hourLabel.exists, TestFailureMessage.hourLabelNotFound)
        
        let dateLabel = app.staticTexts[TestIdentifiers.dateLabel]
        XCTAssertTrue(dateLabel.exists, TestFailureMessage.dateLabelNotFound)
    }
    
    func testEditInformationUser() throws {
        
        app.tabBars["Tab Bar"].buttons["Info"].tap()
    
        app/*@START_MENU_TOKEN@*/.staticTexts["Editar Informacion"]/*[[".buttons[\"Editar Informacion\"].staticTexts[\"Editar Informacion\"]",".buttons[\"editButton\"].staticTexts[\"Editar Informacion\"]",".staticTexts[\"Editar Informacion\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let elementsQuery = app/*@START_MENU_TOKEN@*/.scrollViews/*[[".otherElements[\"editScreen\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements
        let emailField = elementsQuery.textFields["txtEmail"]
        emailField.tap()
        emailField.clearAndEnterText(text: "kminchelle@gmail.com")
        
        let nameField = elementsQuery.textFields["txtName"]
        nameField.tap()
        nameField.clearAndEnterText(text: "Jenny")
        
        let addressField = elementsQuery.textFields["txtAddress"]
        addressField.tap()
        addressField.clearAndEnterText(text: "8 great way street")
        
        
        let cellPhone = elementsQuery.textFields["txtCellPhone"]
        cellPhone.tap()
        cellPhone.clearAndEnterText(text: "+86 999 108 9666")
       
        app/*@START_MENU_TOKEN@*/.scrollViews.otherElements.staticTexts["Guardar"]/*[[".otherElements[\"editScreen\"].scrollViews.otherElements",".buttons[\"Guardar\"].staticTexts[\"Guardar\"]",".buttons[\"saveEditUserButton\"].staticTexts[\"Guardar\"]",".staticTexts[\"Guardar\"]",".scrollViews.otherElements"],[[[-1,4,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Información"].scrollViews.otherElements.buttons["Ok"].tap()
                
    }

}
extension XCUIElement {
    /**
     Removes any current text in the field before typing in the new value
     - Parameter text: the text to enter into the field
     */
    func clearAndEnterText(text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }

        self.tap()

        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)

        self.typeText(deleteString)
        self.typeText(text)
    }
}
