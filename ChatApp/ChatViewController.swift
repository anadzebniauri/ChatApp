//
//  ViewController.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 14.04.23.
//

import UIKit

class ChatViewController: UIViewController {
    
    //MARK: - Properties
    private lazy var topChatView = ChatView().forAutoLayout()
    private lazy var bottomChatView = ChatView().forAutoLayout()
    
    private lazy var dividerView = UIView().forAutoLayout()
    private lazy var switcherView = SwitcherView().forAutoLayout()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        
        setUpSwitcherView()
        setUpDividerView()
        
        setUpTopChatView()
        setUpBottomChatView()
    }
    
    //MARK: - Chat View Methods
    private func setUpTopChatView() {
        view.addSubview(topChatView)
        
        NSLayoutConstraint.activate([
            topChatView.topAnchor.constraint(equalTo: switcherView.bottomAnchor),
            topChatView.bottomAnchor.constraint(equalTo: dividerView.topAnchor ),
            topChatView.rightAnchor.constraint(equalTo: view.rightAnchor),
            topChatView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
    
    private func setUpBottomChatView() {
        view.addSubview(bottomChatView)
        
        NSLayoutConstraint.activate([
            bottomChatView.topAnchor.constraint(equalTo: dividerView.bottomAnchor),
            bottomChatView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.bottomChatViewPadding),
            bottomChatView.rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomChatView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
    
    //MARK: - Divider View
    private func setUpDividerView() {
        view.addSubview(dividerView)
        dividerView.setHeight(6)
        
        NSLayoutConstraint.activate([
            dividerView.centerYAnchor.constraint(equalTo: view.centerYAnchor ),
            dividerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            dividerView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        dividerView.backgroundColor = Constants.dividerViewYellowBackgroundColor
    }
    
    //MARK: - Switcher View
    private func setUpSwitcherView() {
        view.addSubview(switcherView)
        
        NSLayoutConstraint.activate([
            switcherView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.switcherTopAnchor),
            switcherView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.switcherRightAnchor)
        ])
    }
}

//MARK: - Constants
extension ChatViewController {
    enum Constants {
        static let bottomChatViewPadding = -30.0
        static let switcherTopAnchor = 52.0
        static let switcherRightAnchor = -12.0
        
        static let dividerViewYellowBackgroundColor = UIColor(red: 247, green: 206, blue: 127, alpha: 1)
    }
}
