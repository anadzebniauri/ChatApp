//
//  MessageCoreData.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 15.05.23.
//

import CoreData
import Network

class MessageCoreDataManager: CoreDataManager<MessageEntity> {

    func saveMessage(text: String, userId: Int16, date: String, messageId: Int16) -> MessageEntity {
        let messageEntity = MessageEntity(context: viewContext)

        if Network.shared.isConnected {
            messageEntity.setValue(date, forKey: #keyPath(MessageEntity.date))
        }
        else {
            messageEntity.setValue(Constant.errorMessage, forKey: #keyPath(MessageEntity.date))
        }

        messageEntity.userId = userId
        messageEntity.text = text
        messageEntity.date = date
        messageEntity.messageId = messageId

        saveContext()
        return messageEntity
    }

    func fetchMessages(completion: @escaping ([MessageEntity]) -> Void) {
        let result = fetch(entityName: "MessageEntity", predicate: nil, sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)])
        completion(result)
    }
}

enum Constant {
    static let errorMessage = "არ გაიგზავნა"
}
