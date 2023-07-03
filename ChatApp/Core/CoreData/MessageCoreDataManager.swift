//
//  MessageCoreData.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 15.05.23.
//

import CoreData
import Network

class MessageCoreDataManager: CoreDataManager<MessageEntity> {

    func saveMessage(text: String, userId: Int16, date: Date = Date(), isSent: Bool = true ) -> MessageEntity {
        let messageEntity = MessageEntity(context: viewContext)

        messageEntity.userId = userId
        messageEntity.text = text
        messageEntity.date = date
        messageEntity.isSent = isSent

        saveContext()
        return messageEntity
    }

    func fetchMessages(completion: @escaping ([MessageEntity]) -> Void) {
        let result = fetch(entityName: Constants.entityName, predicate: nil, sortDescriptors: [NSSortDescriptor(key: Constants.key, ascending: true)])
        completion(result)
    }

}

private extension MessageCoreDataManager {
    enum Constants {
       static let entityName = "MessageEntity"
       static let key = "date"
   }
}
