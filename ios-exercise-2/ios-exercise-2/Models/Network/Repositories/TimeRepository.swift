//
//  TimeRepository.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 29/5/23.
//

import Foundation

class TimeRepository : ApiManager {
    func getTime (){
       performRequest(urlBaseTime)
    }
}
