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
        setUpSenderBubbleCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func setUpSenderBubbleCellConstraints() {
        addSubview(senderBubble)
        
        NSLayoutConstraint.activate([
            senderBubble.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            senderBubble.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            senderBubble.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            senderBubble.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor)
        ])
    }
    
    func setUpSenderCell() {
        self.selectionStyle = .none
    }
    
    func fill(_ text: String) {
        senderBubble.setTextToBubble(text)
    }
}
