//
//  SpinnerViewController.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 26/5/23.
//

import UIKit

class SpinnerViewController: UIViewController {

    var spinner = UIActivityIndicatorView()

        override func loadView() {
            view = UIView()
            view.backgroundColor = UIColor(white: 0, alpha: 0.6)
            spinner.color = UIColor.white
            spinner.translatesAutoresizingMaskIntoConstraints = false
            spinner.startAnimating()
            view.addSubview(spinner)

            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
    
    

}

