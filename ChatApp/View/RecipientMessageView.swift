//
//  MessageView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 21.04.23.
//

import UIKit

final class RecipientMessageView: UIView {
    
    //MARK: - Properties
    private lazy var capsuleView = RecipientCapsuleBubbleView().forAutoLayout()
    private lazy var mediumBubbleView = RecipientMediumBubbleView().forAutoLayout()
    private lazy var smallBubbleView = RecipientSmallBubbleView().forAutoLayout()
    
    private lazy var messageLabel = UILabel().forAutoLayout()
    private lazy var dateLabel = UILabel().forAutoLayout()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpMessageLabel()
        setUpDateLabel()
        setUpCapsuleView()
        setUpMediumBubble()
        setUpSmallBubble()
    }
    
    required init?(coder: NSCoder) {
        fatalError("!")
    }
    
    //MARK: - Internal Method
    func setTextToBubble(_ text: String) {
        messageLabel.text = text
    }
    
    //MARK: - Methods
    private func setUpView() {
        clipsToBounds = true
    }
    
    private func setUpMessageLabel() {
        capsuleView.addSubview(messageLabel)
        
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.textColor = Colors.messageTextBlackColor
        messageLabel.textAlignment = .left
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: capsuleView.topAnchor, constant: 16),
            messageLabel.bottomAnchor.constraint(equalTo: capsuleView.bottomAnchor, constant: -16),
            messageLabel.rightAnchor.constraint(equalTo: capsuleView.rightAnchor, constant: -18),
            messageLabel.leftAnchor.constraint(equalTo: capsuleView.leftAnchor, constant: 18)
        ])
        messageLabel.text = "გამარჯობაგამარჯობაგამარჯობაგამარჯობაგამარჯობაგამარჯობაგამარჯობაგამარჯობაგამარჯობაგამარჯობაგამარჯობაგამარჯობაგამარჯობა"
    }
    
    private func setUpDateLabel() {
        addSubview(dateLabel)
        
        dateLabel.font = .systemFont(ofSize: 9)
        dateLabel.numberOfLines = 0
        
        dateLabel.setHeight(10)
        
        NSLayoutConstraint.activate([
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            dateLabel.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor)
        ])
        dateLabel.setUpErrorText()
    }
    
    private func setUpCapsuleView() {
        addSubview(capsuleView)
        
        NSLayoutConstraint.activate([
            capsuleView.topAnchor.constraint(equalTo: topAnchor),
            capsuleView.rightAnchor.constraint(equalTo: rightAnchor),
            capsuleView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            capsuleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
            
        ])
        capsuleView.layer.cornerRadius = 25
    }
    
    private func setUpMediumBubble() {
        addSubview(mediumBubbleView)
        
        mediumBubbleView.setHeight(Constants.mediumBubbleViewHeight)
        mediumBubbleView.setWidth(Constants.mediumBubbleViewWidth)
        
        NSLayoutConstraint.activate([
            mediumBubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
            mediumBubbleView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12)
        ])
        
        mediumBubbleView.layer.cornerRadius = 25
    }
    
    private func setUpSmallBubble() {
        addSubview(smallBubbleView)
        
        smallBubbleView.setHeight(Constants.smallBubbleViewHeight)
        smallBubbleView.setWidth(Constants.smallBubbleViewWidth)
        
        NSLayoutConstraint.activate([
            smallBubbleView.leftAnchor.constraint(equalTo: leftAnchor),
            smallBubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9)
        ])
        smallBubbleView.layer.cornerRadius = 25
    }
}

//MARK: - Constants
private extension RecipientMessageView {
    enum Constants {
        static let mediumBubbleViewHeight = 17.4
        static let mediumBubbleViewWidth = 18.18
        
        static let smallBubbleViewHeight = 9.57
        static let smallBubbleViewWidth = 10.0
    }
    //MARK: - Colors
    enum Colors {
        static let messageTextBlackColor = UIColor(red: 25, green: 25, blue: 25, alpha: 1)
    }
}
