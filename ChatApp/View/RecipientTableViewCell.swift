//
//  ReceiverTableViewCell.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 28.04.23.
//

import UIKit

class RecipientTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    var recipientBubble = RecipientMessageView().forAutoLayout()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpRecipientBubbleCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setUpRecipientBubbleCell() {
        addSubview(recipientBubble)
        self.selectionStyle = .none

        NSLayoutConstraint.activate([
            recipientBubble.topAnchor.constraint(equalTo: topAnchor, constant: Constants.recipientBubbleHeightPadding),
            recipientBubble.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.recipientBubbleHeightPadding),
            recipientBubble.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor),
            recipientBubble.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.recipientBubbleLeftPadding)
        ])
    }
    
    func fill(_ text: String) {
        recipientBubble.setTextToBubble(text)
    }
}

//MARK: - Constants
extension RecipientTableViewCell {
    enum Constants {
        static let recipientBubbleHeightPadding = 8.0
        static let recipientBubbleLeftPadding = 16.0
    }
}
