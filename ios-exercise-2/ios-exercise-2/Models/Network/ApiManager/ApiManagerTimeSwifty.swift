//
//  ApiManagerTimeSwifty.swift
//  ios-exercise-2
//
//  Created by bayteq on 3/7/23.
//

import Foundation
import Swifty

class ApiManagerTimeSwifty: WebService {

    var delegate : ApiManagerDelegate?
    static var serverURL = "https://worldtimeapi.org/api/timezone"
    static var networkInterface: WebServiceNetworkInterface = Swifty.shared
    
    static func getRequest(urlPart:String) -> NetworkResource {
            return server.get(urlPart)
    }
        
}
