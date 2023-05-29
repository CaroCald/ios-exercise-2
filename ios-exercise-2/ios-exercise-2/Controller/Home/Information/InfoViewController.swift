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
    var userInfo : UserInformation?
    let spinner = SpinnerViewController()


    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.delegate = self
        authRepo.delegate = self
        createSpinnerView()
        authRepo.getInfoLogin(id: sessionManager.getUserInfo()!.id!)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.parent?.title = "Info"

    }
    
    @IBAction func editInfoPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToEditInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! EditInfoViewController
       dest.userInfo = self.userInfo

    }
    
    @IBAction func closeSessionPressed(_ sender: UIButton) {
        sessionManager.closeSession()
        self.navigationController?.popToRootViewController(animated: true)

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
    
    func updateUI(userInfo : UserInformation){
        DispatchQueue.main.async {
            self.userInfo = userInfo
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
        showAlert(title: "Error", message: error.localizedDescription)
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
        showAlert(title: "Error", message: safeData?.message ?? "" )
    }
    
}
