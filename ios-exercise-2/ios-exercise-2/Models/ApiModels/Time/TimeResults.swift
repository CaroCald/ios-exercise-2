//
//  TimeResults.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 25/5/23.
//

import Foundation

// MARK: - TimeResults
struct TimeResults: Codable {
    let abbreviation: String?
    let clientIP: String?
    let datetime: String?
    let dayOfWeek, dayOfYear: Int?
    let dst: Bool?
    let dstFrom: JSONNull?
    let dstOffset: Int?
    let dstUntil: JSONNull?
    let rawOffset: Int?
    let timezone: String?
    let unixtime: Int?
    let utcDatetime: String?
    let utcOffset: String?
    let weekNumber: Int?

}

// MARK: - Encode/decode helpers

class JSONNull: Codable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
