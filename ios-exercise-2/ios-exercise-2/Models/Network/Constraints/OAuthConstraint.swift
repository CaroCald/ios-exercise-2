//
//  OAuthConstraint.swift
//  ios-exercise-2
//
//  Created by bayteq on 19/3/24.
//

import Foundation
import Swifty
class OAuthConstraint: Constraint {
    let sessionManager = SessionManager.shared
    
    static var refreshToken: String?
    
    override func isConstraintSatisfied(for resource: NetworkResource) -> Bool {
        if let _ = OAuthConstraint.refreshToken {
                   return true
               }
               
               return false
    }
    
    override func satisfyConstraint(for resource: NetworkResource) {
        ApiManagerSwifty.getRequest(urlPart: "auth/me", canUseConstraint: false).load { networkResponse in
            if let safeData = networkResponse.data {
                if let httpResponse = networkResponse.response?.statusCode {
                    if httpResponse == 200 {
                        if let safeDataAuth : UserResponse? = ApiParser().parseJson(safeData) {
                           
                            OAuthConstraint.refreshToken = safeDataAuth!.firstName
                            self.finish(with: nil)
                        }
                       
                    } else {
                        self.finish(with: MyError.customError(message: "ocurrio un error con la peticion"))
                        
                    }
                }
            }
        }
    }
}
