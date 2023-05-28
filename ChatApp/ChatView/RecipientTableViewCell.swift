//
//  ReceiverTableViewCell.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 28.04.23.
//

import UIKit

class RecipientTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    private var recipientBubble = RecipientMessageView().forAutoLayout()
    private var recipientTypingIndicator = RecipientTypingIndicator().forAutoLayout()
    var isTyping = false
    
    //MARK: - Methods
    private func setUpRecipientBubbleCell() {
        addSubview(recipientBubble)
        selectionStyle = .none
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            recipientBubble.topAnchor.constraint(equalTo: topAnchor, constant: Constants.RecipientBubbleView.recipientBubbleHeightPadding),
            recipientBubble.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.RecipientBubbleView.recipientBubbleHeightPadding),
            recipientBubble.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.RecipientBubbleView.recipientBubbleLeftPadding),
            recipientBubble.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)
        ])
    }
    
    private func setUpTypingIndicatorBubble() {
            addSubview(recipientTypingIndicator)
            recipientTypingIndicator.isHidden = true
            
            NSLayoutConstraint.activate([
                recipientTypingIndicator.topAnchor.constraint(equalTo: topAnchor, constant: Constants.RecipientBubbleView.typingIndicatorTopPadding),
                recipientTypingIndicator.leadingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.RecipientBubbleView.typingIndicatorLeftPadding),
                recipientTypingIndicator.widthAnchor.constraint(equalToConstant: Constants.RecipientBubbleView.typingIndicatorSize),
                recipientTypingIndicator.heightAnchor.constraint(equalToConstant: Constants.RecipientBubbleView.typingIndicatorSize)
            ])
        }
    
//    func setup(with text: String) {
//        recipientBubble.setTextToBubble(text)
//        setUpRecipientBubbleCell()
//    }
    
    func setup(with text: String, isTyping: Bool) {
//        recipientBubble.setTextToBubble(text)
//        self.isTyping = isTyping
        
        if isTyping == true {
            recipientTypingIndicator.isHidden = false
        } else {
            recipientTypingIndicator.isHidden = true
            recipientBubble.setTextToBubble(text)
        }
        
        setUpRecipientBubbleCell()
        setUpTypingIndicatorBubble()
    }
}

//MARK: - Constants
extension RecipientTableViewCell {
    enum Constants {
        enum RecipientBubbleView {
            static let recipientBubbleHeightPadding = 8.0
            static let recipientBubbleLeftPadding = 16.0
            static let typingIndicatorTopPadding = 10.0
            static let typingIndicatorLeftPadding = 8.0
            static let typingIndicatorSize = 10.0
        }
    }
}
