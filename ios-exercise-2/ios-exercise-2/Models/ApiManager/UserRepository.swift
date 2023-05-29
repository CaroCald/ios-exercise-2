//
//  AuthService.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 26/5/23.
//

import Foundation


class UserRepository : ApiManager {
        
    func doLogin (dataUser : UserRequest){
        let urlString = "\(urlBase)auth/login"
        performPost(urlString, message: dataUser)
    }
    
    func getInfoLogin(id : Int){
        let urlString = "\(urlBase)users/\(id)"
        performRequest(urlString)
    }
        
}
