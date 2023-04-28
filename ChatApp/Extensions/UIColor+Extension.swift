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
    
    //MARK: - Typing Area Colors
    static let messageTextBlackColor = UIColor(red: 25, green: 25, blue: 25, alpha: 1) // change name
    static let placeholderTextGreyColor = UIColor(red: 199, green: 199, blue: 199, alpha: 1)
    static let dateLabelTextGreyColor = UIColor(red: 199, green: 199, blue: 199, alpha: 1)
    static let datelabelErrorTextRedColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
    static let typeAreaBorderPurpleColor = UIColor(red: 159, green: 96, blue: 255, alpha: 1)

    //MARK: - Bubble Colors
    static let recipientBubbleColor = UIColor(red: 241, green: 241, blue: 241, alpha: 1)
    static let senderBubbleColor = UIColor(red: 218, green: 195, blue: 255, alpha: 1)
    
    //MARK: - Switcher Colors
    static let switcherLightModeBackgroundColor = UIColor(red: 241, green: 241, blue: 241, alpha: 1) //almost white
    static let switcherDarkModeBackgroundColor = UIColor(red: 46, green: 0, blue: 114, alpha: 1) //dark purple
    static let switcherBackgroundItemViewColor = UIColor(red: 159, green: 96, blue: 256, alpha: 1) //purple
    static let switcherItemViewColor = UIColor(red: 255, green: 202, blue: 85, alpha: 1) //yellow
    static let darkModeBackgroundColor = UIColor(red: 22, green: 0, blue: 57, alpha: 1) //midnight blue
    
    //MARK: - Stack View Background Color
    static let dividerViewYellowBackgroundColor = UIColor(red: 247, green: 206, blue: 127, alpha: 1)

}

