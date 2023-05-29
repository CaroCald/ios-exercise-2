//
//  SessionManager.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 25/5/23.
//

import Foundation

class SessionManager {
    static let shared = SessionManager()
    var userDefaultManager = UserDefaultsManager()
    private init() { }
    
    func createSession (userData : UserResponse) {
        userDefaultManager.saveData(value: userData)
    }
    
    func getUserInfo () -> UserResponse? {
        var infoUser: UserResponse? = nil
        
        do {
            infoUser = try userDefaultManager.getData()
        } catch {
            print("Error")
        }
        return infoUser
    }
    
    func closeSession(){
        userDefaultManager.removeAll()
    }
    
    
}
