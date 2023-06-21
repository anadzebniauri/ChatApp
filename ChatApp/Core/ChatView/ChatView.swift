//
//  ChatView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 01.05.23.
//

import UIKit

// MARK: - Delegate
protocol ChatViewDelegate: AnyObject {
    func chatView(_ chatView: ChatView, shouldSendMessage text: String)
}

// MARK: - ChatView
final class ChatView: UIView {
    
    // MARK: - Properties
    weak var delegate: ChatViewDelegate?
    
    // MARK: - UI Components
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
    
    //MARK: - Init
    override required init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func setUp() {
        setUpTableView()
        setUpTypingAreaView()
    }

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
    
    private func setUpTableView() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: - Internal

extension ChatView: TypingAreaViewDelegate {
    func messageTextViewColorConfigure(_ isDarkMode: Bool) {
        typingAreaView.messageTextViewColorConfigure(isDarkMode)
    }
    
    func typingAreaView(_ typingAreaView: TypingAreaView, didTryToSendMessage text: String) {
        delegate?.chatView(self, shouldSendMessage: text)
    }
}

extension ChatView: UITableViewDelegate { }

//MARK: - Table View Delegate, DataSource
extension ChatView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatAppViewModel.messageCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let message = chatViewModel.sortedMessage(at: indexPath) else { return UITableViewCell() }
        guard let message = chatAppViewDelegate?.sortedMessage(at: indexPath) else { return UITableViewCell() }
        if message.userId == chatAppViewModel.recipientId {
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.RecipientTableView.cell, for: indexPath) as? RecipientTableViewCell {
                cell.setup(with: message)
                return cell
            }
        } else if message.userId == chatAppViewModel.senderId {
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
