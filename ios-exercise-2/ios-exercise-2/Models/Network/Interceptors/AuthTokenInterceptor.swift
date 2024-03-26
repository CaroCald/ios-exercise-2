//
//  OAuthTokenAddingInterceptor.swift
//  ios-exercise-2
//
//  Created by bayteq on 19/3/24.
//

import Foundation
import Swifty
class AuthTokenInterceptor: ApiManagerSwifty, ResponseInterceptor {
    let sessionManager = SessionManager.shared

    func intercept(response: NetworkResponse) -> NetworkResponse {
        if let statusCode = response.response?.url, statusCode.absoluteString.contains(Constants.urlStringLogin) {
            
            if let safeResponse = response.data {
                if let safeData : UserResponse? = ApiParser().parseJson(safeResponse) {
                    if let safeToken = safeData?.token {
                        sessionManager.saveToken(token: safeToken)
                    }
                    
                }
            }
           
        }
        
        return response
    }
}
