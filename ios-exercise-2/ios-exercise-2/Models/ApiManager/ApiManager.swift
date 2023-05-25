//
//  ApiManager.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 24/5/23.
//

import Foundation

struct ApiManager {
    let urlBase =  "https://dummyjson.com/"
    var delegate : ApiManagerDelegate?
    
    func doLogin (dataUser : UserRequest){
        let urlString = "\(urlBase)auth/login"
        
        performPost(urlString, message: dataUser)

    }
    
    func performPost(_ urlString : String, message: Encodable) {
        do {
            if let url = URL(string: urlString) {
                
                let session = URLSession(configuration: .default)
                var request = URLRequest(
                           url: url,
                           cachePolicy: .reloadIgnoringLocalCacheData
                       )
                       
               request.httpMethod = "POST"
               request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
                let encoder = JSONEncoder()
                
               let body = try encoder.encode(message)
               request.httpBody = body
                
                let task = session.dataTask(with: request) { data, response, error in
                    
                    if error != nil{
                        self.delegate?.apiError(with: error!)
                        return
                    }
                    
                    if let safeData = data {
                       if let httpResponse = response as? HTTPURLResponse {
                           if httpResponse.statusCode == 200 {
                               self.delegate?.apiSucess(self, data: safeData)

                           } else {
                               self.delegate?.customErrorApi(with: safeData)

                           }
                        }
                    }
                }
                task.resume()
            }
        } catch {
            self.delegate?.apiError(with: error)
            return

        }
        
        
    }
    
   
}
