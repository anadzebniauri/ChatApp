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
        addSubview(recipientBubble)
        setUpRecipientBubbleCellConstraints()
        layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func setUpRecipientBubbleCellConstraints() {
        NSLayoutConstraint.activate([
            recipientBubble.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            recipientBubble.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            recipientBubble.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor),
            recipientBubble.leftAnchor.constraint(equalTo: leftAnchor, constant: 16)
        ])
    }
    
    func setUpRecipientCell() {
        self.selectionStyle = .none
    }
    
    func fill(_ text: String) {
        recipientBubble.setTextToBubble(text)
    }
}
