//
//  ViewController.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 14.04.23.
//

import UIKit

class ViewController: UIViewController {

    private let colorSchemeSwitcherComponent = ColorSchemeSwitcherComponent().forAutoLayout()
    
    private let recipientMessageview = RecipientMessageView().forAutoLayout()
    private let senderMessageView = SenderMessageView().forAutoLayout()
    
    private let typingArea = TypingArea().forAutoLayout()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    //Do any additional setup after loading the view.
        setUpColorSchemeSwitcherComponent()
//        setUpRecipientMessageView()
        setUpSenderMessageView()
        setUpTypingArea()
    }
    
    //MARK: - Typing Area
    private func setUpTypingArea() {
        view.addSubview(typingArea)

        NSLayoutConstraint.activate([
            typingArea.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            typingArea.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            typingArea.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            typingArea.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
    }
    
//    MARK: - Message VIew
    private func setUpRecipientMessageView() {
        view.addSubview(recipientMessageview)
        
        NSLayoutConstraint.activate([
            recipientMessageview.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            recipientMessageview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
        ])
    }
    
    private func setUpSenderMessageView() {
        view.addSubview(senderMessageView)
        
        NSLayoutConstraint.activate([
            senderMessageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            senderMessageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
    
    //MARK: - Switcher
    private func setUpColorSchemeSwitcherComponent() {
        view.addSubview(colorSchemeSwitcherComponent)
        
        colorSchemeSwitcherComponent.setHeight(27)
        colorSchemeSwitcherComponent.setWidth(54)
        
        colorSchemeSwitcherComponent.topAnchor.constraint(equalTo: view.topAnchor, constant: 52).isActive = true
        colorSchemeSwitcherComponent.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
    }
}

