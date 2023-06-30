//
//  ProductResponse.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 29/5/23.
//

import Foundation
struct ProductResponse: Codable {
    let id: Int?
    let title: String?
    let price: Int?
    let stock: Int?
    let rating: Int?
    let images: [String]
    let thumbnail: String?
    let description: String?
    let brand: String?
    let category: String?
}
