//
//  MessageCoreData.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 15.05.23.
//

import UIKit
import CoreData

class MessageCoreDataManager {
    
    static func saveMessage(text: String, userId: Int64, date: Date) {
        let context = AppDelegate.coreDataContainer.viewContext

        let message = Message(context: context)

        message.userId = userId
        message.text = text
        message.date = date

        do {
            try context.save()
            print("message \(userId) saved")
        } catch {
            print("can not save")
        }
    }
        
    static func fetchMessages(completion: @escaping ([Message]) -> Void) {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<Message> = Message.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            let messages = try context.fetch(request)
            completion(messages)
        } catch {
            print("can not fetch")
        }
    }
}
