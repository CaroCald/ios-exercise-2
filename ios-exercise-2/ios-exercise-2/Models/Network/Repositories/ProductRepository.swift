//
//  ProductRepository.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 29/5/23.
//

import Foundation

class ProductRepository : ApiManagerSwifty {
    
    func getProductsList(){
        let urlString = "products"
        ProductRepository.getRequest(urlPart: urlString, canUseConstraint: true).load { networkResponse in
            if let safeData = networkResponse.data {
                if let httpResponse = networkResponse.response?.statusCode {
                    if httpResponse == 200 {
                        self.delegate?.apiSucess(self, data: safeData)
                        
                    } else {
                        self.delegate?.customErrorApi(with: safeData)
                        
                    }
                }
            }
        }
    }
    
    func addProduct(product : ProductInfo){
        let urlString = "products/add"
        ProductRepository.postRequest(with: product, urlPart: urlString).load { networkResponse in
            
            if let safeData = networkResponse.data {
                if let httpResponse = networkResponse.response?.statusCode {
                    if httpResponse == 200 {
                        self.delegate?.apiSucess(self, data: safeData)
                        
                    } else {
                        self.delegate?.customErrorApi(with: safeData)
                        
                    }
                }
            }
        }
    }
}
