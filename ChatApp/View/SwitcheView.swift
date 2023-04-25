////
////  SwitcherView.swift
////  chatApp.test
////
////  Created by Ana Dzebniauri on 19.04.23.
////

import UIKit


class ColorSchemeSwitcherComponent: UIView {
    
    @objc private let lightModeItemBackgroundView = UIImageView()
    private let lightModeItemView = UIImageView()
    @objc private let darkModeItemBackgroundView = UIImageView()
    private let darkModeItemView = UIImageView()
    private let switchingItemStackView = UIStackView()
    
    required init?(coder: NSCoder) {
        fatalError("!")
    }
    
    override required init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(tapGestureRecognizer)
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
        viewTapped()
    }
    
    func setUpView() {
        layer.cornerRadius = 12
    }
    
    func setUpLightModeItemBackgroundView() {
        lightModeItemBackgroundView.addSubview(lightModeItemView)

        lightModeItemBackgroundView.image = UIImage(systemName: "circle.fill")
        lightModeItemBackgroundView.tintColor = .BackgroundItemViewColor
        
        lightModeItemBackgroundView.setHeight(21)
        lightModeItemBackgroundView.setWidth(21)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        lightModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
        lightModeItemBackgroundView.isUserInteractionEnabled = true
        lightModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
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
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        darkModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
        darkModeItemBackgroundView.isUserInteractionEnabled = true
        darkModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setUpDarkModeItemView() {
        darkModeItemView.image = UIImage(systemName: "moon.fill")
        darkModeItemView.tintColor = .ItemViewColor
        
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
    
    var viewController: UIViewController? {
        var nextResponder: UIResponder? = self
        while let responder = nextResponder, !(responder is UIViewController) {
            nextResponder = responder.next
        }
        return nextResponder as? UIViewController
    }

    
    @objc func viewTapped() {
        darkModeItemBackgroundView.isHighlighted = !darkModeItemBackgroundView.isHighlighted
        if darkModeItemBackgroundView.isHighlighted {
            viewController?.view.backgroundColor = .darkModeBackgroundColor
            backgroundColor = .SwitcherDarkModeBackgroundColor
            lightModeItemBackgroundView.tintColor = .clear
            lightModeItemView.tintColor = .ItemViewColor
            darkModeItemBackgroundView.tintColor = .BackgroundItemViewColor
            darkModeItemView.tintColor = .SwitcherDarkModeBackgroundColor
        } else {
            viewController?.view.backgroundColor = .white
            backgroundColor = .switcherLightModeBackgroundColor
            lightModeItemBackgroundView.tintColor = .BackgroundItemViewColor
            lightModeItemView.tintColor = .white
            darkModeItemBackgroundView.tintColor = .clear
            darkModeItemView.tintColor = .ItemViewColor
        }
    }

}
