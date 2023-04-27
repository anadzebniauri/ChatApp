//
//  SwitcherView.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 19.04.23.
//

import UIKit


class ColorSchemeSwitcherComponent: UIView {
    
    //MARK: - properties
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
    
    //MARK: - Functions
    private func setUp() {
        setUpView()
        setUpSwitchingItemStackView()
        setUpLightModeItemBackgroundView()
        setUpLightModeItemView()
        setUpDarkModeItemBackgroundView()
        setUpDarkModeItemView()
        viewTapped()
    }
    
    private func setUpView() {
        layer.cornerRadius = 12
    }
    
    //MARK: - Light Mode
    private func setUpLightModeItemBackgroundView() {
        lightModeItemBackgroundView.addSubview(lightModeItemView)

        lightModeItemBackgroundView.image = .circleImage
        lightModeItemBackgroundView.tintColor = .switcherBackgroundItemViewColor
        
//        lightModeItemBackgroundView.setHeight(lightModeItemBackgroundViewHeight)
//        lightModeItemBackgroundView.setWidth(lightModeItemBackgroundViewWitdth)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        lightModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
        lightModeItemBackgroundView.isUserInteractionEnabled = true
        lightModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setUpLightModeItemView() {
        lightModeItemView.image = .sunImage
        lightModeItemView.tintColor = .white
        
        lightModeItemView.setWidth(11)
        lightModeItemView.setHeight(11)
        
        lightModeItemView.centre(in: lightModeItemBackgroundView)
        
        lightModeItemView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Dark Mode
    private func setUpDarkModeItemBackgroundView() {
        darkModeItemBackgroundView.addSubview(darkModeItemView)

        darkModeItemBackgroundView.image = .circleImage
        darkModeItemBackgroundView.tintColor = .clear
        
        darkModeItemBackgroundView.setWidth(21)
        darkModeItemBackgroundView.setHeight(21)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        darkModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
        darkModeItemBackgroundView.isUserInteractionEnabled = true
        darkModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setUpDarkModeItemView() {
        darkModeItemView.image = .moonImage
        darkModeItemView.tintColor = .switcherItemViewColor
        
        darkModeItemView.setWidth(11)
        darkModeItemView.setHeight(11)
        
        darkModeItemView.centre(in: darkModeItemBackgroundView)
        
        darkModeItemView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Stack View
    private func setUpSwitchingItemStackView() {
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
    
    //MARK: - Switcher Function
    private var viewController: UIViewController? {
        var nextResponder: UIResponder? = self
        while let responder = nextResponder, !(responder is UIViewController) {
            nextResponder = responder.next
        }
        return nextResponder as? UIViewController
    }

    // should remake model
    @objc func viewTapped() {
        darkModeItemBackgroundView.isHighlighted = !darkModeItemBackgroundView.isHighlighted
        if darkModeItemBackgroundView.isHighlighted {
            viewController?.view.backgroundColor = .darkModeBackgroundColor
            backgroundColor = .switcherDarkModeBackgroundColor
            lightModeItemBackgroundView.tintColor = .clear
            lightModeItemView.tintColor = .switcherItemViewColor //rrename
            darkModeItemBackgroundView.tintColor = .switcherBackgroundItemViewColor
            darkModeItemView.tintColor = .switcherDarkModeBackgroundColor
        } else {
            viewController?.view.backgroundColor = .white
            backgroundColor = .switcherLightModeBackgroundColor
            lightModeItemBackgroundView.tintColor = .switcherBackgroundItemViewColor
            lightModeItemView.tintColor = .white
            darkModeItemBackgroundView.tintColor = .clear
            darkModeItemView.tintColor = .switcherItemViewColor
        }
    }
}


enum Constants {
    static let cornerRadius: Int = 12
    static let lightModeItemViewHeight: Int = 11
    static let lightModeItemViewWidth: Int = 11
}
