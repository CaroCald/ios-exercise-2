//
//  UserDefaultsManager.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 25/5/23.
//

import Foundation

class UserDefaultsManager {
    
    let userDefaults = UserDefaults.standard
    let userKey = "userKey"

    func saveData (value : Codable){
        do {
            let encoder = JSONEncoder()

            let data = try encoder.encode(value)

            userDefaults.set(data, forKey: userKey)

        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
    
  
    func getData<T : Decodable>() throws -> T?
    {
        if let data = userDefaults.data(forKey: userKey) {
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
    
    
}
