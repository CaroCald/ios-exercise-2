//
//  RefreshTokenInterceptor.swift
//  ios-exercise-2
//
//  Created by bayteq on 19/3/24.
//

import Foundation
import Swifty
class RefreshTokenInterceptor: RequestInterceptor {
    let sessionManager = SessionManager.shared
    func intercept(resource: NetworkResource) -> NetworkResource {
        
        let token = sessionManager.getToken()
        resource.header(key: "Authorization", value: "Bearer \(token)")
        
        return resource
    }

}
