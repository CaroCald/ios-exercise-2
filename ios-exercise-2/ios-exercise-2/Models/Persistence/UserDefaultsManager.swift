//
//  UserDefaultsManager.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 25/5/23.
//

import Foundation

class UserDefaultsManager {
    
    let userDefaults = UserDefaults.standard


    func saveData (value : Codable, key: String){
        do {
            let encoder = JSONEncoder()

            let data = try encoder.encode(value)

            userDefaults.set(data, forKey: key)

        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
    
  
    func getData<T : Decodable>(key: String) throws -> T?
    {
        if let data = userDefaults.data(forKey: key) {
            do {
                let decoder = JSONDecoder()
                let valueFinal = try decoder.decode(T.self, from: data)
                return valueFinal
            } catch {
                print("Unable to Decode Note (\(error))")
                return nil
            }
        }
        return nil
    }
    
    func removeAll () {
        userDefaults.reset()
   
    }
    func saveString(value : String, key: String){
        userDefaults.set(value, forKey: key)
    }
    func getString(key: String) -> String {
        return userDefaults.string(forKey:key) ??  ""
    }
    
    
}

extension UserDefaults {

    
    enum Keys: String, CaseIterable{

        case userKey
        case tokenKey
        case refreshTokenKey

    }
    func reset() {
            Keys.allCases.forEach { removeObject(forKey: $0.rawValue) }
        }
}
