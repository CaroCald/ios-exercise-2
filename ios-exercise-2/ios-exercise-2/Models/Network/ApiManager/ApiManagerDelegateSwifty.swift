//
//  ApiManagerDelegateSwifty.swift
//  ios-exercise-2
//
//  Created by bayteq on 3/7/23.
//

import Foundation
protocol ApiManagerDelegateSwifty {
    
    func apiError(with error : Error)
    func apiSucess(_ apiManager : ApiManagerSwifty , data : Data)
    func customErrorApi(with error : Data)
}
