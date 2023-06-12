//
//  User.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 23.05.23.
//

import Foundation

enum UserType: Int16 {
    case sender, recipient, none
}

class User {
    var type: UserType = .none
    var messages: [MessageEntity] = []
    var userId: Int16
    
    init(userId: Int16) {
        self.userId = userId
    }
}
