//
//  ChatAppViewModel.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 14.06.23.
//

import Foundation

// MARK: - Delegate
protocol ChatAppViewModelDelegate: AnyObject {
    func chatAppViewModelMessageDidSent(_ chatAppViewModel: ChatAppViewModel)
    func chatAppViewModelMessageDidFail(_ chatAppViewModel: ChatAppViewModel)
}

// MARK: - ChatAppViewModel
final class ChatAppViewModel {

    // MARK: - Properties
    private let messageCoreDataManager = MessageCoreDataManager()
    
    weak var delegate: ChatAppViewModelDelegate?

    private func trySendMessage(_ message: Message) {
        guard Network.shared.isConnected else {
            delegate?.chatAppViewModelMessageDidFail(self)
            return
        }
        sendMessage(message)
    }
    
    private func sendMessage(_ message: Message) {
        messageCoreDataManager.saveMessage(message)
        delegate?.chatAppViewModelMessageDidSent(self)
    }

    func updateMessages(_ messages: MessageEntity) {
        let previousCount = messageCount
        self.sender?.messages.append(messages)
        let newCount = messageCount

        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            if previousCount == 0 {
                self.chatAppViewDelegate?.reloadTableView()
            } else {
                let indexPaths = (previousCount..<newCount).map { IndexPath(row: $0, section: 0) }
                self.chatViewDelegate?.addActionsToTableView(at: indexPaths)
            }
            let lastRowIndex = newCount - 1
            let lastIndexPath = IndexPath(row: lastRowIndex, section: 0)
            self.chatViewDelegate?.scrollTableView(at: lastIndexPath)
        }
    }

    func receivedMessage(_ messages: MessageEntity) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let indexPath = IndexPath(row: self.messageCount - 1, section: 0)
            self.chatAppViewDelegate?.addActionsToTableView(at: [indexPath])
            self.chatAppViewDelegate?.scrollTableView(at: indexPath)
        }
    }

    func sortedMessage(at indexPath: IndexPath) -> MessageEntity? {
        guard let sender = sender, let recipient = recipient else { return nil }
        let messages = sender.messages + recipient.messages.filter { $0.isSent }
        let sortedMessages = messages.sorted(by: {$0.date?.compare($1.date ?? Date()) == .orderedAscending})
        let message = sortedMessages[indexPath.row]
        return message
    }
}

extension ChatAppViewModel: ChatAppViewControllerDelegate {
    func chatAppViewController(_ chatAppViewController: ChatAppViewController, shouldSentMessage: Message) {
        sendMessage(message)
    }
}
