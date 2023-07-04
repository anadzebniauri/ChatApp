//
//  ViewModel.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 04.06.23.
//

import Foundation

class ChatAppViewModel {
    
    //MARK: - Properties
    var dataSource: [MessageEntity] = []
    private let messageCoreDataManager = MessageCoreDataManager()
    
    //MARK: - Methods
    func setUpMessages(with text: String, userId: Int16) -> MessageEntity {
        guard Network.isConnectedToNetwork() else {
            return messageCoreDataManager.saveMessage(text: text, userId: userId, isSent: false)
        }
        return messageCoreDataManager.saveMessage(text: text, userId: userId)
    }
    
    func getDataSource(completion: @escaping ([MessageEntity])-> Void) {
        messageCoreDataManager.fetchMessages(completion: completion)
    }
    
    private func isSentMessage (message: MessageEntity, userID: Int16) -> Bool {
        message.isSent || message.userId == userID
    }
    
    func filterMessages(messages: [MessageEntity], userID: Int16) -> [MessageEntity] {
        messages.filter { isSentMessage(message: $0, userID: userID) }
    }
}
