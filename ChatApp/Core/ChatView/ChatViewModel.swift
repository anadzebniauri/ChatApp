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
    
    func setUpUsers(sender: User, recipient: User) {
        self.sender = sender
        self.recipient = recipient
        sender.type = .sender
        recipient.type = .recipient
        delegate?.reloadTableView()
    }
    
    func networkNotConnected(with text: String) {
        let unsendMessage = messageCoreDataManager.saveMessage(text: text, userId: sender?.userId ?? -1, date: Constant.errorMessage, messageId: Int16(messageCount + 1))
        updateMessages(unsendMessage)
        delegate?.send(fromTop: sender?.userId == 0)
    }
    
    func setUpMessages(with text: String) {
        guard Network.shared.isConnected, let sender else {
            networkNotConnected(with: text)
            return
        }
        let newMessage = messageCoreDataManager.saveMessage(text: text, userId: sender.userId, date: getDate(), messageId: Int16(messageCount + 1))
        updateMessages(newMessage)
        delegate?.send(fromTop: sender.userId == 0)
    }
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, h:mm"
        let date = dateFormatter.string(from: Date())
        return date
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
        let sortedMessages = messages.sorted(by: {$0.messageId < $1.messageId})
        let message = sortedMessages[indexPath.row]
        return message
    }
}
