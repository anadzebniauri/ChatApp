//
//  MessageCoreData.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 15.05.23.
//

import UIKit
import CoreData

class MessageCoreData {
    static func saveMessage(text: String, id: Int64, date: Date) {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let message = Message(context: context)
        
        message.id = id
        message.text = text
        message.date = date
        
        do {
            try context.save()
            print("message \(id) saved")
        } catch {
            print("can not save")
        }
    }
    
    static func fetchMessages(completion: @escaping (([Message])-> Void)) {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<Message> = Message.fetchRequest()
        
        do {
            let messages = try context.fetch(request)
            completion(messages)
        } catch {
            print("can not fetch")
        }
    }
}
