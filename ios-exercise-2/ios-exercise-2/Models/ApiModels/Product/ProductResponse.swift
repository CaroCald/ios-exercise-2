//
//  ProductResponse.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 29/5/23.
//

import Foundation
struct ProductResponse: Codable {
    let id: Int
    let title: String
    let price, stock, rating: Int
    let images: [String]
    let thumbnail, description, brand, category: String
}
