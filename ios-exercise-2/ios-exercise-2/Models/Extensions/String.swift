//
//  String.swift
//  ios-exercise-2
//
//  Created by bayteq on 30/6/23.
//

import Foundation
extension String {
    var containsOnlyDigits: Bool {
        let notDigits = NSCharacterSet.decimalDigits.inverted
        return rangeOfCharacter(from: notDigits, options: String.CompareOptions.literal, range: nil) == nil
    }
    
    var containsOnlyLetters: Bool {
        let notLetters = NSCharacterSet.letters.inverted
        return rangeOfCharacter(from: notLetters, options: String.CompareOptions.literal, range: nil) == nil
    }
    
    var isAlphanumeric: Bool {
        let notAlphanumeric = NSCharacterSet.decimalDigits.union(NSCharacterSet.letters).inverted
        return rangeOfCharacter(from: notAlphanumeric, options: String.CompareOptions.literal, range: nil) == nil
    }
    
    var isValidEmail: Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

           let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
           return emailTest.evaluate(with: self)
       }
    var isValidPhoneNumber: Bool {
            let regEx = "^\\+(?:[0-9]?){6,14}[0-9]$"

            let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
            return phoneCheck.evaluate(with: self)
    }
    
    
    var isValidURL: Bool {
           guard !contains("..") else { return false }
       
           let head     = "((http|https)://)?([(w|W)]{3}+\\.)?"
           let tail     = "\\.+[A-Za-z]{2,3}+(\\.)?+(/(.)*)?"
           let urlRegEx = head+"+(.)+"+tail
       
           let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)

           return urlTest.evaluate(with: trimmingCharacters(in: .whitespaces))
       }
}
