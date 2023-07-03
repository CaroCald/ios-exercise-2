//
//  AuthService.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 26/5/23.
//

import Foundation


class UserRepository : ApiManagerSwifty {


    func doLogin (dataUser : UserRequest){
        let urlString = "auth/login"
            UserRepository.postRequest(with: dataUser, urlPart: urlString).load { networkResponse in

                if let safeData = networkResponse.data {
                   if let httpResponse = networkResponse.response?.statusCode {
                       if httpResponse == 200 {
                           self.delegate?.apiSucess(self, data: safeData)

                       } else {
                           self.delegate?.customErrorApi(with: safeData)

                       }
                    }
                }
                
       
     
        }
        
    }
    
    func getInfoLogin(id : Int){
        let urlString = "users/\(id)"
        UserRepository.getRequest(urlPart: urlString).load { networkResponse in
            if let safeData = networkResponse.data {
               if let httpResponse = networkResponse.response?.statusCode {
                   if httpResponse == 200 {
                       self.delegate?.apiSucess(self, data: safeData)

                   } else {
                       self.delegate?.customErrorApi(with: safeData)

                   }
                }
            }
        }
    }
        
}
