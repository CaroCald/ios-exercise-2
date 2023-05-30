//
//  ApiManager.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 24/5/23.
//

import Foundation

class ApiManager {
    let urlBase =  "https://dummyjson.com/"
    let urlBaseTime = "https://worldtimeapi.org/api/timezone/America/Guayaquil"
    var delegate : ApiManagerDelegate?

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
    
    func performRequest(_ urlString : String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                
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
        
    }
    
   
   
}
