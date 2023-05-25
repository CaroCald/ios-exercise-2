//
//  PasswordViewController.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 25/5/23.
//

import UIKit

class PasswordViewController: UIViewController, AlertView {

    @IBOutlet weak var passwordTextField: UITextField!
    var apiManager = ApiManager()
    var sessionManager = SessionManager.shared
    var userName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        apiManager.delegate = self

    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        doLogin()
      

    }
    func doLogin(){
        if passwordTextField.text != nil {
            if !passwordTextField.text!.isEmpty {
               // let user = UserRequest(username: userName, password: passwordTextField.text ?? "")
                let user = UserRequest(username: "kminchelle", password:  "0lelplR")
                apiManager.doLogin(dataUser:user)

            }else {
                showAlert(title: "Error", message: "Ingresa tu contraseña")
            }

        } else {
            showAlert(title: "Error", message: "Ingresa tu contraseña")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let destination = segue.destination as! HomeViewController
            //destination.userName = userTextField.text!
    }

}
extension PasswordViewController : ApiManagerDelegate {
    func customErrorApi(with error: Data) {
        let safeData : ErrorApi? = ApiParser().parseJson(error, delegate: self)
        showAlert(title: "Error", message: safeData?.message ?? "" )

    }
    
    func apiError(with error: Error) {
        showAlert(title: "Error", message: error.localizedDescription)
    }
    
    func apiSucess(_ apiManager: ApiManager, data: Data) {
        let safeData : UserResponse? = ApiParser().parseJson(data, delegate: self)
       // sessionManager.createSession(userData: safeData!)
        print(safeData ?? "default")
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "goToHome", sender: self)

        }
        
        
        //print(sessionManager.getUserInfo()?.lastName)
    }
    
}
extension PasswordViewController : UITextFieldDelegate {
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.endEditing( true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        doLogin()
        passwordTextField.resignFirstResponder()
        passwordTextField.text    = ""
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
