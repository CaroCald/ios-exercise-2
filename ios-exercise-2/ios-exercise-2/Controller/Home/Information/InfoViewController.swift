//
//  InfoViewController.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 25/5/23.
//

import UIKit

class InfoViewController: UIViewController, AlertView {
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var apiManager = ApiManagerSwifty()
    var authRepo = UserRepository()
    var sessionManager = SessionManager.shared
    var userInfo : UserInfo?
    let spinner = SpinnerViewController()


    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.delegate = self
        authRepo.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        createSpinnerView()
        if  let safeData = sessionManager.getUserInfo()?.id{
            authRepo.getInfoLogin(id: safeData)
        }
        }
        
    
    func createSpinnerView() {
            addChild(spinner)
            spinner.view.frame = view.frame
            view.addSubview(spinner.view)
            spinner.didMove(toParent: self)
        }
        
        func dismissSpinner () {
            self.spinner.willMove(toParent: nil)
            self.spinner.view.removeFromSuperview()
            self.spinner.removeFromParent()
        }
    
    override func viewDidAppear(_ animated: Bool) {
        self.parent?.title = Constants.infoTitle

    }
    
    @IBAction func editInfoPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToEditInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if (segue.identifier == "goToEditInfo") {
            let dest = segue.destination as! EditInfoViewController
           dest.userInfo = self.userInfo
        }
       

    }
    

    func updateUI(userInfo : UserInformation){
        DispatchQueue.main.async {
            
            do {
                self.userInfo = try UserInfo.create(email: userInfo.email, name: userInfo.firstName, address:userInfo.address?.address, phone: userInfo.phone)
              if  let safeData = self.userInfo {
                  self.emailLabel.text = "Email: \(safeData.email)"
                    self.nameLabel.text = "Nombre: \(safeData.name)"
                    self.adressLabel.text = "Direccion: \(safeData.address)"
                    self.phoneLabel.text = "Telefono: \(safeData.phone)"
                }
                
              
                self.dismissSpinner()
         
            }  catch MyError.customError(let errorMessage){               
                self.showAlert(title: Constants.errorTitle, message: errorMessage)
            } catch {
              
                self.showAlert(title: Constants.errorTitle, message: error.localizedDescription)
            }
            
            
        }
    }

}

extension InfoViewController : ApiManagerDelegate {
    func apiSucess(_ apiManager: ApiManagerTimeSwifty, data: Data) {
        //
    }
    
    func apiError(with error: Error) {
        DispatchQueue.main.async {
            self.dismissSpinner()
        }
        showAlert(title: Constants.errorTitle, message: error.localizedDescription)
    }
    
    func apiSucess(_ apiManager: ApiManagerSwifty, data: Data) {
        if let safeData : UserInformation? = ApiParser().parseJson(data, delegate: self) {
            updateUI(userInfo: safeData!)
        }
    }
    
    func customErrorApi(with error: Data) {
        DispatchQueue.main.async {
            self.dismissSpinner()
        }
        if let safeData : ErrorApi? = ApiParser().parseJson(error, delegate: self){
            showAlert(title: Constants.errorTitle, message: safeData?.message ?? "" )
        }
       
        
    }
    
}
