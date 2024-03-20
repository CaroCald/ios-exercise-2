//
//  ProductListViewController.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 26/5/23.
//

import UIKit

class ProductListViewController: UIViewController, AlertView , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewProducts: UITableView!
    var apiManager = ApiManager()
    let productRepository = ProductRepository()
    let spinner = SpinnerViewController()
    var arrayProducts : [Product] = []
    var sessionManager = SessionManager.shared
    
    @IBOutlet weak var addProductBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewProducts.delegate = self
        self.tableViewProducts.dataSource = self
        apiManager.delegate = self
        productRepository.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        createSpinnerView()
        self.addProductBtn.isEnabled = true
        productRepository.getProductsList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.parent?.title = Constants.productTitle

    }
    
    
    @IBAction func addProductPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToAddProduct", sender: self)

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayProducts.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellListProducts", for: indexPath)
        cell.textLabel?.text = arrayProducts[indexPath.row].title
        
        return cell
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

extension ProductListViewController : ApiManagerDelegate {
   
    func apiSucess(_ apiManager: ApiManagerTimeSwifty, data: Data) {
        //
    }
    
    
    func apiError(with error: Error) {
    
        DispatchQueue.main.async {
            self.dismissSpinner()
            self.addProductBtn.isEnabled = false
        }
        
        if let errorReceived = error as? MyError {

            if case .constraintTokenError  = errorReceived {
                showAlert(title: Constants.errorTitle, message: "Error con la peticion, necesita hacer login nuevamente"){ _ in
                    self.sessionManager.closeSession()
                    self.performSegue(withIdentifier: "unwindToViewController", sender: self)
                }
            }else{
                showAlert(title: Constants.errorTitle, message: error.localizedDescription)
            }
          
        }
        else {
            showAlert(title: Constants.errorTitle, message: error.localizedDescription)
        }
       
    }
    
    func apiSucess(_ apiManager: ApiManagerSwifty, data: Data) {
        if let safeData : ProductListResponse? = ApiParser().parseJson(data, delegate: self) {
            arrayProducts = safeData!.products
            DispatchQueue.main.async {
                self.dismissSpinner()
                self.tableViewProducts.reloadData()
            }
        }
    }
    
    func customErrorApi(with error: Data) {
        let safeData : ErrorApi? = ApiParser().parseJson(error, delegate: self)
        DispatchQueue.main.async {
            self.dismissSpinner()
            self.addProductBtn.isEnabled = false
        }
        showAlert(title: Constants.errorTitle, message: safeData?.message ?? "" )
     
    }
    
    
}
