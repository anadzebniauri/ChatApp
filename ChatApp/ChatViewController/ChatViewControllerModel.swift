//
//  ChatViewControllerModel.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 22.05.23.
//

import Foundation

protocol ChatViewControllerDelegate: AnyObject {
    func getUsers(completion: @escaping ((User, User)?) -> Void)
}
class ChatViewControllerModel: ChatViewControllerDelegate {
    
    private let messageCoreDataManager = MessageCoreDataManager()
    private let firstUser = User(userId: 0)
    private let secondUser = User(userId: 1)
    
    func getUsers(completion: @escaping ((User, User)?) -> Void) {
        messageCoreDataManager.fetchMessages { [weak self] messages in
            guard let self = self else { return }
            
            self.firstUser.messages = messages.filter { $0.userId == self.firstUser.userId }
            self.secondUser.messages = messages.filter { $0.userId == self.secondUser.userId }
            completion((self.firstUser, self.secondUser))
        }
    }
}
