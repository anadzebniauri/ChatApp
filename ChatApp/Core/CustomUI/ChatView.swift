//
//  ChatView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 01.05.23.
//

import UIKit

protocol ChatViewDelegate: AnyObject {
    func send(_ chatView: ChatView, text: String)
}

class ChatView: UIView {
    
    weak var delegate: ChatViewDelegate?
    
    //MARK: - Properties
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecipientTableViewCell.self, forCellReuseIdentifier: Constants.RecipientTableView.cell)
        tableView.register(SenderTableViewCell.self, forCellReuseIdentifier: Constants.SenderTableView.cell)
        return tableView
    }()
    
    private lazy var typingAreaView: TypingAreaView = {
        let typingAreaView = TypingAreaView()
        typingAreaView.delegate = self
        typingAreaView.translatesAutoresizingMaskIntoConstraints = false
        return typingAreaView
    }()
    
    private var dataSource: [MessageEntity] = []
    
    //MARK: - Users
    private var sender: User?
    private var recipient: User?
    
    var senderId: Int16? {
        sender?.userId
    }
    
    var recipientId: Int16? {
        recipient?.userId
    }
    
    //MARK: - Init
    override required init(frame: CGRect) {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Ups
    private func setUp() {
        setUpTableView()
        setUpTypingAreaView()
    }
    
    func setUpUsers(sender: User, recipient: User) {
        self.sender = sender
        self.recipient = recipient
        sender.type = .sender
        recipient.type = .recipient
    }
    
    func scrollTableView() {
        let lastIndexPath = IndexPath(row: dataSource.count - 1, section: 0)
        tableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
    }
    
    func updateView(using dataSource: [MessageEntity]) {
        guard dataSource.last != nil else { return }
        
        self.dataSource = dataSource
        tableView.reloadData()
        scrollTableView()
    }
    
    //MARK: - Typing Area
    private func setUpTypingAreaView() {
        addSubview(typingAreaView)
        
        NSLayoutConstraint.activate([
            typingAreaView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            typingAreaView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.TypingArea.typingAreaViewPadding),
            typingAreaView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.TypingArea.typingAreaViewPadding),
            typingAreaView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    //MARK: - Table View Set Up
    private func setUpTableView() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: - Send Button
extension ChatView: TypingAreaViewDelegate {
    func messageTextViewColorConfigure(_ isDarkMode: Bool) {
        typingAreaView.messageTextViewColorConfigure(isDarkMode)
    }
    
    func sendButtonTap(with text: String) {
        delegate?.send(self, text: text)
    }
}

//MARK: - Table View Delegate, DataSource
extension ChatView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = dataSource[indexPath.row]
        
        guard let recipientCell = tableView.dequeueReusableCell(
            withIdentifier: Constants.RecipientTableView.cell, for: indexPath)
                as? RecipientTableViewCell else { return UITableViewCell() }
        
        guard let senderCell = tableView.dequeueReusableCell(
            withIdentifier: Constants.SenderTableView.cell, for: indexPath)
                as? SenderTableViewCell else { return UITableViewCell() }
        
        switch message.userId {
        case recipientId:
            recipientCell.setup(with: message)
            return recipientCell
        case senderId:
            senderCell.setup(with: message)
            return senderCell
        default:
            return UITableViewCell()
        }
    }
}
//MARK: - Constants
private extension ChatView {
    enum Constants{
        enum TypingArea {
            static let typingAreaViewPadding = 16.0
        }
        enum RecipientTableView {
            static let cell = "recipientTableViewCell"
        }
        enum SenderTableView {
            static let cell = "senderTableViewCell"
        }
    }
}

