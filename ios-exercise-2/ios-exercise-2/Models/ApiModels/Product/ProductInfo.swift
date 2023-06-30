//
//  ProductInfo.swift
//  ios-exercise-2
//
//  Created by bayteq on 30/6/23.
//

import Foundation
struct ProductInfo{
    
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
    
    static func create(id: Int?, title: String?, description: String?, price: Int?, discountPercentage: Double?, rating: Double?, stock: Int?, brand: String?, category: String?, thumbnail: String?, images: [String?]) throws -> ProductInfo {
        
        //validaciones longitus,etc
        let id = try guardValidNumber(valueNumber: id)
        let price = try guardValidNumber(valueNumber: price)
        let title = try guardValidString(valueString: title)
        let description = try guardValidString(valueString: description)
        let brand = try guardValidString(valueString: brand)
        let category = try guardValidString(valueString: category)
        let thumbnail = try guardValidString(valueString: thumbnail)
        
        return ProductInfo(id: id!, title: title!, description: description!, price: price!, discountPercentage: 2.5, rating: 2.5, stock: 1, brand: brand!, category: category!, thumbnail: thumbnail!, images: [])
    }
    
    private static func guardValidString(valueString: String?) throws -> String? {
        
            if let valueString = valueString {
                guard valueString.containsOnlyLetters else {

                    throw MyError.customError(message: "Por favor ingresa solo letras")
                }
            }
            return valueString
     }
    
  
    private static func guardValidNumber(valueNumber: Int?) throws -> Int? {
        
            if valueNumber == nil {
                throw MyError.customError(message: "Por favor ingresa un valor")
            }
            return valueNumber
     }
    
    
    public enum MyError: Error {

        case genericError

        case customError(message: String)

        case noConnection

        case unknown

    }
}
protocol validNumber {
    func validInt(value: Int? )
    func validDouble(value: Double?)
}
