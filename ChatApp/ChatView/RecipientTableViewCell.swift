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
    
    func setup(with text: String) {
        recipientBubble.setTextToBubble(text)
        setUpRecipientBubbleCell()
    }
}

//MARK: - Constants
extension RecipientTableViewCell {
    enum Constants {
        enum RecipientBubbleView {
            static let recipientBubbleHeightPadding = 8.0
            static let recipientBubbleLeftPadding = 16.0
        }
    }
}
