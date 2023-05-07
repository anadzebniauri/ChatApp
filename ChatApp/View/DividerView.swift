//
//  DividerView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 28.04.23.
//

import UIKit

final class DividerView: UIView {
    
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
        self.backgroundColor = Colors.dividerViewYellowBackgroundColor
    }
}

//MARK: - Color Extension
private extension DividerView {
    enum Colors {
        static let dividerViewYellowBackgroundColor = UIColor(red: 247, green: 206, blue: 127, alpha: 1)
    }
}

