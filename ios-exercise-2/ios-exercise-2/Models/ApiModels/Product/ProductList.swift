//
//  Product.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 24/5/23.
//

import Foundation

struct ProductList: Codable {
    let products: [Product]
    let total: Int?
    let skip: Int?
    let limit: Int?
}

// MARK: - Product
struct Product: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let price: Int?
    let discountPercentage: Double?
    let rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?
}

