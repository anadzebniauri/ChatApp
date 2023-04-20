////
////  SwitcherView.swift
////  chatApp.test
////
////  Created by Ana Dzebniauri on 19.04.23.
////
//
//import UIKit
//
//
//class ColorSchemeSwitcherComponent: UIView {
//
////    private let switchingBackground = self()
//    private let lightModeItemBackgroundView = UIImageView()
//    private let lightModeItemView = UIImageView()
//    private let darkModeItemBackgroundView = UIImageView()
//    private let darkModeItemView = UIImageView()
//    private let switchingItemStackView = UIStackView()
//
//    required init?(coder: NSCoder) {
//        fatalError("!")
//    }
//
//     override required init(frame: CGRect) {
//         super.init(frame: frame)
//         setUp()
//    }
//
//    convenience init() {
//        self.init(frame: .zero)
//        setUp()
//    }
//
//    private func setUp() {
//        setUpSwitchingBackgroundView()
//        setUpSwitchingItemStackView()
//        setUpLightModeItemBackgroundView()
//        setUpLightModeItemView()
//        setUpDarkModeItemBackgroundView()
//        setUpDarkModeItemView()
//    }
//
//    private func setUpSwitchingBackgroundView() {
//        self.backgroundColor = UIColor(red: 241, green: 241, blue: 241, alpha: 1)
////        self.addSubview(self)
//
//        self.setHeight(27)
//        self.setWitdh(54)
//
//        self.topAnchor.constraint(equalTo: self.topAnchor, constant: 52).isActive = true
//        self.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
//
//        self.translatesAutoresizingMaskIntoConstraints = false
//
//        self.layer.cornerRadius = 12
//    }
//
//    private func setUpLightModeItemBackgroundView() {
//        lightModeItemBackgroundView.image = UIImage(systemName: "circle.fill")
//        lightModeItemBackgroundView.tintColor = UIColor(red: 159, green: 96, blue: 256, alpha: 1)
//
//        lightModeItemBackgroundView.setHeight(21)
//        lightModeItemBackgroundView.setWitdh(21)
//
//        lightModeItemBackgroundView.addSubview(lightModeItemView)
//    }
//
//    private func setUpLightModeItemView() {
//        lightModeItemView.image = UIImage(systemName: "sun.min.fill")
//        lightModeItemView.tintColor = .white
//
//        lightModeItemView.setWitdh(11)
//        lightModeItemView.setHeight(11)
//
//        lightModeItemView.centre(in: lightModeItemBackgroundView)
//
//        lightModeItemView.translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    private func setUpDarkModeItemBackgroundView() {
//        darkModeItemBackgroundView.image = UIImage(systemName: "circle.fill")
//        darkModeItemBackgroundView.tintColor = .red
//
//        darkModeItemBackgroundView.setWitdh(21)
//        darkModeItemBackgroundView.setHeight(21)
//
//        darkModeItemBackgroundView.addSubview(darkModeItemView)
//    }
//
//
//    private func setUpDarkModeItemView() {
//        darkModeItemView.image = UIImage(systemName: "moon.fill")
//        darkModeItemView.tintColor = UIColor(red: 255, green: 202, blue: 85, alpha: 1)
//
//        darkModeItemView.setWitdh(11)
//        darkModeItemView.setHeight(11)
//
//        darkModeItemView.centre(in: darkModeItemBackgroundView)
//
//        darkModeItemView.translatesAutoresizingMaskIntoConstraints = false
//
//    }
//
//    private func setUpSwitchingItemStackView() {
////        switchingBackground.addSubview(switchingItemStackView)
//        switchingItemStackView.addArrangedSubview(lightModeItemBackgroundView)
//        switchingItemStackView.addArrangedSubview(darkModeItemBackgroundView)
//
//        switchingItemStackView.spacing = 4
//        switchingItemStackView.stretchOnParent()
//
//        switchingItemStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        switchingItemStackView.distribution = .fillEqually
//
//        switchingItemStackView.isLayoutMarginsRelativeArrangement = true
//        switchingItemStackView.layoutMargins = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
//        }
//}
