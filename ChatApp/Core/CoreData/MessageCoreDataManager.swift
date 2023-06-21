//
//  MessageCoreData.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 15.05.23.
//

import CoreData
import Network

class MessageCoreDataManager: CoreDataManager<MessageEntity> {

    func saveMessage(_ message: Message) {
        let messageEntity = MessageEntity(context: viewContext)

        messageEntity.userId = message.senderUserID
        messageEntity.text = message.text
        messageEntity.date = message.date
        messageEntity.isSent = message.isSent

        saveContext()
    }

    func fetchMessages(completion: @escaping ([MessageEntity]) -> Void) {
        let result = fetch(entityName: "MessageEntity", predicate: nil, sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)])
        completion(result)
    }
}

enum Constant {
    static let errorMessage = "არ გაიგზავნა"
}
