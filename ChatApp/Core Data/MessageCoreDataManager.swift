//
//  MessageCoreData.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 15.05.23.
//

import CoreData

class MessageCoreDataManager: CoreDataManager<MessageEntity> {
    
    func saveMessage(text: String, userId: Int16, date: Date) -> MessageEntity {
        let messageEntity = MessageEntity(context: viewContext)
        
        messageEntity.userId = userId
        messageEntity.text = text
        messageEntity.date = date
        
        saveContext()
        return messageEntity
    }
    
    func fetchMessages(completion: @escaping ([MessageEntity]) -> Void) {
        let result = fetch(entityName: "MessageEntity", predicate: nil, sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)])
        completion(result)
    }
}
