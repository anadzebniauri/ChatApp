//
//  DividerView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 28.04.23.
//

import UIKit

class DividerView: UIView {
    private let dividerView = UIView().forAutoLayout()
    
    override required init(frame: CGRect) {
        super.init(frame: .zero)
        setUpDividerView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpDividerView() {
        addSubview(dividerView)
        dividerView.stretchOnParent()
        dividerView.setHeight(6)
        dividerView.backgroundColor = .dividerViewYellowBackgroundColor
    }
}
