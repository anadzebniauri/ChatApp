//
//  ViewController.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 14.04.23.
//

import UIKit

class ViewController: UIViewController {

    private let colorSchemeSwitcherComponent = ColorSchemeSwitcherComponent().forAutoLayout()
    
    private let messageview = MessageView().forAutoLayout()
    
    private let typingArea = TypingArea().forAutoLayout()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    //Do any additional setup after loading the view.
        setUpColorSchemeSwitcherComponent()
        setUpMessageView()
        setUpTypingArea()
    }
    
    //MARK: - Typing Area
    private func setUpTypingArea() {
        view.addSubview(typingArea)

        NSLayoutConstraint.activate([
            typingArea.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            typingArea.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            typingArea.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            typingArea.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
    
//    MARK: - Message VIew
    private func setUpMessageView() {
        view.addSubview(messageview)

//        messageview.transform = CGAffineTransform(rotationAngle: -.pi/2)
//        messageview.transform = CGAffineTransform(rotationAngle: .pi/2)
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
