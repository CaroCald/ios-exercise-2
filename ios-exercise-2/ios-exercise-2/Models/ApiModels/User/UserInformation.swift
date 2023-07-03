//
//  UserInformation.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 26/5/23.
//

import Foundation

// MARK: - UserInformation
struct UserInformation: Codable {
    let id: Int?
    let firstName: String?
    let  lastName: String?
    let maidenName: String?
    let age: Int?
    let gender: String?
    let  email: String?
    let  phone: String?
    let  username: String?
    let password : String?
    let birthDate: String?
    let image: String?
    let bloodGroup: String?
    let height: Int?
    let weight: Double
    let eyeColor: String?
    let hair: Hair?
    let domain: String?
    let ip: String?
    let address: Address?
    let macAddress: String?
    let university: String?
    let bank: Bank?
    let company: Company?
    let ein: String?
    let ssn: String?
    let userAgent: String?
}

// MARK: - Address
struct Address: Codable {
    let address: String?
    let city: String?
    let coordinates: Coordinates?
    let postalCode: String?
    let state: String?
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let lat: Double
    let lng: Double
}

// MARK: - Bank
struct Bank: Codable {
    let cardExpire: String?
    let cardNumber: String?
    let cardType: String?
    let currency: String?
    let iban: String?
}

// MARK: - Company
struct Company: Codable {
    let address: Address
    let department: String?
    let name: String?
    let title: String?
}

// MARK: - Hair
struct Hair: Codable {
    let color: String?
    let type: String?
}

