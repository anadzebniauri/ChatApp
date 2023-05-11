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
            recipientBubble.topAnchor.constraint(equalTo: topAnchor, constant: Constants.RecipientBubbleView.recipientBubbleHeightPadding),
            recipientBubble.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.RecipientBubbleView.recipientBubbleHeightPadding),
            recipientBubble.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            recipientBubble.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.RecipientBubbleView.recipientBubbleLeftPadding)
        ])
    }
    
    func setup(with text: String) {
        recipientBubble.setTextToBubble(text)
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
