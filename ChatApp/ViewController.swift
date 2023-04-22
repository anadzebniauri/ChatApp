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

    
    override func viewDidLoad() {
        super.viewDidLoad()
    //Do any additional setup after loading the view.
        setUpColorSchemeSwitcherComponent()
        setUpMessageView()
    }
    
//    MARK: - Message VIew
    private func setUpMessageView() {
        view.addSubview(messageview)
        
    }
    
    //MARK: - Switcher
    
    private func setUpColorSchemeSwitcherComponent() {
        view.addSubview(colorSchemeSwitcherComponent)
        
        colorSchemeSwitcherComponent.setHeight(27)
        colorSchemeSwitcherComponent.setWidth(54)
        
        colorSchemeSwitcherComponent.topAnchor.constraint(equalTo: view.topAnchor, constant: 52).isActive = true
        colorSchemeSwitcherComponent.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        
        colorSchemeSwitcherComponent.translatesAutoresizingMaskIntoConstraints = false
    }
}
