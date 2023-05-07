//
//  UILabel+Extension.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 07.05.23.
//

import UIKit

extension UILabel {
    
    func setUpDateFormatter() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, h:mm "
        let currentDateTime = Date()
        let dateTimeString = dateFormatter.string(from: currentDateTime)
        self.text = dateTimeString
    }
    func setUpErrorText() {
        self.text = "არ გაიგზავნა"
        self.textColor = Colors.dateLabelErrorTextRedColor
    }
}

private extension UILabel {
    enum Colors {
        static let dateLabelTextGreyColor = UIColor(red: 199, green: 199, blue: 199, alpha: 1)
        static let dateLabelErrorTextRedColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
    }
}
