//
//  UserResponse.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 24/5/23.
//

import Foundation

struct UserResponse : Codable {
    
    let id: Int?
    let username: String?
    let email: String?
    let firstName: String?
    let lastName: String?
    let gender: String?
    let image: String?
    let token: String?
    
    
}
