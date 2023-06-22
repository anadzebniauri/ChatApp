//
//  ViewModel.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 04.06.23.
//

import Foundation

class ChatAppViewModel {
    
    private let messageCoreDataManager = MessageCoreDataManager()
    
    func setUpMessages(with text: String, userId: Int16) -> MessageEntity {
        guard Network.shared.isConnected else {
            return messageCoreDataManager.saveMessage(text: text, userId: userId, isSent: false)
        }
        return messageCoreDataManager.saveMessage(text: text, userId: userId)
    }
    
    func getDataSource(completion: @escaping ([MessageEntity])-> Void) {
        messageCoreDataManager.fetchMessages { messages in
            completion(messages)
        }
    }
}
