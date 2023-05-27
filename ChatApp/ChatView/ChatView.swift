//
//  ChatView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 01.05.23.
//

import UIKit

protocol ChatViewDelegate: AnyObject {
    func send(message: MessageEntity, fromTop: Bool)
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
    
    weak var delegate: ChatViewDelegate?
    
    var typingAreaView = TypingAreaView()
    let messageCoreDataManager = MessageCoreDataManager()
    
    private var sender: User?
    private var recipient: User?
    
    private var messageCount: Int {
        guard let sender = sender, let recipient = recipient else { return 0 }
        return sender.messages.count + recipient.messages.count
    }
    
    //MARK: - Init
    override required init(frame: CGRect) {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    public func setUpUsers(sender: User, recipient: User) {
        self.sender = sender
        self.recipient = recipient
        sender.type = .sender
        recipient.type = .recipient
        tableView.reloadData()
    }

    private func setUp() {
        setUpTableView()
        setUpTypingAreaView()
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
    
    func receivedMessage() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.messageCount - 1, section: 0)
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}

//MARK: - Chat View Model Delegate
extension ChatView: ChatViewModelDelegate {
    func updateMessages(_ messages: MessageEntity) {

        let previousCount = messageCount
        self.sender?.messages.append(messages)
        let newCount = messageCount

        DispatchQueue.main.async {
            if previousCount == 0 {
                self.tableView.reloadData()
            } else {
                let indexPaths = (previousCount..<newCount).map { IndexPath(row: $0, section: 0) }
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: indexPaths, with: .automatic)
                self.tableView.endUpdates()
            }
            let lastRowIndex = newCount - 1
            let lastIndexPath = IndexPath(row: lastRowIndex, section: 0)
            self.tableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
        }
    }
}

// MARK: - Send Button
extension ChatView: SendButtonDelegate {
    func sendButtonTap() {
        guard let text = typingAreaView.messageTextView.text, !text.isEmpty else {
            return
        }
        let newMessage = messageCoreDataManager.saveMessage(text: text, userId: sender?.userId ?? -1 , date: Date())
        self.updateMessages(newMessage)
        typingAreaView.messageTextView.text = ""
        
        delegate?.send(message: newMessage, fromTop: sender?.userId == 0)
    }
}

//MARK: - Table View Delegate, DataSource
extension ChatView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messageCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sender = sender, let recipient = recipient else { return UITableViewCell() }
        let messages = sender.messages + recipient.messages
        let sortedMessages = messages.sorted(by: {$0.date?.compare($1.date ?? Date()) == .orderedAscending})
        let message = sortedMessages[indexPath.row]
        if message.userId == recipient.userId {
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.RecipientTableView.cell, for: indexPath) as? RecipientTableViewCell {
                cell.setup(with: message.text ?? "")
                return cell
            }
        } else if message.userId == sender.userId {
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.SenderTableView.cell, for: indexPath) as? SenderTableViewCell {
                cell.setup(with: message.text ?? "")
                return cell
            }
        }
        return UITableViewCell()
    }
}

//MARK: - Constants
extension ChatView {
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
