//
//  ViewController.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 14.04.23.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

//MARK: - Properties
    private let switcherView = SwitcherView().forAutoLayout()
    
    private let receiverTypingArea = TypingAreaView().forAutoLayout()
    private let senderTypingArea = TypingAreaView().forAutoLayout()
    
    private let receiverMessageView = RecipientMessageView().forAutoLayout()
    private let senderMessageView = SenderMessageView().forAutoLayout()
    
    private let dividerView = DividerView().forAutoLayout()
    
    private let receiverTableView = UITableView().forAutoLayout() //tag = 1
    private let senderTableView = UITableView().forAutoLayout() //tag = 2
    
    private var senderMessages: [String] = []
    private var receiverMessages: [String] = []
    
//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.

        setUpSwitcherView()
        setUpDividerView()

        setUpReceiverTypingArea()
        setUpReceiverTableView()

        setUpSenderTypingArea()
        setUpSenderTableView()
        
//        setUpRecipientMessageView()
//        setUpSenderMessageView()
        
        receiverTableView.register(ReceiverTableViewCell.self, forCellReuseIdentifier: "receiverTableViewCell")
        senderTableView.register(SenderTableViewCell.self, forCellReuseIdentifier: "senderTableViewCell")
    }
    
//MARK: - Typing Areas
    private func setUpReceiverTypingArea() {
        view.addSubview(receiverTypingArea)

        NSLayoutConstraint.activate([
            receiverTypingArea.bottomAnchor.constraint(equalTo: dividerView.topAnchor, constant: -30),
            receiverTypingArea.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            receiverTypingArea.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
    }
    
    private func setUpSenderTypingArea() {
        view.addSubview(senderTypingArea)
        
        NSLayoutConstraint.activate([
            senderTypingArea.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            senderTypingArea.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            senderTypingArea.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
    }
    
//MARK: - Message Views
    private func setUpRecipientMessageView() {
        view.addSubview(receiverMessageView)

        NSLayoutConstraint.activate([
            receiverMessageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            receiverMessageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            receiverMessageView.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor)

            
        ])
    }

    private func setUpSenderMessageView() {
        view.addSubview(senderMessageView)

        NSLayoutConstraint.activate([
            senderMessageView.bottomAnchor.constraint(equalTo: receiverTypingArea.topAnchor, constant: -16),
            senderMessageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            senderMessageView.leftAnchor.constraint(greaterThanOrEqualTo: view.leftAnchor)
        ])
    }

//MARK: - Switcher
    private func setUpSwitcherView() {
        view.addSubview(switcherView)

        NSLayoutConstraint.activate([
            switcherView.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            switcherView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12)
        ])

    }
    
//MARK: - Divider View
    private func setUpDividerView() {
        view.addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            dividerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dividerView.centerYAnchor.constraint(equalTo: view.centerYAnchor ),
            dividerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            dividerView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
    
    
//MARK: - Receiver Table View Set Up
    private func setUpReceiverTableView() {
        receiverTableView.delegate = self
        receiverTableView.dataSource = self
        
        view.addSubview(receiverTableView)
        NSLayoutConstraint.activate([
            receiverTableView.topAnchor.constraint(equalTo: switcherView.bottomAnchor),
            receiverTableView.bottomAnchor.constraint(equalTo: receiverTypingArea.topAnchor),
            receiverTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            receiverTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

//MARK: - Sender Table View Set Up
    private func setUpSenderTableView() {
        senderTableView.delegate = self
        senderTableView.dataSource = self
        
        view.addSubview(senderTableView)
        
        NSLayoutConstraint.activate([
            senderTableView.topAnchor.constraint(equalTo: dividerView.bottomAnchor),
            senderTableView.bottomAnchor.constraint(equalTo: senderTypingArea.topAnchor),
            senderTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            senderTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    
//MARK: - Table Views
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == receiverTableView {
            // return the number of rows for tableView1
            return 5
        } else {
            // return the number of rows for tableView2
            return 5
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == receiverTableView {
            // dequeue and configure a cell for tableView1
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "receiverTableViewCell", for: indexPath) as? ReceiverTableViewCell else {
                fatalError("Cell can't cast to ReceiverTableViewCell") }
            
            cell.selectionStyle = .none
            cell.textLabel?.numberOfLines = 0
            receiverTableView.separatorStyle = .none
            let receiverBubble = receiverMessageView
            cell.receiverBubble = receiverBubble
            return cell
        } else {
            // dequeue and configure a cell for tableView2
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "senderTableViewCell", for: indexPath) as? SenderTableViewCell else { fatalError("Cell can't cast to SenderTableViewCell") }
            
            cell.selectionStyle = .none
            cell.textLabel?.numberOfLines = 0
            senderTableView.separatorStyle = .none

            let senderBubble = senderMessageView
            cell.senderBubble = senderBubble
            return cell
        }
    }
}
