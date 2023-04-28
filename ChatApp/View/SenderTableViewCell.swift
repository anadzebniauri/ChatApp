//
//  SenderTableViewCell.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 28.04.23.
//

import UIKit

final class SenderTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    private let senderBubble = SenderMessageView()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .red
        addSubview(senderBubble)
        setUpSenderBubbleCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setUpSenderBubbleCellConstraints() {
        senderBubble.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            senderBubble.topAnchor.constraint(equalTo: self.topAnchor),
            senderBubble.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            senderBubble.rightAnchor.constraint(equalTo: self.rightAnchor),
            senderBubble.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])

        senderBubble.setHeight(50)
    }
    
    func addText(_ text: String) {
        senderBubble.setTextToBubble(text)
    }
}

