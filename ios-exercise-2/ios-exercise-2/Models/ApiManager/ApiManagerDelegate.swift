//
//  ApiManagerDelegate.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 24/5/23.
//

import Foundation

protocol ApiManagerDelegate {
    
    func apiError(with error : Error)
    func apiSucess(_ apiManager : ApiManager , data : Data)
    func customErrorApi(with error : Data)
}
