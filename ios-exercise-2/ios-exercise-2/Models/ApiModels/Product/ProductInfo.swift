//
//  ProductInfo.swift
//  ios-exercise-2
//
//  Created by bayteq on 30/6/23.
//

import Foundation
struct ProductInfo: Codable  {
    
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand : String
    let category: String
    let thumbnail: String
    let images: [String]
    
    private init(id: Int, title: String, description: String, price: Int, discountPercentage: Double, rating: Double, stock: Int, brand: String, category: String, thumbnail: String, images: [String]) {
        self.id = id
        self.title = title
        self.description = description
        self.price = price
        self.discountPercentage = discountPercentage
        self.rating = rating
        self.stock = stock
        self.brand = brand
        self.category = category
        self.thumbnail = thumbnail
        self.images = images
    }
    
    static func create(id: String?, title: String?, description: String?, price: String?, discountPercentage: String?, rating: String?, stock: String?, brand: String?, category: String?, thumbnail: String?, images: [String]?) throws -> ProductInfo {
        
        //validaciones,etc
        let id = try guardValidNumber(valueNumber: id, alert: "Ingresa un valor")
        let title = try guardValidString(valueString: title,alert:  Constants.titleValidation)
        let description = try guardValidString(valueString: description,alert:  Constants.descriptionValidation)
        let price = try guardValidNumber(valueNumber: price,  alert:Constants.priceValidation )
        let discountPercentage = try guardValidNumberDouble(valueNumber: discountPercentage,  alert:Constants.discountValidation)
        let rating = try guardValidNumberDouble(valueNumber: rating,   alert:Constants.ratingValidation)
        let stock = try guardValidNumber(valueNumber: stock,   alert:Constants.stockValidation)
        let brand = try guardValidString(valueString: brand, alert:  Constants.brandValidation)
        let category = try guardValidString(valueString: category, alert:  Constants.categoryValidation)
        let thumbnail = try guardValidUrl(url: thumbnail, alert:  Constants.urlValidation)
        let images = try guardValidUrlImages(url: images,   alert:Constants.urlValidation)
        
        
        return ProductInfo(id: id!, title: title!, description: description!, price: price!, discountPercentage: discountPercentage!, rating: rating!, stock: stock!, brand: brand!, category: category!, thumbnail: thumbnail!, images:images!)
    }
    
    
    
    
}

