//
//  UIColor+Extension.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 19.04.23.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        self.init(
            red: CGFloat(red)/255,
            green: CGFloat(green)/255,
            blue: CGFloat(blue)/255,
            alpha: alpha
        )
    }
    
    static let messageTextColor = UIColor(red: 25, green: 25, blue: 25, alpha: 1)
    static let dateTextColor = UIColor(red: 199, green: 199, blue: 199, alpha: 1)
    static let typeAreaBoaderColor = UIColor(red: 159, green: 96, blue: 255, alpha: 1)
    static let recipientColor = UIColor(red: 241, green: 241, blue: 241, alpha: 1)
    static let senderColor = UIColor(red: 218, green: 195, blue: 255, alpha: 1)
}

