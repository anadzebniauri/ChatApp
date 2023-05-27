//
//  SendMessageModel.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 16.05.23.
//

import Foundation
import CoreData

protocol ChatViewModelDelegate: AnyObject {
    func updateMessages(_ messages: MessageEntity)
}

class ChatViewModel {
    private let messageCoreDataManager = MessageCoreDataManager()
    
    weak var delegate: ChatViewModelDelegate?
}
