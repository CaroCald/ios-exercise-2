//
//  TimeRepository.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 29/5/23.
//

import Foundation

class TimeRepository : ApiManagerTimeSwifty{
    
    func getTime (){
        TimeRepository.getRequest(urlPart: "America/Guayaquil").load { networkResponse in
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
