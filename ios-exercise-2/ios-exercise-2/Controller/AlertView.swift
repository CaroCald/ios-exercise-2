//
//  Alert.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 25/5/23.
//

import Foundation

import UIKit

protocol AlertView { }
extension AlertView where Self: UIViewController {
    
    func showAlert(title: String, message: String, customHandler : ((UIAlertAction) -> ())? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: customHandler)
                
        alertController.addAction(okAction)
        
        DispatchQueue.main.async {
            self.view?.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}
