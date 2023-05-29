//
//  AddProductViewController.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 25/5/23.
//

import UIKit
import SwiftValidator

class AddProductViewController: UIViewController, ValidationDelegate, AlertView {

    let productRepository = ProductRepository()
    let validator = Validator()
    var apiManager = ApiManager()
    let spinner = SpinnerViewController()

    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var productTextField: UITextField!
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

        validator.registerField(titleTextField, rules: [RequiredRule(message: "Titulo requerido")])
        validator.registerField(descriptionTextField, rules: [RequiredRule(message: "Descripcion requerido")])
        validator.registerField(productTextField, rules: [RequiredRule(message: "Producto requerido")])
        validator.registerField(priceTextField, rules: [RequiredRule(message: "Precio requerido")])
        validator.registerField(discountTextField, rules: [RequiredRule(message: "Descuento requerido")])
        validator.registerField(raitingTextFiedl, rules: [RequiredRule(message: "Raiting requerido")])
        validator.registerField(stockTextField, rules: [RequiredRule(message: "Stock requerido")])
        validator.registerField(brandTextField, rules: [RequiredRule(message: "Marca requerido")])
        validator.registerField(urlTextFiedl, rules: [RequiredRule(message: "Url requerido")])


    }
    

    @IBAction func addProductPressed(_ sender: UIButton) {
        validator.validate(self)
        createSpinnerView()

    }
    
    func validationSuccessful() {
        let productData = Product( id: 1, title: titleTextField.text!, description: descriptionTextField.text!, price: Int(priceTextField.text!)!, discountPercentage: Double(discountTextField.text!)!, rating: Double(raitingTextFiedl.text!)!, stock: Int(stockTextField.text!)!, brand: brandTextField.text!, category: categoryTextFiedl.text!, thumbnail: urlTextFiedl.text!, images: [urlTextFiedl.text!])
        print(productData)
        productRepository.addProduct(product: productData)
       
    }
    
    func validationFailed(_ errors: [(SwiftValidator.Validatable, SwiftValidator.ValidationError)]) {
        var errorMessagesTotal = ""
        
        for (_, error) in errors {
            errorMessagesTotal.append("\n\(error.errorMessage)")
        
          }
        if !errorMessagesTotal.isEmpty {
            showAlert(title: "Error", message: errorMessagesTotal)
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
        showAlert(title: "Error", message: error.localizedDescription)
    }
    
    func apiSucess(_ apiManager: ApiManager, data: Data) {
    
        if let safeData : ProductResponse? = ApiParser().parseJson(data, delegate: self) {
            print(safeData!)
            showAlert(title: "Informacion", message: "Producto agregado con exito") { _ in
                self.navigationController?.popViewController(animated: true)
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
    
}
