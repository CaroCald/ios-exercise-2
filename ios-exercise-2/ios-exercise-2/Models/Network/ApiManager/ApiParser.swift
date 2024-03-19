//
//  ApiParser.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 24/5/23.
//

import Foundation

struct ApiParser {
    
    func parseJson <T : Decodable> (_ data : Data, delegate : ApiManagerDelegate) -> T? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData =  try decoder.decode(T.self, from: data)
            return decodedData
            
        } catch {
            delegate.apiError(with: error)
            return nil
        }
        
    }
    
    func parseJson <T : Decodable> (_ data : Data) -> T? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData =  try decoder.decode(T.self, from: data)
            return decodedData
            
        } catch {
            return nil
        }
        
    }
    
}
