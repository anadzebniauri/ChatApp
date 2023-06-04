//
//  SenderTableViewCell.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 28.04.23.
//

import UIKit

final class SenderTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    private var senderBubble = SenderMessageView().forAutoLayout()
    
    //MARK: - Methods
    private func setUpSenderBubbleCell() {
        addSubview(senderBubble)
        selectionStyle = .none
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            senderBubble.topAnchor.constraint(equalTo: topAnchor, constant: Constants.SenderBubbleView.senderBubbleHeightPadding),
            senderBubble.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.SenderBubbleView.senderBubbleHeightPadding),
            senderBubble.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.SenderBubbleView.senderBubbleRightPadding),
            senderBubble.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor)
        ])
    }
    
    func setup(with text: String) {
        senderBubble.setTextToBubble(text)
        setUpSenderBubbleCell()
    }
}

//MARK: - Constants
extension SenderTableViewCell {
    enum Constants {
        enum SenderBubbleView {
            static let senderBubbleHeightPadding = 8.0
            static let senderBubbleRightPadding = -16.0
        }
    }
}
