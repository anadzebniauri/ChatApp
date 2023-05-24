//
//  User.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 23.05.23.
//

import Foundation

enum UserType: Int64 {
    case sender, recipient, none
}

class User {
    var type: UserType
    var messages: [MessageEntity]  = []
    var userId: Int64
    
    init (type: UserType = .none, userId: Int64) {
        self.type = type
        self.userId = userId
    }
}
