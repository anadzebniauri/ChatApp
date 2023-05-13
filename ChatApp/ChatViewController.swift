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
            topChatView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topChatView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    private func setUpBottomChatView() {
        view.addSubview(bottomChatView)
        
        NSLayoutConstraint.activate([
            bottomChatView.topAnchor.constraint(equalTo: dividerView.bottomAnchor),
            bottomChatView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.ChatView.bottomChatViewPadding),
            bottomChatView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomChatView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    //MARK: - Divider View
    private func setUpDividerView() {
        view.addSubview(dividerView)
        dividerView.setHeight(Constants.DividerView.dividerViewHeight)
        
        NSLayoutConstraint.activate([
            dividerView.centerYAnchor.constraint(equalTo: view.centerYAnchor ),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        dividerView.backgroundColor = Constants.Color.dividerViewYellowBackgroundColor
    }
    
    //MARK: - Switcher View
    private func setUpSwitcherView() {
        view.addSubview(switcherView)
        switcherView.delegate = self
        
        NSLayoutConstraint.activate([
            switcherView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.SwitcherView.switcherTopAnchor),
            switcherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.SwitcherView.switcherRightAnchor)
        ])
    }
    
    private func setUpLightModeView() {
        view.backgroundColor = .systemBackground
    }
    
    private func setUpDarkModeView() {
        view.backgroundColor = Constants.Color.darkModeBackgroundColor
        topChatView.typingAreaView.messageTextView.textColor = .white
        bottomChatView.typingAreaView.messageTextView.textColor = .white
    }
}

//MARK: - Switcher Delegate
extension ChatViewController: SwitcherDelegate {
    func switcherDidTap(_ state: SwitcherState) {
        if state == .light {
            self.setUpLightModeView()
        } else if state == .dark {
            self.setUpDarkModeView()
        }
    }
}

//MARK: - Constants
extension ChatViewController {
    enum Constants {
        enum ChatView {
            static let bottomChatViewPadding = -30.0
        }
        enum SwitcherView {
            static let switcherTopAnchor = 52.0
            static let switcherRightAnchor = -12.0
        }
        enum DividerView {
            static let dividerViewHeight = 6.0
        }
        enum Color {
            static let dividerViewYellowBackgroundColor = UIColor(red: 247, green: 206, blue: 127, alpha: 1)
            static let darkModeBackgroundColor = UIColor(red: 22, green: 0, blue: 57, alpha: 1)
        }
    }
}
