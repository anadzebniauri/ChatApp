//
//  MessageView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 21.04.23.
//

import UIKit

class SenderMessageView: UIView {
    
    private let capsuleView = SenderCapsuleBubble().forAutoLayout()
    private let mediumBubble = SenderBubble().forAutoLayout()
    private let smallBubble = SenderBubble().forAutoLayout()
        
    private let messageLabel = UILabel().forAutoLayout()
    private let dateLabel = UILabel().forAutoLayout()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpMessageLabel()
        setUpDateLabel()
        setUpCapsuleView()
        setUpMediumBubble()
        setUpSmallBubble()
    }
    
    required init?(coder: NSCoder) {
        fatalError("!")
    }
    
    func setUpMessageLabel() {
        capsuleView.addSubview(messageLabel)
        
        messageLabel.font = UIFont(name: "Myriad GEO", size: 14)
        messageLabel.textColor = .messageTextColor
        messageLabel.textAlignment = .left
        messageLabel.numberOfLines = 0
        
        // Add constraints to position and size the label within the bubble
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: capsuleView.topAnchor, constant: 16),
            messageLabel.bottomAnchor.constraint(equalTo: capsuleView.bottomAnchor, constant: -16),
            messageLabel.rightAnchor.constraint(equalTo: capsuleView.rightAnchor, constant: -18),
            messageLabel.leftAnchor.constraint(equalTo: capsuleView.leftAnchor, constant: 18)
        ])
        messageLabel.text = "გამარჯობა, ანა"
    }
    
    func setUpDateLabel() {
        addSubview(dateLabel)
        
        dateLabel.font = UIFont.systemFont(ofSize: 10)
        dateLabel.textColor = .dateTextColor
        dateLabel.numberOfLines = 0
        
        dateLabel.setHeight(10)

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 52),
            dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
        ])
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, h:mm "
        let currentDateTime = Date()
        let dateTimeString = dateFormatter.string(from: currentDateTime)
        dateLabel.text = dateTimeString
    }
    
    func setUpCapsuleView() {
        addSubview(capsuleView)
        
        NSLayoutConstraint.activate([
            capsuleView.topAnchor.constraint(equalTo: topAnchor),
            capsuleView.leftAnchor.constraint(equalTo: leftAnchor),
            capsuleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
            capsuleView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
            
        ])
        capsuleView.layer.cornerRadius = 25
        
    }
    
    func setUpMediumBubble() {
        addSubview(mediumBubble)
        
        mediumBubble.setHeight(17.4)
        mediumBubble.setWidth(18.18)
        
        NSLayoutConstraint.activate([
            mediumBubble.topAnchor.constraint(equalTo: topAnchor, constant: 31),
            mediumBubble.rightAnchor.constraint(equalTo: rightAnchor, constant: -12)
        ])
        
        mediumBubble.layer.cornerRadius = 25
    }
    
    func setUpSmallBubble() {
        addSubview(smallBubble)
        
        smallBubble.setHeight(9.57)
        smallBubble.setWidth(10)
        
        NSLayoutConstraint.activate([
            smallBubble.topAnchor.constraint(equalTo: topAnchor, constant: 43),
            smallBubble.rightAnchor.constraint(equalTo: rightAnchor),
            smallBubble.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9)
        ])
        smallBubble.layer.cornerRadius = 25
    }
    
}

