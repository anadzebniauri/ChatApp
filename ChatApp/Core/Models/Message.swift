//
//  Message.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 16.06.23.
//

import Foundation

struct Message {
    let senderUserID: UserID
    let recipientUserID: UserID
    let text: String
    let date: Date
    var isSent: Bool
}
