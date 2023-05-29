//
//  ViewController.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 24/5/23.
//

import UIKit

class ViewController: UIViewController, AlertView {
    let sessionManager = SessionManager.shared
 
    @IBOutlet weak var userTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.delegate = self
    
        if sessionManager.getUserInfo() != nil {
            self.performSegue(withIdentifier: "goToHome", sender: self)
        }
    }
    
    

    @IBAction func continueButtonPressed(_ sender: UIButton) {
       continueFlow()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToHome") {
            let destination = segue.destination as! UITabBarController
            destination.navigationItem.hidesBackButton = true
            
        } else {
            let destination = segue.destination as! PasswordViewController
            destination.userName = userTextField.text!
        }
       
    }
    
    func continueFlow() {
        if userTextField.text != nil {
            if !userTextField.text!.isEmpty {
                performSegue(withIdentifier: "goToPassword", sender: self)

            }else {
                showAlert(title: "Error", message: "Ingresa un usuario")
            }

        } else {
            showAlert(title: "Error", message: "Ingresa un usuario")
        }
    }
    
}

extension ViewController : UITextFieldDelegate {
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userTextField.endEditing( true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        continueFlow()
        userTextField.resignFirstResponder()
        userTextField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return  true
        } else {
            textField.placeholder = "Ingresa un usuario"
            return false
        }
    }
}
