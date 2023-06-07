//
//  SwitcherView.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 19.04.23.
//

import UIKit

protocol SwitcherDelegate: AnyObject {
    func switcherDidTap(_ state: SwitcherState)
}

class SwitcherView: UIView {
    
    weak var delegate: SwitcherDelegate?
    var switcherState: SwitcherState = .light {
        didSet {
            if switcherState == .light {
                setUpSwitcherLightModeColors()
            } else {
                setUpSwitcherDarkModeColors()
            }
        }
    }
    
    //MARK: - properties
    private let lightModeItemBackgroundView = UIImageView()
    private let lightModeItemView = UIImageView()
    private let darkModeItemBackgroundView = UIImageView()
    private let darkModeItemView = UIImageView()
    private let switchingItemStackView = UIStackView()
    
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
    }
    
    private func setUpView() {
        layer.cornerRadius = Constants.cornerRadius
        backgroundColor = Constants.Color.switcherLightModeBackgroundColor
    }
    
    //MARK: - Light Mode
    private func setUpLightModeItemBackgroundView() {
        lightModeItemBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        lightModeItemBackgroundView.image = Constants.Image.circleImage
        lightModeItemBackgroundView.tintColor = Constants.Color.switcherBackgroundItemViewColor
        
        lightModeItemBackgroundView.setHeight(Constants.LightMode.lightModeItemBackgroundViewHeight)
        lightModeItemBackgroundView.setWidth(Constants.LightMode.lightModeItemBackgroundViewWidth)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        lightModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
        lightModeItemBackgroundView.isUserInteractionEnabled = true
    }
    
    private func setUpLightModeItemView() {
        lightModeItemBackgroundView.addSubview(lightModeItemView)
        lightModeItemView.image = Constants.Image.sunImage
        lightModeItemView.tintColor = .white
        
        lightModeItemView.setWidth(Constants.LightMode.lightModeItemViewWidth)
        lightModeItemView.setHeight(Constants.LightMode.lightModeItemViewHeight)
        
        lightModeItemView.centre(in: lightModeItemBackgroundView)
        
        lightModeItemView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Dark Mode
    private func setUpDarkModeItemBackgroundView() {
        darkModeItemBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        darkModeItemBackgroundView.image = Constants.Image.circleImage
        darkModeItemBackgroundView.tintColor = .clear
        
        darkModeItemBackgroundView.setWidth(Constants.DarkMode.darkModeItemBackgroundViewWidth)
        darkModeItemBackgroundView.setHeight(Constants.DarkMode.darkModeItemBackgroundViewHeight)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        darkModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
        darkModeItemBackgroundView.isUserInteractionEnabled = true
    }
    
    private func setUpDarkModeItemView() {
        darkModeItemBackgroundView.addSubview(darkModeItemView)
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
        switchingItemStackView.translatesAutoresizingMaskIntoConstraints = false
        
        switchingItemStackView.setHeight(Constants.StackView.switchingItemStackViewHeight)
        switchingItemStackView.setWidth(Constants.StackView.switchingItemStackViewWidth)
        
        switchingItemStackView.spacing = Constants.StackView.switchingItemStackViewSpacing
        switchingItemStackView.distribution = .fillEqually
        switchingItemStackView.axis = .horizontal
        
        switchingItemStackView.isLayoutMarginsRelativeArrangement = true
        switchingItemStackView.layoutMargins = Constants.StackView.switchingItemStackViewUIEdgeInsets
    }
    
    func setUpSwitcherLightModeColors() {
        backgroundColor = Constants.Color.switcherLightModeBackgroundColor
        lightModeItemBackgroundView.tintColor = Constants.Color.switcherBackgroundItemViewColor
        lightModeItemView.tintColor = .white
        darkModeItemBackgroundView.tintColor = .clear
        darkModeItemView.tintColor = Constants.Color.switcherItemViewColor
    }
    
    func setUpSwitcherDarkModeColors() {
        backgroundColor = Constants.Color.darkModeBackgroundColor
        lightModeItemBackgroundView.tintColor = .clear
        lightModeItemView.tintColor = Constants.Color.switcherItemViewColor
        darkModeItemBackgroundView.tintColor = Constants.Color.switcherBackgroundItemViewColor
        darkModeItemView.tintColor = Constants.Color.darkModeBackgroundColor
    }
    
    @objc func viewTapped() {
        delegate?.switcherDidTap(switcherState)
        switch self.switcherState {
        case .light:
            self.switcherState = .dark
            setUpSwitcherLightModeColors()
        case .dark:
            self.switcherState = .light
            setUpSwitcherDarkModeColors()
        }
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
            static let switchingItemStackViewSpacing = 3.0
            static let switchingItemStackViewUIEdgeInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        }
        
        enum Image {
            static let circleImage = UIImage(systemName: "circle.fill")
            static let sunImage = UIImage(systemName: "sun.min.fill")
            static let moonImage = UIImage(systemName: "moon.fill")
        }
        
        enum Color {
            static let switcherLightModeBackgroundColor = UIColor(red: 241, green: 241, blue: 241, alpha: 1)
            static let switcherDarkModeBackgroundColor = UIColor(red: 46, green: 0, blue: 114, alpha: 1)
            static let switcherBackgroundItemViewColor = UIColor(red: 159, green: 96, blue: 255, alpha: 1)
            static let switcherItemViewColor = UIColor(red: 255, green: 202, blue: 85, alpha: 1)
            static let darkModeBackgroundColor = UIColor(red: 46, green: 0, blue: 114, alpha: 1)
        }
    }
}

enum SwitcherState {
    case light
    case dark
}
