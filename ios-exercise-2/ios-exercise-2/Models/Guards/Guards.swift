//
//  Guards.swift
//  ios-exercise-2
//
//  Created by bayteq on 3/7/23.
//

import Foundation

public func guardValidString(valueString: String?,  alert: String) throws -> String? {
    
        if let valueString = valueString {
            guard valueString.containsOnlyLetters else {

                throw MyError.customError(message: alert)
            }
        }
        return valueString
 }


public  func guardValidNumber(valueNumber: String?,  alert: String) throws -> Int? {
    
    if let valueNumber = valueNumber {
        guard valueNumber.containsOnlyDigits && !valueNumber.isEmpty else {

            throw MyError.customError(message: alert)
        }
    }
    return Int(valueNumber!)

 }

public  func guardValidNumberDouble(valueNumber: String?,  alert: String) throws -> Double? {
    
    if let valueNumber = valueNumber {
        guard valueNumber.containsOnlyDigits && !valueNumber.isEmpty  else {

            throw MyError.customError(message: alert)
        }
    }
    return Double(valueNumber!)
 }
public func guardValidUrlImages(url: [String]?,  alert: String) throws -> [String]?{
    
    if let url = url{
        
            for urls in url {
                guard urls.isValidURL else{
                    throw MyError.customError(message: alert)
                }
            }
        
    }
       
    
    return url
 }
public func guardValidUrl(url: String?,  alert: String) throws -> String?{
    
    if let url = url{
        
        guard url.isValidURL else{
            throw MyError.customError(message: alert)
        }
        
    }
       
    
    return url
 }

public func guardValidEmail(email: String?,  alert: String) throws -> String?{
    
    if let email = email{
        
        guard email.isValidEmail else{
            throw MyError.customError(message: alert)
        }
        
    }
       
    
    return email
 }


public func guardValidPhone(phone: String?,  alert: String) throws -> String?{
    
    if let phone = phone{
        
        guard phone.removeWhitespace().isValidPhoneNumber else{
            throw MyError.customError(message: alert)
        }
        
    }
       
    
    return phone
 }

public func guardValidAlphaNumeric(valueString: String?,  alert: String) throws -> String?{
    
    if let valueString = valueString{
        
        guard !valueString.isEmpty else{
            throw MyError.customError(message: alert)
        }
        
    }
       
    
    return valueString
 }
