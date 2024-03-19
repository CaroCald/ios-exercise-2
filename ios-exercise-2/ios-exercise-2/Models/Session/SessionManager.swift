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
        userDefaultManager.saveData(value: userData, key: UserDefaults.Keys.userKey.rawValue)
    }
    
    func saveToken (token : String) {
        userDefaultManager.saveString(value: token, key: UserDefaults.Keys.tokenKey.rawValue)
    }
    
    func getUserInfo () -> UserResponse? {
        var infoUser: UserResponse? = nil
        
        do {
            infoUser = try userDefaultManager.getData(key: UserDefaults.Keys.userKey.rawValue)
        } catch {
            print("Error")
        }
        return infoUser
    }
    
    func getToken() -> String {
        return userDefaultManager.getString(key: UserDefaults.Keys.tokenKey.rawValue)
    }
    
    func saveRefreshToken (token : String) {
        userDefaultManager.saveString(value: token, key: UserDefaults.Keys.refreshTokenKey.rawValue)
    }
    
    func getTokenRefresh() -> String {
        return userDefaultManager.getString(key: UserDefaults.Keys.refreshTokenKey.rawValue)
    }
    
    func closeSession(){
        userDefaultManager.removeAll()
    }
    

    
}
