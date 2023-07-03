//
//  ProductRepository.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 29/5/23.
//

import Foundation

class ProductRepository : ApiManager {
    
    func getProductsList(){
        let urlString = "\(urlBase)products"
        performRequest(urlString)
    }
    
    func addProduct(product : ProductInfo){
        let urlString = "\(urlBase)products/add"
        performPost(urlString, message: product)
    }
}
