//
//  ViewController.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 14.04.23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Properties
    private let colorSchemeSwitcherComponent = ColorSchemeSwitcherComponent().forAutoLayout()
    private let typingArea = TypingArea().forAutoLayout()
    
    private let recipientMessageview = RecipientMessageView().forAutoLayout()
    private let senderMessageView = SenderMessageView().forAutoLayout()
    
    private let recipientTableView = UITableView() //tag = 1
    private let senderTableView = UITableView().forAutoLayout() //tag = 2
    private let tableViewsStackView = UIStackView().forAutoLayout()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.

//        setUpColorSchemeSwitcherComponent()
//        setUpTypingArea()
//        setUpRecipientMessageView()
//        setUpSenderMessageView()
        
//        setUpRecipientTableView()
//        setUpSenderTableView()
        
        setUpTableViewsStackView()
        
        recipientTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        senderTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")


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

    //MARK: - Message VIew
    private func setUpRecipientMessageView() {
        view.addSubview(recipientMessageview)

        NSLayoutConstraint.activate([
            recipientMessageview.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            recipientMessageview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            recipientMessageview.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor, constant: 30)
        ])
    }

    private func setUpSenderMessageView() {
        view.addSubview(senderMessageView)

        NSLayoutConstraint.activate([
            senderMessageView.bottomAnchor.constraint(equalTo: typingArea.topAnchor, constant: -16),
            senderMessageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            senderMessageView.leftAnchor.constraint(greaterThanOrEqualTo: view.leftAnchor, constant: 30)
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
    
    //MARK: - Stack View
    private func setUpTableViewsStackView() {
        //MARK: - Add subviews
        view.addSubview(tableViewsStackView)
        tableViewsStackView.addArrangedSubview(recipientTableView)
        tableViewsStackView.addArrangedSubview(senderTableView)
        tableViewsStackView.stretchOnParent()
        tableViewsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - Customize Stack View
        tableViewsStackView.axis = .vertical
        tableViewsStackView.distribution = .fillEqually
        tableViewsStackView.spacing = 6
        tableViewsStackView.addBackground(color: .switcherItemViewColor)
        
        //MARK: - Delegates and Data Sources
        senderTableView.delegate = self
        senderTableView.dataSource = self
        recipientTableView.delegate = self
        recipientTableView.dataSource = self
                
    }
    
    //MARK: - Table Views
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == recipientTableView {
            // return the number of rows for tableView1
            return 10
        } else {
            // return the number of rows for tableView2
            return 2
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == recipientTableView {
            // dequeue and configure a cell for tableView1
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        } else {
            // dequeue and configure a cell for tableView2
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        }
    }

    // Implement other UITableViewDelegate and UITableViewDataSource methods for both table views as needed.

}


