//
//  ApiManagerSwifty.swift
//  ios-exercise-2
//
//  Created by bayteq on 3/7/23.
//

import Foundation
import Swifty

class ApiManagerSwifty: WebService {

    var delegate : ApiManagerDelegate?
    static var serverURL = "https://dummyjson.com"
    static var networkInterface: WebServiceNetworkInterface = Swifty.shared
    
    static func getRequest(urlPart:String) -> NetworkResource {
            return server.get(urlPart)
    }
        
    static func postRequest(with jsonBody: Encodable, urlPart:String) -> NetworkResource {
          return server.post(urlPart)
            .json(encodable: jsonBody)
                       
    }
}
