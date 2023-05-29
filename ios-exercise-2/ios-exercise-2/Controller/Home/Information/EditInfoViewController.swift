//
//  EditInfoViewController.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 25/5/23.
//

import UIKit
import SwiftValidator

class EditInfoViewController: UIViewController, AlertView, ValidationDelegate {
   
    
    var userInfo : UserInformation?
    let validator = Validator()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        emailTextField.text = userInfo?.email
        nameTextField.text = userInfo?.firstName
        adressTextField.text = userInfo?.address.address
        phoneTextField.text = userInfo?.phone
        
        validator.registerField(emailTextField, rules: [RequiredRule(), EmailRule(message: "Email inválido")])
        validator.registerField(phoneTextField, rules: [RequiredRule(message: "Telefono requerido"), MinLengthRule(length: 9)])
        validator.registerField(adressTextField, rules: [RequiredRule(message: "Direccion requerida")])
        validator.registerField(nameTextField, rules: [RequiredRule(message: "Nombre requerido")])

    }
   
    
    @IBAction func saveInfoPressed(_ sender: UIButton) {
        validator.validate(self)

    }
    
    
    func validationSuccessful() {
        
        showAlert(title: "Informacion", message: "Informacion guardada con exito") { _ in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func validationFailed(_ errors: [(SwiftValidator.Validatable, SwiftValidator.ValidationError)]) {
        var errorMessagesTotal = ""
        
        for (_, error) in errors {
            errorMessagesTotal.append("\n\(error.errorMessage)")
        
          }
        if !errorMessagesTotal.isEmpty {
            showAlert(title: "Error", message: errorMessagesTotal)
        }
    }
    
}
