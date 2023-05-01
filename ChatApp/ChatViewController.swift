//
//  ViewController.swift
//  chatApp.test
//
//  Created by Ana Dzebniauri on 14.04.23.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Properties
    private let receiverTableView = UITableView().forAutoLayout() //tag = 1
    private let senderTableView = UITableView().forAutoLayout() //tag = 2

    private let chatView = ChatView().forAutoLayout()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        
        setUpChatView()
        setUpReceiverTableView()
        setUpSenderTableView()

        receiverTableView.register(ReceiverTableViewCell.self, forCellReuseIdentifier: "receiverTableViewCell")
        senderTableView.register(SenderTableViewCell.self, forCellReuseIdentifier: "senderTableViewCell")
    }
    
    //MARK: - Chat View Method
    private func setUpChatView() {
        view.addSubview(chatView)
        chatView.stretchOnParent()
    }

//    MARK: - Receiver Table View Set Up
    private func setUpReceiverTableView() {
        receiverTableView.delegate = self
        receiverTableView.dataSource = self
        
        view.addSubview(receiverTableView)
        NSLayoutConstraint.activate([
            receiverTableView.topAnchor.constraint(equalTo: chatView.switcherView.bottomAnchor),
            receiverTableView.bottomAnchor.constraint(equalTo: chatView.receiverTypingArea.topAnchor),
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
            senderTableView.topAnchor.constraint(equalTo: chatView.dividerView.bottomAnchor),
            senderTableView.bottomAnchor.constraint(equalTo: chatView.senderTypingArea.topAnchor),
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
            let receiverBubble = chatView.receiverMessageView
            cell.receiverBubble = receiverBubble
            return cell
        } else {
            // dequeue and configure a cell for tableView2
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "senderTableViewCell", for: indexPath) as? SenderTableViewCell else { fatalError("Cell can't cast to SenderTableViewCell") }
            
            cell.selectionStyle = .none
            cell.textLabel?.numberOfLines = 0
            senderTableView.separatorStyle = .none
            
            let senderBubble = chatView.senderMessageView
            cell.senderBubble = senderBubble
            return cell
        }
    }
}
