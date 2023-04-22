////
////  SwitcherView.swift
////  chatApp.test
////
////  Created by Ana Dzebniauri on 19.04.23.
////

import UIKit


class ColorSchemeSwitcherComponent: UIView {
    
    private let lightModeItemBackgroundView = UIImageView()
    private let lightModeItemView = UIImageView()
    private let darkModeItemBackgroundView = UIImageView()
    private let darkModeItemView = UIImageView()
    private let switchingItemStackView = UIStackView()
    
    required init?(coder: NSCoder) {
        fatalError("!")
    }
    
    override required init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    convenience init() {
        self.init(frame: .zero)
        setUp()
    }
    
    func setUp() {
        setUpView()
        setUpSwitchingItemStackView()
        setUpLightModeItemBackgroundView()
        setUpLightModeItemView()
        setUpDarkModeItemBackgroundView()
        setUpDarkModeItemView()
    }
    
    func setUpView() {
        backgroundColor = UIColor(red: 241, green: 241, blue: 241, alpha: 1)
        layer.cornerRadius = 12
    }
    
    func setUpLightModeItemBackgroundView() {
        lightModeItemBackgroundView.addSubview(lightModeItemView)

        lightModeItemBackgroundView.image = UIImage(systemName: "circle.fill")
        lightModeItemBackgroundView.tintColor = UIColor(red: 159, green: 96, blue: 256, alpha: 1)
        
        lightModeItemBackgroundView.setHeight(21)
        lightModeItemBackgroundView.setWidth(21)
        
    }
    
    func setUpLightModeItemView() {
        lightModeItemView.image = UIImage(systemName: "sun.min.fill")
        lightModeItemView.tintColor = .white
        
        lightModeItemView.setWidth(11)
        lightModeItemView.setHeight(11)
        
        lightModeItemView.centre(in: lightModeItemBackgroundView)
        
        lightModeItemView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpDarkModeItemBackgroundView() {
        darkModeItemBackgroundView.addSubview(darkModeItemView)

        darkModeItemBackgroundView.image = UIImage(systemName: "circle.fill")
        darkModeItemBackgroundView.tintColor = .clear
        
        darkModeItemBackgroundView.setWidth(21)
        darkModeItemBackgroundView.setHeight(21)
    }
    
    
    func setUpDarkModeItemView() {
        darkModeItemView.image = UIImage(systemName: "moon.fill")
        darkModeItemView.tintColor = UIColor(red: 255, green: 202, blue: 85, alpha: 1)
        
        darkModeItemView.setWidth(11)
        darkModeItemView.setHeight(11)
        
        darkModeItemView.centre(in: darkModeItemBackgroundView)
        
        darkModeItemView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setUpSwitchingItemStackView() {
        addSubview(switchingItemStackView)
        switchingItemStackView.addArrangedSubview(lightModeItemBackgroundView)
        switchingItemStackView.addArrangedSubview(darkModeItemBackgroundView)
        
        switchingItemStackView.spacing = 4
        switchingItemStackView.stretchOnParent()
        
        switchingItemStackView.translatesAutoresizingMaskIntoConstraints = false
        
        switchingItemStackView.distribution = .fillEqually
        
        switchingItemStackView.isLayoutMarginsRelativeArrangement = true
        switchingItemStackView.layoutMargins = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
}
