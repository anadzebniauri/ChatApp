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
}

let bubbleSenserColor = UIColor(red: 241, green: 241, blue: 241, alpha: 1)
let bubbleRecipientColor = UIColor(red: 218, green: 194, blue: 255, alpha: 1)


extension UIColor {
    var chatColor: UIColor {
        UIColor(red: 123, green: 44, blue: 55, alpha: 1)
    }
}
