//
//  ViewController.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 14.04.23.
//

import UIKit

protocol ChatAppViewDelegate: AnyObject {
    func send(fromTop: Bool)
}

class ChatAppViewController: UIViewController {
    
    //MARK: - Properties
    let topChatView = ChatView().forAutoLayout()
    let bottomChatView = ChatView().forAutoLayout()
    
    private let dividerView = UIView().forAutoLayout()
    private let switcherView = SwitcherView().forAutoLayout()
    
    private var statusBar: UIStatusBarStyle = .darkContent

    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSwitcherView()
        setUpDividerView()
        
        setUpTopChatView()
        setUpBottomChatView()
        
        keyboardDismiss()
        setUpViewModel()
    }
    
    //MARK: - View Model
    private func setUpViewModel() {
        let userModel = UserModel()
        userModel.getUsers(completion: { [weak self] users in
            guard let self = self else { return }
            if let firstUser = users?.0, let secondUser = users?.1 {
                self.topChatView.setUpUsers(sender: firstUser, recipient: secondUser)
                self.bottomChatView.setUpUsers(sender: secondUser, recipient: firstUser)
            }
        })
    }
    
    //MARK: - Status Bar  Style
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBar
    }
    
    //MARK: - KeyBoard
    private func keyboardDismiss() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    //MARK: - Chat View Methods
    private func setUpTopChatView() {
        view.addSubview(topChatView)
        topChatView.delegate = self
        
        NSLayoutConstraint.activate([
            topChatView.topAnchor.constraint(equalTo: switcherView.bottomAnchor),
            topChatView.bottomAnchor.constraint(equalTo: dividerView.topAnchor ),
            topChatView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topChatView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    private func setUpBottomChatView() {
        view.addSubview(bottomChatView)
        bottomChatView.delegate = self
        
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
        dividerView.backgroundColor = Constants.Color.dividerViewYellowBackgroundColor
        
        NSLayoutConstraint.activate([
            dividerView.centerYAnchor.constraint(equalTo: view.centerYAnchor ),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    //MARK: - Switcher View
    private func setUpSwitcherView() {
        view.addSubview(switcherView)
        switcherView.delegate = self

        NSLayoutConstraint.activate([
            switcherView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.SwitcherView.switcherTopAnchor),
            switcherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.SwitcherView.switcherRightAnchor)
        ])
        
        let darkModeEnabled = UserDefaults.standard.bool(forKey: "DarkModeEnabled")
        setUpSwitcherMode(darkModeEnabled)
    }
}

//MARK: - Switcher Delegate
extension ChatAppViewController: SwitcherDelegate {
    
    func switcherDidTap(_ state: SwitcherState) {
        switch state {
        case .light:
            setUpSwitcherMode(false)
            UserDefaults.standard.set(false, forKey: "DarkModeEnabled")
        case .dark:
            setUpSwitcherMode(true)
            UserDefaults.standard.set(true, forKey: "DarkModeEnabled")
        }
    }
    
    func setUpSwitcherMode(_ isDarkMode: Bool) {
        if isDarkMode {
            view.backgroundColor = Constants.Color.darkModeBackgroundColor
            statusBar = .lightContent
            switcherView.setUpSwitcherDarkModeColors()
        } else {
            view.backgroundColor = .systemBackground
            statusBar = .darkContent
            switcherView.setUpSwitcherLightModeColors()
        }
        setNeedsStatusBarAppearanceUpdate()
    }
}

//MARK: - Send Delegate
extension ChatAppViewController: ChatAppViewDelegate {
    func send(fromTop: Bool) {
        if fromTop {
            bottomChatView.receivedMessage()
        } else {
            topChatView.receivedMessage()
        }
    }
}

//MARK: - Constants
extension ChatAppViewController {
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
