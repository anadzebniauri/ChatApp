//
//  MessageView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 21.04.23.
//

import UIKit

class MessageView: UIView {
    
    private let capsuleView = CapsuleBubble(for: .recipient).forAutoLayout()
    private let mediumBubble = Bubble(for: .recipient).forAutoLayout()
    private let smallBubble = Bubble(for: .recipient).forAutoLayout()
    
    
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
        // Add constraints to position and size the label within the bubble
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 149),
            dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 46)
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
            capsuleView.topAnchor.constraint(equalTo: topAnchor, constant: 95),
            capsuleView.leftAnchor.constraint(equalTo: leftAnchor, constant: 32)
        ])
        
        capsuleView.layer.cornerRadius = 25
    }
    
    func setUpMediumBubble() {
        addSubview(mediumBubble)
        
        mediumBubble.setHeight(17.4)
        mediumBubble.setWidth(18.18)
        
        NSLayoutConstraint.activate([
            mediumBubble.topAnchor.constraint(equalTo: topAnchor, constant: 128),
            mediumBubble.leftAnchor.constraint(equalTo: leftAnchor, constant: 27.82)
        ])
        
        mediumBubble.layer.cornerRadius = 25
    }
    
    func setUpSmallBubble() {
        addSubview(smallBubble)
        
        smallBubble.setHeight(9.57)
        smallBubble.setWidth(10)
        
        NSLayoutConstraint.activate([
            smallBubble.topAnchor.constraint(equalTo: topAnchor, constant: 140.43),
            smallBubble.leftAnchor.constraint(equalTo: leftAnchor, constant: 16)
        ])
        
        smallBubble.layer.cornerRadius = 25
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



