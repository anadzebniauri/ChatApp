//
//  UIStackView+Extension.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 27.04.23.
//

import UIKit

extension UIStackView {
    
    func addBackground(color: UIColor){
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
