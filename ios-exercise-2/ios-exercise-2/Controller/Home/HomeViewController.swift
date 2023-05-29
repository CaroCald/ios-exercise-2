//
//  HomeViewController.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 25/5/23.
//

import UIKit

class HomeViewController: UIViewController, AlertView {
    var apiManager = ApiManager()
    var sessionManager = SessionManager.shared
    let spinner = SpinnerViewController()


    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.delegate = self
        createSpinnerView()
        apiManager.getTime()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.parent?.title = "Home" 
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

}

extension HomeViewController :  ApiManagerDelegate {
    func apiSucess(_ apiManager: ApiManager, data: Data) {
        if let timeResponse : TimeResults? = ApiParser().parseJson(data, delegate: self) {
            DispatchQueue.main.async {
                self.hourLabel.text = timeResponse?.datetime
                self.dateLabel.text = timeResponse?.utcDatetime
                self.userLabel.text = self.sessionManager.getUserInfo()?.username
                self.dismissSpinner()

            }
            
        }
        
    }
    
    func customErrorApi(with error: Data) {
        let safeData : ErrorApi? = ApiParser().parseJson(error, delegate: self)
        DispatchQueue.main.async {
            self.dismissSpinner()
        }
        showAlert(title: "Error", message: safeData?.message ?? "" )

    }
    
    func apiError(with error: Error) {
        DispatchQueue.main.async {
            self.dismissSpinner()
        }
        showAlert(title: "Error", message: error.localizedDescription)
    }
    
    
   
    
    
}
