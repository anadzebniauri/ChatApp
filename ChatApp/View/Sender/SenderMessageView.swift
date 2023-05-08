//
//  MessageView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 21.04.23.
//

import UIKit

final class SenderMessageView: UIView {
    
    //MARK: - Properties
    private lazy var capsuleView = SenderCapsuleBubbleView().forAutoLayout()
    private lazy var mediumBubbleView = SenderMediumBubbleView().forAutoLayout()
    private lazy var smallBubbleView = SenderSmallBubbleView().forAutoLayout()
    
    private lazy var messageLabel = UILabel().forAutoLayout()
    private lazy var dateLabel = UILabel().forAutoLayout()
    
    //MARK: -  Init
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
        messageLabel.textColor = Constants.messageTextBlackColor
        messageLabel.textAlignment = .left
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: capsuleView.topAnchor, constant: Constants.messageLabelHeightPadding),
            messageLabel.bottomAnchor.constraint(equalTo: capsuleView.bottomAnchor, constant: -Constants.messageLabelHeightPadding),
            messageLabel.rightAnchor.constraint(equalTo: capsuleView.rightAnchor, constant: -Constants.messageLabelWidthPadding),
            messageLabel.leftAnchor.constraint(equalTo: capsuleView.leftAnchor, constant: Constants.messageLabelWidthPadding)
        ])
        messageLabel.text = "გამა"
    }
    
    private func setUpDateLabel() {
        addSubview(dateLabel)
        dateLabel.font = .systemFont(ofSize: 9)
        dateLabel.setHeight(Constants.dateLabelHeight)
        
        NSLayoutConstraint.activate([
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.dateLabelRightPadding),
            dateLabel.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor)
        ])
        
        dateLabel.setUpDateFormatter()
        dateLabel.textColor = Constants.dateLabelTextGreyColor
    }
    
    private func setUpCapsuleView() {
        addSubview(capsuleView)
        
        NSLayoutConstraint.activate([
            capsuleView.topAnchor.constraint(equalTo: topAnchor),
            capsuleView.leftAnchor.constraint(equalTo: leftAnchor),
            capsuleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.capsuleViewBottomPadding),
            capsuleView.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.capsuleViewRightPadding)
        ])
        capsuleView.layer.cornerRadius = Constants.bubbleCornerRadius
    }
    
    private func setUpMediumBubble() {
        addSubview(mediumBubbleView)
        
        mediumBubbleView.setHeight(Constants.mediumBubbleViewHeight)
        mediumBubbleView.setWidth(Constants.mediumBubbleViewWidth)
        
        NSLayoutConstraint.activate([
            mediumBubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.mediumBubbleViewBottomPadding),
            mediumBubbleView.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.mediumBubbleViewRightPadding)
        ])
        
        mediumBubbleView.layer.cornerRadius = Constants.bubbleCornerRadius
    }
    
    private func setUpSmallBubble() {
        addSubview(smallBubbleView)
        
        smallBubbleView.setHeight(Constants.smallBubbleViewHeight)
        smallBubbleView.setWidth(Constants.smallBubbleViewWidth)
        
        NSLayoutConstraint.activate([
            smallBubbleView.rightAnchor.constraint(equalTo: rightAnchor),
            smallBubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.smallBubbleBottomPadding)
        ])
        smallBubbleView.layer.cornerRadius = Constants.bubbleCornerRadius
    }
    
}

//MARK: - Constants
private extension SenderMessageView {
    enum Constants {
        static let bubbleCornerRadius = 25.0
        
        static let mediumBubbleViewHeight = 17.4
        static let mediumBubbleViewWidth = 18.18
        
        static let smallBubbleViewHeight = 9.57
        static let smallBubbleViewWidth = 10.0
        
        static let messageLabelHeightPadding = 15.0
        static let messageLabelWidthPadding = 18.0
        
        static let dateLabelHeight = 10.0
        static let dateLabelRightPadding = -30.0
        
        static let capsuleViewBottomPadding = -14.0
        static let capsuleViewRightPadding = -16.0
        
        static let mediumBubbleViewBottomPadding = -13.0
        static let mediumBubbleViewRightPadding = -12.0
        
        static let smallBubbleBottomPadding = -9.0
        
        static let messageTextBlackColor = UIColor(red: 25, green: 25, blue: 25, alpha: 1)
        static let dateLabelTextGreyColor = UIColor(red: 199, green: 199, blue: 199, alpha: 1)
        static let dateLabelErrorTextRedColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
        
    }
}
