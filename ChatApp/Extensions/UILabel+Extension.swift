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
    }
}
