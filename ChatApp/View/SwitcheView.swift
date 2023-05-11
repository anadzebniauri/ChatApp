//
//  SwitcherView.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 19.04.23.
//

import UIKit

protocol SwitcherDelegate: AnyObject {
    func switcherDidTap()
}

class SwitcherView: UIView {
    
    weak var delegate: SwitcherDelegate?

    //MARK: - properties
    private lazy var lightModeItemBackgroundView = UIImageView()
    private lazy var lightModeItemView = UIImageView()
    private lazy var darkModeItemBackgroundView = UIImageView()
    private lazy var darkModeItemView = UIImageView()
    private lazy var switchingItemStackView = UIStackView().forAutoLayout()
    
    //MARK: - Init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override required init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    //MARK: - Methods
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
        layer.cornerRadius = Constants.cornerRadius
        backgroundColor = Constants.Color.switcherLightModeBackgroundColor
    }
    
    //MARK: - Light Mode
    private func setUpLightModeItemBackgroundView() {
        lightModeItemBackgroundView.addSubview(lightModeItemView)
        
        lightModeItemBackgroundView.image = Constants.Image.circleImage
        lightModeItemBackgroundView.tintColor = Constants.Color.switcherBackgroundItemViewColor
        
        lightModeItemBackgroundView.setHeight(Constants.LightMode.lightModeItemBackgroundViewHeight)
        lightModeItemBackgroundView.setWidth(Constants.LightMode.lightModeItemBackgroundViewWidth)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        lightModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
        lightModeItemBackgroundView.isUserInteractionEnabled = true
    }
    
    private func setUpLightModeItemView() {
        lightModeItemView.image = Constants.Image.sunImage
        lightModeItemView.tintColor = .white
        
        lightModeItemView.setWidth(Constants.LightMode.lightModeItemViewWidth)
        lightModeItemView.setHeight(Constants.LightMode.lightModeItemViewHeight)
        
        lightModeItemView.centre(in: lightModeItemBackgroundView)
        
        lightModeItemView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Dark Mode
    private func setUpDarkModeItemBackgroundView() {
        darkModeItemBackgroundView.addSubview(darkModeItemView)
        
        darkModeItemBackgroundView.image = Constants.Image.circleImage
        darkModeItemBackgroundView.tintColor = .clear
        
        darkModeItemBackgroundView.setWidth(Constants.DarkMode.darkModeItemBackgroundViewWidth)
        darkModeItemBackgroundView.setHeight(Constants.DarkMode.darkModeItemBackgroundViewHeight)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        darkModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
        darkModeItemBackgroundView.isUserInteractionEnabled = true
    }
    
    private func setUpDarkModeItemView() {
        darkModeItemView.image = Constants.Image.moonImage
        darkModeItemView.tintColor = Constants.Color.switcherItemViewColor
        
        darkModeItemView.setWidth(Constants.DarkMode.darkModeItemViewWidth)
        darkModeItemView.setHeight(Constants.DarkMode.darkModeItemViewHeight)
        
        darkModeItemView.centre(in: darkModeItemBackgroundView)
        
        darkModeItemView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Stack View
    private func setUpSwitchingItemStackView() {
        addSubview(switchingItemStackView)
        switchingItemStackView.stretchOnParent()
        switchingItemStackView.addArrangedSubview(lightModeItemBackgroundView)
        switchingItemStackView.addArrangedSubview(darkModeItemBackgroundView)
        
        switchingItemStackView.setHeight(Constants.StackView.switchingItemStackViewHeight)
        switchingItemStackView.setWidth(Constants.StackView.switchingItemStackViewWidth)
        
        switchingItemStackView.spacing = 4
        switchingItemStackView.distribution = .fillEqually
        
        switchingItemStackView.isLayoutMarginsRelativeArrangement = true
        switchingItemStackView.layoutMargins = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
}
    
    @objc func viewTapped() {
        delegate?.switcherDidTap()
    }
}

// MARK: - Constans
private extension SwitcherView {
    enum Constants {
        static let cornerRadius = 12.0
        
        enum LightMode {
            static let lightModeItemBackgroundViewHeight = 21.0
            static let lightModeItemBackgroundViewWidth = 21.0
            static let lightModeItemViewHeight = 11.0
            static let lightModeItemViewWidth = 11.0
        }

        enum DarkMode {
            static let darkModeItemBackgroundViewHeight = 21.0
            static let darkModeItemBackgroundViewWidth = 21.0
            static let darkModeItemViewHeight = 11.0
            static let darkModeItemViewWidth = 11.0
        }

        enum StackView {
            static let switchingItemStackViewHeight = 27.0
            static let switchingItemStackViewWidth = 54.0
        }
       
        enum Image {
            static let circleImage = UIImage(systemName: "circle.fill")
            static let sunImage = UIImage(systemName: "sun.min.fill")
            static let moonImage = UIImage(systemName: "moon.fill")
        }
        
        enum Color {
            static let switcherLightModeBackgroundColor = UIColor(red: 241, green: 241, blue: 241, alpha: 1)
            static let switcherDarkModeBackgroundColor = UIColor(red: 46, green: 0, blue: 114, alpha: 1)
            static let switcherBackgroundItemViewColor = UIColor(red: 159, green: 96, blue: 256, alpha: 1)
            static let switcherItemViewColor = UIColor(red: 255, green: 202, blue: 85, alpha: 1)
            static let darkModeBackgroundColor = UIColor(red: 22, green: 0, blue: 57, alpha: 1)
        }
    }
}
