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
        let notAlphanumeric = NSCharacterSet.whitespaces.inverted
        return rangeOfCharacter(from: notAlphanumeric, options: String.CompareOptions.literal, range: nil) == nil
    }
    
    var isValidEmail: Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

           let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
           return emailTest.evaluate(with: self)
       
    
    }
    
    var isValidPhoneNumber: Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
                let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
                return phoneTest.evaluate(with: self)
       }
    
    var isValidURL: Bool {
           guard !contains("..") else { return false }
       
           let head     = "((http|https)://)?([(w|W)]{3}+\\.)?"
           let tail     = "\\.+[A-Za-z]{2,3}+(\\.)?+(/(.)*)?"
           let urlRegEx = head+"+(.)+"+tail
       
           let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)

           return urlTest.evaluate(with: trimmingCharacters(in: .whitespaces))
       }
    func replace(string:String, replacement:String) -> String {
            return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
        }

        func removeWhitespace() -> String {
            return self.replace(string: " ", replacement: "")
        }
    
}
