//
//  Date+Extension.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 10.06.23.
//

import Foundation

extension Date {
    var stringRepresentation: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, h:mm"
        let date = dateFormatter.string(from: self)
        return date
    }
}
