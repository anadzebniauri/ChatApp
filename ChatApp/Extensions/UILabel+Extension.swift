//
//  UILabel+Extension.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 07.05.23.
//

import UIKit
import CoreData

//extension UILabel {
//    func setUpDateFormatter() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMM dd, h:mm "
//        let currentDateTime = Date()
//        let dateTimeString = dateFormatter.string(from: currentDateTime)
//        self.text = dateTimeString
//        textColor = Constants.dateLabelTextGreyColor
//        return dateTimeString
//    }
//
//    func setUpErrorText() {
//        self.text = "არ გაიგზავნა"
//        textColor = Constants.dateLabelErrorTextRedColor
//    }
//}

enum Constants {
    static let dateLabelTextGreyColor = UIColor(red: 199, green: 199, blue: 199, alpha: 1)
    static let dateLabelErrorTextRedColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
}
