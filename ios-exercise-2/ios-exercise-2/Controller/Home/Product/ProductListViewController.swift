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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewProducts.delegate = self
        self.tableViewProducts.dataSource = self
        apiManager.delegate = self
        productRepository.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        createSpinnerView()
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
    func apiError(with error: Error) {
        DispatchQueue.main.async {
            self.dismissSpinner()
        }
        showAlert(title: Constants.errorTitle, message: error.localizedDescription)
    }
    
    func apiSucess(_ apiManager: ApiManager, data: Data) {
        if let safeData : ProductList? = ApiParser().parseJson(data, delegate: self) {
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
        }
        showAlert(title: Constants.errorTitle, message: safeData?.message ?? "" )
    }
    
    
}
