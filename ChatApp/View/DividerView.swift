//
//  DividerView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 28.04.23.
//

import UIKit

final class DividerView: UIView {
    
    //MARK: - Properties
    private let dividerView = UIView().forAutoLayout() // ar unda ikos
    
    //MARK: - Init
    override required init(frame: CGRect) {
        super.init(frame: .zero)
        setUpDividerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setUpDividerView() {
        addSubview(dividerView) //controllershi
        dividerView.stretchOnParent() //controllershi
        dividerView.setHeight(6) // controllershi
        self.backgroundColor = .dividerViewYellowBackgroundColor
    }
}
