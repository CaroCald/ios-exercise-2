//
//  EditInfoViewController.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 25/5/23.
//

import UIKit
import SwiftValidator

class EditInfoViewController: UIViewController, AlertView {
   
    
    var userInfo : UserInfo?
    let validator = Validator()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        emailTextField.text = userInfo?.email
        nameTextField.text = userInfo?.name
        adressTextField.text = userInfo?.address
        phoneTextField.text = userInfo?.phone
        

    }
   
    
    @IBAction func saveInfoPressed(_ sender: UIButton) {
        validationSuccessful()

    }
    
    
    func validationSuccessful() {
        do {
            let email = emailTextField.text ?? ""
            let name =  nameTextField.text  ?? ""
            let adress =  adressTextField.text ?? ""
            let phone = phoneTextField.text  ?? ""
           
            _ =  try UserInfo.create(email: email, name: name, address: adress, phone: phone)
            
            showAlert(title: Constants.infoTitle, message: Constants.infoSuccess) { _ in
                self.navigationController?.popViewController(animated: true)
            }
     
        }  catch MyError.customError(let errorMessage){
            //handle error
          
            showAlert(title: Constants.errorTitle, message: errorMessage)
        } catch {
            
            showAlert(title: Constants.errorTitle, message: error.localizedDescription)
        }
        
      
    }
    
    
    
}
