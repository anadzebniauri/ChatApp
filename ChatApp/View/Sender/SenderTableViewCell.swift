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
        addSubview(senderBubble)
        setUpSenderBubbleCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func setUpSenderBubbleCellConstraints() {
        
        NSLayoutConstraint.activate([
            senderBubble.topAnchor.constraint(equalTo: self.topAnchor),
            senderBubble.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            senderBubble.rightAnchor.constraint(equalTo: self.rightAnchor),
            senderBubble.leftAnchor.constraint(greaterThanOrEqualTo: self.leftAnchor)
        ])
    }
    
    func addText(_ text: String) {
        senderBubble.setTextToBubble(text)
    }
}

