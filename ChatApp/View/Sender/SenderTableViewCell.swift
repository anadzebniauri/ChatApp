//
//  SenderTableViewCell.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 28.04.23.
//

import UIKit

final class SenderTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    var senderBubble = SenderMessageView().forAutoLayout()
    
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
            senderBubble.topAnchor.constraint(equalTo: topAnchor, constant: Constants.senderBubbleHeightPadding),
            senderBubble.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.senderBubbleHeightPadding),
            senderBubble.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.senderBubbleRightPadding),
            senderBubble.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor)
        ])
    }
    
    func fill(_ text: String) {
        senderBubble.setTextToBubble(text)
    }
}

//MARK: - Constants
extension SenderTableViewCell {
    enum Constants {
        static let senderBubbleHeightPadding = 8.0
        static let senderBubbleRightPadding = -16.0
    }
}
