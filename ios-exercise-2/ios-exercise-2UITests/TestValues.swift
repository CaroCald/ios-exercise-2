//
//  TestValues.swift
//  ios-exercise-2UITests
//
//  Created by bayteq on 25/3/24.
//

import Foundation
struct AccessibilityIdentifier {
   
    static let welcomeLabel = "welcomeLabel"
    static let userTextField = "txtUser"
    static let userButton = "btnUserContinue"
    static let passwordScreen = "passwordScreen"
    static let passwordTextField = "txtPassword"
    static let passwordButton = "btnPasswordContinue"
    static let homeScreen = "homeScreen"
    static let usernameLabel = "usernameLabel"
    static let hourLabel = "hourLabel"
    static let dateLabel = "dateLabel"
}

struct TestFailureMessage {

    static let welcomeLabelNotFound = "Label welcome not found"
    static let userTextFieldlNotFound = "User text field not found"
    static let userButtonNotFound = "User button continue not found"
    static let passwordScreenNotFound = "Password screen not found"
    static let passwordTextFieldNotFound = "Password text field not found"
    static let passwordButtonNotFound = "Password button continue not found"
    static let homeScreenNotFound = "Home screen not found"
    static let usernameLabelNotFound = "User label not found"
    static let hourLabelNotFound = "Hour label not found"
    static let dateLabelNotFound = "Date label not found"
}
