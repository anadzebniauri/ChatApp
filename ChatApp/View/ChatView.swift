//
//  ChatView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 01.05.23.
//

import UIKit

class ChatView: UIView {
    
    //MARK: - Properties
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecipientTableViewCell.self, forCellReuseIdentifier: Constants.RecipientTableView.cell)
        tableView.register(SenderTableViewCell.self, forCellReuseIdentifier: Constants.SenderTableView.cell)
        return tableView
    }()
    
    var typingAreaView = TypingAreaView()
    
    var messages:[Message] = []
        
    //MARK: - Init
    override required init(frame: CGRect) {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setUp() {
        setUpTableView()
        setUpTypingAreaView()
        fetchMessages()
    }
    
    private func fetchMessages() {
        MessageCoreDataManager.fetchMessages { [weak self] messages in
            self?.updateMessages(messages: messages)
        }
    }

    func updateMessages(messages: [Message]) {
        guard !messages.isEmpty else {
            return
        }
        
        let previousCount = self.messages.count
        self.messages.append(contentsOf: messages)
        let newCount = self.messages.count
        
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

//MARK: - Table View Delegate, DataSource
extension ChatView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        if indexPath.row % 2 == 0 { // even rows are "receiverTableViewCell"
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.RecipientTableView.cell, for: indexPath) as? RecipientTableViewCell {
                cell.setup(with: message.text ?? "")
                return cell
            }
        } else { // odd rows are "senderTableViewCell"
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.SenderTableView.cell, for: indexPath) as? SenderTableViewCell {
                cell.setup(with: message.text ?? "")
                return cell
            }
        }
        return UITableViewCell()
    }
}

//MARK: - Send Button Delegate

extension ChatView: SendButtonDelegate {
    func sendButtonTap() {
        guard let text = typingAreaView.messageTextView.text, !text.isEmpty else {
            return
        }
        MessageCoreDataManager.saveMessage(text: text, userId: 1, date: Date())
        MessageCoreDataManager.fetchMessages { [weak self] messages in
            guard let lastMessage = messages.last else {
                return
            }
            self?.updateMessages(messages: [lastMessage])
        }
        typingAreaView.messageTextView.text = ""
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
