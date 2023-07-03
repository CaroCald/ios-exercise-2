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
    
    var apiManager = ApiManager()
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
        authRepo.getInfoLogin(id: sessionManager.getUserInfo()!.id!)
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
                self.userInfo = try UserInfo.create(email: userInfo.email, name: userInfo.firstName, address:userInfo.address.address, phone: userInfo.phone)

         
            }  catch MyError.customError(let errorMessage){
                //handle error
               
                self.showAlert(title: Constants.errorTitle, message: errorMessage)
            } catch {
              
                self.showAlert(title: Constants.errorTitle, message: error.localizedDescription)
            }
            
            self.emailLabel.text = "Email: \(userInfo.email)"
            self.nameLabel.text = "Nombre: \(userInfo.firstName)"
            self.adressLabel.text = "Direccion: \(userInfo.address.address)"
            self.phoneLabel.text = "Telefono: \(userInfo.phone)"
            self.dismissSpinner()
        }
    }

}

extension InfoViewController : ApiManagerDelegate {
    func apiError(with error: Error) {
        DispatchQueue.main.async {
            self.dismissSpinner()
        }
        showAlert(title: Constants.errorTitle, message: error.localizedDescription)
    }
    
    func apiSucess(_ apiManager: ApiManager, data: Data) {
        if let safeData : UserInformation? = ApiParser().parseJson(data, delegate: self) {
            updateUI(userInfo: safeData!)
        }
    }
    
    func customErrorApi(with error: Data) {
        let safeData : ErrorApi? = ApiParser().parseJson(error, delegate: self)
        DispatchQueue.main.async {
            self.dismissSpinner()
        }
        showAlert(title: Constants.errorTitle, message: safeData?.message ?? "" )
    }
    
}
