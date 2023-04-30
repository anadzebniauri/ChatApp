//
//  SwitcherView.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 19.04.23.
//

import UIKit

class SwitcherView: UIView {
    
//MARK: - properties
    @objc private let lightModeItemBackgroundView = UIImageView()
    private let lightModeItemView = UIImageView()
    @objc private let darkModeItemBackgroundView = UIImageView()
    private let darkModeItemView = UIImageView()
    private let switchingItemStackView = UIStackView().forAutoLayout()
    
//MARK: - Init
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
    
//MARK: - Methods
   private func setUp() {
        setUpView()
        setUpSwitchingItemStackView()
        setUpLightModeItemBackgroundView()
        setUpLightModeItemView()
        setUpDarkModeItemBackgroundView()
        setUpDarkModeItemView()
        setUpGesture()
        viewTapped()
    }
    
    private func setUpView() {
        layer.cornerRadius = Constants.cornerRadius
    }
    
//MARK: - Light Mode
    private func setUpLightModeItemBackgroundView() {
        lightModeItemBackgroundView.addSubview(lightModeItemView)

        lightModeItemBackgroundView.image = .circleImage
        lightModeItemBackgroundView.tintColor = .switcherBackgroundItemViewColor
        
        lightModeItemBackgroundView.setHeight(Constants.lightModeItemBackgroundViewHeight)
        lightModeItemBackgroundView.setWidth(Constants.lightModeItemBackgroundViewWidth)
        
        //delete?
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        lightModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
        lightModeItemBackgroundView.isUserInteractionEnabled = true
    }
    
    private func setUpLightModeItemView() {
        lightModeItemView.image = .sunImage
        lightModeItemView.tintColor = .white
        
        lightModeItemView.setWidth(Constants.lightModeItemViewWidth)
        lightModeItemView.setHeight(Constants.lightModeItemViewHeight)
        
        lightModeItemView.centre(in: lightModeItemBackgroundView)
        
        lightModeItemView.translatesAutoresizingMaskIntoConstraints = false
    }
    
//MARK: - Dark Mode
    private func setUpDarkModeItemBackgroundView() {
        darkModeItemBackgroundView.addSubview(darkModeItemView)

        darkModeItemBackgroundView.image = .circleImage
        darkModeItemBackgroundView.tintColor = .clear
        
        darkModeItemBackgroundView.setWidth(Constants.darkModeItemBackgroundViewWidth)
        darkModeItemBackgroundView.setHeight(Constants.darkModeItemBackgroundViewHeight)
        
        //delete?
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        darkModeItemBackgroundView.addGestureRecognizer(tapGestureRecognizer)
        darkModeItemBackgroundView.isUserInteractionEnabled = true
    }
    
    private func setUpDarkModeItemView() {
        darkModeItemView.image = .moonImage
        darkModeItemView.tintColor = .switcherItemViewColor
        
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
            //table view and cell background color
            guard let viewController = viewController else { return }
            let firstTableView = viewController.view.subviews.first(where: { $0 is UITableView }) as? UITableView
            firstTableView?.backgroundColor = .darkModeBackgroundColor

            //second table view and cell
            var secondTableView: UITableView?
            for subview in viewController.view.subviews {
                if let tableView = subview as? UITableView, tableView != firstTableView {
                    secondTableView = tableView
                    break
                }
            }
            secondTableView?.backgroundColor = .darkModeBackgroundColor

            
            viewController.view.backgroundColor = .darkModeBackgroundColor
            backgroundColor = .switcherDarkModeBackgroundColor
            lightModeItemBackgroundView.tintColor = .clear
            lightModeItemView.tintColor = .switcherItemViewColor
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
    
    private func setUpGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(tapGestureRecognizer)
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
}
