//
//  HomeViewController.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 25/5/23.
//

import UIKit

class HomeViewController: UIViewController, AlertView {
    var apiManager = ApiManagerTimeSwifty()
    var sessionManager = SessionManager.shared
    let timeRepository = TimeRepository()
    let spinner = SpinnerViewController()


    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.delegate = self
        timeRepository.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        createSpinnerView()
        timeRepository.getTime()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.parent?.title = Constants.homeTitle
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

extension HomeViewController :  ApiManagerDelegate{
    
    func apiSucess(_ apiManager: ApiManagerSwifty, data: Data) {
        //
    }
    
    
    func apiSucess(_ apiManager: ApiManagerTimeSwifty, data: Data) {
        if let timeResponse : TimeResults? = ApiParser().parseJson(data, delegate: self) {
            if let dateInitial = timeResponse?.datetime?.toDate() {
                DispatchQueue.main.async {
                    self.dateLabel.text = dateInitial.toString()
                    self.hourLabel.text = dateInitial.toString(withFormat: "HH:mm:ss")
                    self.userLabel.text = self.sessionManager.getUserInfo()?.username
                    self.dismissSpinner()

                }
            }
        }
        
    }
    
    func customErrorApi(with error: Data) {
        if let safeData : ErrorApi? = ApiParser().parseJson(error, delegate: self) {
            DispatchQueue.main.async {
                self.dismissSpinner()
            }
            showAlert(title: Constants.errorTitle, message: safeData?.message ?? "" )
        }
       

    }
    
    func apiError(with error: Error) {
        DispatchQueue.main.async {
            self.dismissSpinner()
        }
        showAlert(title: Constants.errorTitle, message: error.localizedDescription)
    }
    
    
}
