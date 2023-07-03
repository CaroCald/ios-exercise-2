//
//  UserInfo.swift
//  ios-exercise-2
//
//  Created by bayteq on 3/7/23.
//

import Foundation
struct UserInfo : Codable {
    let email: String
    let name: String
    let address : String
    let phone : String
    
    private init(email: String, name: String, address: String, phone: String) {
        self.email = email
        self.name = name
        self.address = address
        self.phone = phone
    }
    
    static func create (email: String?, name: String?, address: String?, phone: String?)  throws -> UserInfo{
        let email = try guardValidEmail(email: email,alert:  Constants.emailValidation)
        let name = try guardValidString(valueString: name,alert:  Constants.nameValidation)
        let address = try guardValidAlphaNumeric(valueString: address,alert:  Constants.addressValidation)
        let phone = try guardValidPhone(phone: phone,alert:  Constants.phoneValidation)
        
        return UserInfo(email: email!, name: name!, address: address!, phone: phone!)
    }
}
