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

class SwitcherView: UIView, SwitcherDelegate {
    
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
    }
    
    private func setUpView() {
        layer.cornerRadius = Constants.cornerRadius
    }
    
    //MARK: - Light Mode
    private func setUpLightModeItemBackgroundView() {
        lightModeItemBackgroundView.addSubview(lightModeItemView)
        
        lightModeItemBackgroundView.image = Images.circleImage
        lightModeItemBackgroundView.tintColor = Colors.switcherBackgroundItemViewColor
        
        lightModeItemBackgroundView.setHeight(Constants.lightModeItemBackgroundViewHeight)
        lightModeItemBackgroundView.setWidth(Constants.lightModeItemBackgroundViewWidth)
        
        //delete?
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        lightModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
        lightModeItemBackgroundView.isUserInteractionEnabled = true
    }
    
    private func setUpLightModeItemView() {
        lightModeItemView.image = Images.sunImage
        lightModeItemView.tintColor = .white
        
        lightModeItemView.setWidth(Constants.lightModeItemViewWidth)
        lightModeItemView.setHeight(Constants.lightModeItemViewHeight)
        
        lightModeItemView.centre(in: lightModeItemBackgroundView)
        
        lightModeItemView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Dark Mode
    private func setUpDarkModeItemBackgroundView() {
        darkModeItemBackgroundView.addSubview(darkModeItemView)
        
        darkModeItemBackgroundView.image = Images.circleImage
        darkModeItemBackgroundView.tintColor = .clear
        
        darkModeItemBackgroundView.setWidth(Constants.darkModeItemBackgroundViewWidth)
        darkModeItemBackgroundView.setHeight(Constants.darkModeItemBackgroundViewHeight)
        
        //delete?
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        darkModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
        darkModeItemBackgroundView.isUserInteractionEnabled = true
    }
    
    private func setUpDarkModeItemView() {
        darkModeItemView.image = Images.moonImage
        darkModeItemView.tintColor = Colors.switcherItemViewColor
        
        darkModeItemView.setWidth(Constants.darkModeItemViewWidth)
        darkModeItemView.setHeight(Constants.darkModeItemViewHeight)
        
        darkModeItemView.centre(in: darkModeItemBackgroundView)
        
        darkModeItemView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Stack View
    private func setUpSwitchingItemStackView() {
        addSubview(switchingItemStackView)
        switchingItemStackView.stretchOnParent()
        switchingItemStackView.addArrangedSubview(lightModeItemBackgroundView)
        switchingItemStackView.addArrangedSubview(darkModeItemBackgroundView)
        
        switchingItemStackView.setHeight(Constants.switchingItemStackViewHeight)
        switchingItemStackView.setWidth(Constants.switchingItemStackViewWidth)
        
        switchingItemStackView.spacing = 4
        switchingItemStackView.distribution = .fillEqually
        
        switchingItemStackView.isLayoutMarginsRelativeArrangement = true
        switchingItemStackView.layoutMargins = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
    @objc func viewTapped() {
        delegate?.switcherDidTap()
    }
    
    func switcherDidTap() {
        print("tapped")
    }
}

// MARK: - Constans
private extension SwitcherView {
    enum Constants {
        static let cornerRadius = 12.0
        
        static let lightModeItemBackgroundViewHeight = 21.0
        static let lightModeItemBackgroundViewWidth = 21.0
        static let lightModeItemViewHeight = 11.0
        static let lightModeItemViewWidth = 11.0
        
        static let darkModeItemBackgroundViewHeight = 21.0
        static let darkModeItemBackgroundViewWidth = 21.0
        static let darkModeItemViewHeight = 11.0
        static let darkModeItemViewWidth = 11.0
        
        static let switchingItemStackViewHeight = 27.0
        static let switchingItemStackViewWidth = 54.0
    }
    
    //MARK: - Images
    enum Images {
        static let circleImage = UIImage(systemName: "circle.fill")
        static let sunImage = UIImage(systemName: "sun.min.fill")
        static let moonImage = UIImage(systemName: "moon.fill")
    }
    
    //MARK: - Colors
    enum Colors {
        static let switcherLightModeBackgroundColor = UIColor(red: 241, green: 241, blue: 241, alpha: 1)
        static let switcherDarkModeBackgroundColor = UIColor(red: 46, green: 0, blue: 114, alpha: 1)
        static let switcherBackgroundItemViewColor = UIColor(red: 159, green: 96, blue: 256, alpha: 1)
        static let switcherItemViewColor = UIColor(red: 255, green: 202, blue: 85, alpha: 1)
        static let darkModeBackgroundColor = UIColor(red: 22, green: 0, blue: 57, alpha: 1)
    }
}
