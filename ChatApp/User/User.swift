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
    var type: UserType
    var messages: [MessageEntity]  = []
    var userId: Int16
    
    init (type: UserType = .none, userId: Int16) {
        self.type = type
        self.userId = userId
    }
}
