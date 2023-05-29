//
//  EditInfoViewController.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 25/5/23.
//

import UIKit

class EditInfoViewController: UIViewController, AlertView {
    
    var userInfo : UserInformation?
    
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

    }
    
    
    @IBAction func saveInfoPressed(_ sender: UIButton) {
        
        showAlert(title: "Informacion", message: "Informacion guardada con exito")
    }
    
    
    
    
}
