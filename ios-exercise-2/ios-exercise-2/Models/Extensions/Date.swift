//
//  String.swift
//  ios-exercise-2
//
//  Created by Carolina Calderon on 29/5/23.
//

import Foundation
extension String {

    func toDate()-> Date?{

        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [
            .withInternetDateTime,
            .withFractionalSeconds
        ]
        let date = dateFormatter.date(from: self)
        return date

    }
}

extension Date {

    func toString(withFormat format: String = "dd/MM/yyyy") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}
