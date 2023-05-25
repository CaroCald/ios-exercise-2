//
//  User.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 24/5/23.
//

import Foundation

struct UserRequest : Codable {
    
    let username : String
    let password : String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    
}
