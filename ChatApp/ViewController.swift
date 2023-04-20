//
//  ViewController.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 14.04.23.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let switchingBackground = UIView()
    private let lightModeItemBackgroundView = UIImageView()
    private let lightModeItemView = UIImageView()
    private let darkModeItemBackgroundView = UIImageView()
    private let darkModeItemView = UIImageView()
    private let switchingItemStackView = UIStackView()
    
    private let bubbles: Bubbles = {
        let view = Bubbles()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //    private let colorSchemeSwitcherComponent = ColorSchemeSwitcherComponent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpSwitchingBackgroundView()
        setUpSwitchingItemStackView()
        setUpLightModeItemBackgroundView()
        setUpLightModeItemView()
        setUpDarkModeItemBackgroundView()
        setUpDarkModeItemView()
        setBubbleContainer()
    }
    
    
    private func setBubbleContainer() {
        view.addSubview(bubbles)

        bubbles.setHeight(50.0)
        bubbles.setWidth(144.0)

        NSLayoutConstraint.activate([
            bubbles.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            bubbles.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32)
        ])

        view.translatesAutoresizingMaskIntoConstraints = false

        bubbles.layer.cornerRadius = 25
    }
    
    
    //MARK: - switcher view
    
    private func setUpSwitchingBackgroundView() {
        switchingBackground.backgroundColor = UIColor(red: 241, green: 241, blue: 241, alpha: 1)
        view.addSubview(switchingBackground)
        
        switchingBackground.setHeight(27)
        switchingBackground.setWidth(54)
        
        switchingBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 52).isActive = true
        switchingBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        switchingBackground.translatesAutoresizingMaskIntoConstraints = false
        
        switchingBackground.layer.cornerRadius = 12
    }
    
    private func setUpLightModeItemBackgroundView() {
        lightModeItemBackgroundView.image = UIImage(systemName: "circle.fill")
        lightModeItemBackgroundView.tintColor = UIColor(red: 159, green: 96, blue: 256, alpha: 1)
        
        lightModeItemBackgroundView.setHeight(21)
        lightModeItemBackgroundView.setWidth(21)
        
        lightModeItemBackgroundView.addSubview(lightModeItemView)
    }
    
    private func setUpLightModeItemView() {
        lightModeItemView.image = UIImage(systemName: "sun.min.fill")
        lightModeItemView.tintColor = .white
        
        lightModeItemView.setWidth(11)
        lightModeItemView.setHeight(11)
        
        lightModeItemView.centre(in: lightModeItemBackgroundView)
        
        lightModeItemView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpDarkModeItemBackgroundView() {
        darkModeItemBackgroundView.image = UIImage(systemName: "circle.fill")
        darkModeItemBackgroundView.tintColor = .clear
        
        darkModeItemBackgroundView.setWidth(21)
        darkModeItemBackgroundView.setHeight(21)
        
        darkModeItemBackgroundView.addSubview(darkModeItemView)
    }
    
    
    private func setUpDarkModeItemView() {
        darkModeItemView.image = UIImage(systemName: "moon.fill")
        darkModeItemView.tintColor = UIColor(red: 255, green: 202, blue: 85, alpha: 1)
        
        darkModeItemView.setWidth(11)
        darkModeItemView.setHeight(11)
        
        darkModeItemView.centre(in: darkModeItemBackgroundView)
        
        darkModeItemView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setUpSwitchingItemStackView() {
        switchingBackground.addSubview(switchingItemStackView)
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
