//
//  UIViewControllerExtension.swift
//  ios-exercise-2Tests
//
//  Created by bayteq on 26/3/24.
//

import Foundation
import UIKit

extension UIViewController {
    static var identifier : String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
