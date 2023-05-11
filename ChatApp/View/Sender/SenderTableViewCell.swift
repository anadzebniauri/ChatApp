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
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSenderBubbleCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setUpSenderBubbleCell() {
        addSubview(senderBubble)
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            senderBubble.topAnchor.constraint(equalTo: topAnchor, constant: Constants.SenderBubbleView.senderBubbleHeightPadding),
            senderBubble.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.SenderBubbleView.senderBubbleHeightPadding),
            senderBubble.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.SenderBubbleView.senderBubbleRightPadding),
            senderBubble.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor)
        ])
    }
    
    func fill(_ text: String) {
        senderBubble.setTextToBubble(text)
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
