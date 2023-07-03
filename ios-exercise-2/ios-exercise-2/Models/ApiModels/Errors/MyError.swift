//
//  MyError.swift
//  ios-exercise-2
//
//  Created by bayteq on 3/7/23.
//

import Foundation
public enum MyError: Error {

    case genericError

    case customError(message: String)

    case noConnection

    case unknown

}
