//
//  ChatViewControllerModel.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 22.05.23.
//

import Foundation

class UserManager {
    
    private let messageCoreDataManager = MessageCoreDataManager()
    private let firstUser = User(userId: 0)
    private let secondUser = User(userId: 1)
    
    func getUsers(completion: @escaping ((firstUser: User, secondUser: User)?) -> Void) {
        let firstUser = NSPredicate(format: "userId == %d", firstUser.userId)
        let secondUser = NSPredicate(format: "userId == %d", secondUser.userId)
        
        messageCoreDataManager.fetchMessages(withPredicate: firstUser) { [weak self] firstUserMessages in
            guard let self = self else { return }
            self.firstUser.messages = firstUserMessages
            
            self.messageCoreDataManager.fetchMessages(withPredicate: secondUser) { secondUserMessages in
                self.secondUser.messages = secondUserMessages
                completion((self.firstUser, self.secondUser))
            }
        }
    }
}
