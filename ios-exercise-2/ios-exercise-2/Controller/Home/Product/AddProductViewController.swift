//
//  AddProductViewController.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 25/5/23.
//

import UIKit
import SwiftValidator

class AddProductViewController: UIViewController, AlertView {

    let productRepository = ProductRepository()
    let validator = Validator()
    var apiManager = ApiManager()
    let spinner = SpinnerViewController()

    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var discountTextField: UITextField!
    @IBOutlet weak var raitingTextFiedl: UITextField!
    @IBOutlet weak var stockTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var categoryTextFiedl: UITextField!
    @IBOutlet weak var urlTextFiedl: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.delegate = self
        productRepository.delegate = self


    }
    

    @IBAction func addProductPressed(_ sender: UIButton) {
        validationSuccessful()

    }
    
    func validationSuccessful() {
        createSpinnerView()

        do {
            let title = titleTextField.text ?? ""
            let description = descriptionTextField.text ?? ""
            let price = priceTextField.text ?? ""
            let discountPercentage = discountTextField.text ?? ""
            let rating = raitingTextFiedl.text ?? ""
            let stock = stockTextField.text ?? ""
            let brand = brandTextField.text ?? ""
            let category = categoryTextFiedl.text ?? ""
            let thumbnail = urlTextFiedl.text ?? ""
            
            let productData =  try ProductInfo.create(id: "1", title:title, description:description, price:price, discountPercentage: discountPercentage, rating: rating, stock: stock, brand:brand, category: category, thumbnail: thumbnail, images: [thumbnail])
            productRepository.addProduct(product: productData)
     
        }  catch MyError.customError(let errorMessage){
            //handle error
            DispatchQueue.main.async {
                self.dismissSpinner()
            }
            showAlert(title: Constants.errorTitle, message: errorMessage)
        } catch {
            DispatchQueue.main.async {
                self.dismissSpinner()
            }
            showAlert(title: Constants.errorTitle, message: error.localizedDescription)
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
    
}
extension AddProductViewController : ApiManagerDelegate {
    func apiError(with error: Error) {
        DispatchQueue.main.async {
            self.dismissSpinner()
        }
        showAlert(title: Constants.errorTitle, message: error.localizedDescription)
    }
    
    func apiSucess(_ apiManager: ApiManager, data: Data) {
    
        if let safeData : ProductResponse? = ApiParser().parseJson(data, delegate: self) {
            print(safeData!)
            showAlert(title: Constants.infoTitle, message: Constants.productSucess) { _ in
                self.navigationController?.popViewController(animated: true)
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
