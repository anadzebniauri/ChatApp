//
//  ViewController.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 14.04.23.
//

import UIKit

class ChatViewController: UIViewController {
    
    //MARK: - Properties
    private let topChatView = ChatView().forAutoLayout()
    private let bottomChatView = ChatView().forAutoLayout()
    
    private let dividerView = DividerView().forAutoLayout()
    private let switcherView = SwitcherView().forAutoLayout()
    
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
            bottomChatView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            bottomChatView.rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomChatView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
    
    //MARK: - Divider View
    private func setUpDividerView() {
        view.addSubview(dividerView)
        dividerView.setHeight(6)
        
        NSLayoutConstraint.activate([
            dividerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dividerView.centerYAnchor.constraint(equalTo: view.centerYAnchor ),
            dividerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            dividerView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
    
    //MARK: - Switcher View
    private func setUpSwitcherView() {
        view.addSubview(switcherView)
        
        NSLayoutConstraint.activate([
            switcherView.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            switcherView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12)
        ])
    }
}
