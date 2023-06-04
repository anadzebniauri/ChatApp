//
//  ViewModel.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 04.06.23.
//

import Foundation

class ChatViewModel {
    
    weak var delegate: ChatViewDelegate?
    private let messageCoreDataManager = MessageCoreDataManager()

    private var sender: User?
    private var recipient: User?
    
    var senderId: Int16? {
        sender?.userId
    }
    
    var recipientId: Int16? {
        recipient?.userId
    }
    
    var messageCount: Int {
        guard let sender = sender, let recipient = recipient else { return 0 }
        return sender.messages.count + recipient.messages.count
    }
    
    public func setUpUsers(sender: User, recipient: User) {
        self.sender = sender
        self.recipient = recipient
        sender.type = .sender
        recipient.type = .recipient
        delegate?.reloadTableView()
    }
    
    func setUpMessages(with text: String) {
        guard Network.shared.isConnected else {
            // TODO: handle error
            return
        }
        let newMessage = messageCoreDataManager.saveMessage(text: text, userId: sender?.userId ?? -1 , date: Date())
        updateMessages(newMessage)
        delegate?.send(fromTop: sender?.userId == 0)
    }
    
    func updateMessages(_ messages: MessageEntity) {
        let previousCount = messageCount
        self.sender?.messages.append(messages)
        let newCount = messageCount

        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            if previousCount == 0 {
                self.delegate?.reloadTableView()
            } else {
                let indexPaths = (previousCount..<newCount).map { IndexPath(row: $0, section: 0) }
                self.delegate?.addActionsToTableView(at: indexPaths)
            }
            let lastRowIndex = newCount - 1
            let lastIndexPath = IndexPath(row: lastRowIndex, section: 0)
            self.delegate?.scrollTableView(at: lastIndexPath)
        }
    }
    
    func receivedMessage() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let indexPath = IndexPath(row: self.messageCount - 1, section: 0)
            self.delegate?.addActionsToTableView(at: [indexPath])
            self.delegate?.scrollTableView(at: indexPath)
        }
    }
    
    func sortedMessage(at indexPath: IndexPath) -> MessageEntity? {
        guard let sender = sender, let recipient = recipient else { return nil }
        let messages = sender.messages + recipient.messages
        let sortedMessages = messages.sorted(by: {$0.date?.compare($1.date ?? Date()) == .orderedAscending})
        let message = sortedMessages[indexPath.row]
        return message
    }
}
