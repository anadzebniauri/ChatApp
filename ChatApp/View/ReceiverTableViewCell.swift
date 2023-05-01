//
//  ReceiverTableViewCell.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 28.04.23.
//

import UIKit

class ReceiverTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    var receiverBubble = RecipientMessageView().forAutoLayout()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(receiverBubble)
        setUpReceiverBubbleCellConstraints()
        layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func setUpReceiverBubbleCellConstraints() {
        
        NSLayoutConstraint.activate([
            receiverBubble.topAnchor.constraint(equalTo: topAnchor),
            receiverBubble.bottomAnchor.constraint(equalTo: bottomAnchor),
            receiverBubble.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor),
            receiverBubble.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
    
    func fill(_ text: String) {
        receiverBubble.setTextToBubble(text)
    }
}
