//
//  ChatView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 01.05.23.
//

import UIKit

protocol ChatViewDelegate: AnyObject {
    func send(fromTop: Bool, messages: MessageEntity)
    func receivedMessage(_ messages: MessageEntity)
    func setUpMessages(with text: String)
    func setUpUsers(sender: User, recipient: User)
    func sortedMessage(at indexPath: IndexPath) -> MessageEntity?
}

class ChatView: UIView {
    
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
    
    private var typingAreaView = TypingAreaView()
    
    weak var delegate: ChatViewDelegate?
    
    private let chatViewModel = ChatAppViewModel()

    //MARK: - Init
    override required init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setUp() {
        setUpTableView()
        setUpTypingAreaView()

    }
    
    func setUpUsers(sender: User, recipient: User) {
        delegate?.setUpUsers(sender: sender, recipient: recipient)
    }

    func receivedMessage(_ messages: MessageEntity) {
        delegate?.receivedMessage(messages)
    }
    
    //MARK: - Typing Area
    private func setUpTypingAreaView() {
        addSubview(typingAreaView)
        typingAreaView.delegate = self
        typingAreaView.translatesAutoresizingMaskIntoConstraints = false
        
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
extension ChatView: SendButtonDelegate {
    func messageTextViewColorConfigure(_ isDarkMode: Bool) {
        typingAreaView.messageTextViewColorConfigure(isDarkMode)
    }
    
    func sendButtonTap(with text: String) {
        delegate?.setUpMessages(with: text)
    }
}

//MARK: - Table View Delegate, DataSource
extension ChatView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatViewModel.messageCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let message = delegate?.sortedMessage(at: indexPath) else { return UITableViewCell() }
        if message.userId == chatViewModel.recipientId {
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.RecipientTableView.cell, for: indexPath) as? RecipientTableViewCell {
                cell.setup(with: message)
                return cell
            }
        } else if message.userId == chatViewModel.senderId {
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.SenderTableView.cell, for: indexPath) as? SenderTableViewCell {
                cell.setup(with: message)
                return cell
            }
        }
        return UITableViewCell()
    }
}

//MARK: - Chat View Delegate Methods
extension ChatView: ChatAppViewControllerDelegate {
    
    func scrollTableView(at indexPath: IndexPath) {
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }

    func addActionsToTableView(at indexPaths: [IndexPath]) {
        tableView.beginUpdates()
        tableView.insertRows(at: indexPaths, with: .automatic)
        tableView.endUpdates()
    }

    func reloadTableView() {
        tableView.reloadData()
    }
    
    func send(fromTop: Bool, messages: MessageEntity) {
        delegate?.send(fromTop: fromTop, messages: messages)
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
