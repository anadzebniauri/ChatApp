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
    
    private lazy var messageLabel: UILabel = { () -> UILabel in
        let messageLabel = UILabel()
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.textColor = Constants.Color.messageTextBlackColor
        messageLabel.textAlignment = .left
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.numberOfLines = 0
        return messageLabel
    }().forAutoLayout()
    
    private lazy var dateLabel: UILabel = { () -> UILabel in
        let dateLabel = UILabel()
        dateLabel.font = .systemFont(ofSize: 9)
        return dateLabel
    }().forAutoLayout()
    
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
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: capsuleView.topAnchor, constant: Constants.MessageLabel.messageLabelHeightPadding),
            messageLabel.bottomAnchor.constraint(equalTo: capsuleView.bottomAnchor, constant: -Constants.MessageLabel.messageLabelHeightPadding),
            messageLabel.trailingAnchor.constraint(equalTo: capsuleView.trailingAnchor, constant: -Constants.MessageLabel.messageLabelWidthPadding),
            messageLabel.leadingAnchor.constraint(equalTo: capsuleView.leadingAnchor, constant: Constants.MessageLabel.messageLabelWidthPadding)
        ])
        messageLabel.text = "გამა"
    }
    
    private func setUpDateLabel() {
        addSubview(dateLabel)
        dateLabel.setHeight(Constants.DateLabel.dateLabelHeight)
        
        NSLayoutConstraint.activate([
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.DateLabel.dateLabelRightPadding),
            dateLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor)
        ])
        
        dateLabel.setUpDateFormatter()
        dateLabel.textColor = Constants.Color.dateLabelTextGreyColor
    }
    
    private func setUpCapsuleView() {
        addSubview(capsuleView)
        capsuleView.layer.cornerRadius = Constants.bubbleCornerRadius
        
        NSLayoutConstraint.activate([
            capsuleView.topAnchor.constraint(equalTo: topAnchor),
            capsuleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            capsuleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.CapsuleView.capsuleViewBottomPadding),
            capsuleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.CapsuleView.capsuleViewRightPadding)
        ])
    }
    
    private func setUpMediumBubble() {
        addSubview(mediumBubbleView)
        mediumBubbleView.layer.cornerRadius = Constants.bubbleCornerRadius
        
        mediumBubbleView.setHeight(Constants.MediumBubbleView.mediumBubbleViewHeight)
        mediumBubbleView.setWidth(Constants.MediumBubbleView.mediumBubbleViewWidth)
        
        NSLayoutConstraint.activate([
            mediumBubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.MediumBubbleView.mediumBubbleViewBottomPadding),
            mediumBubbleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.MediumBubbleView.mediumBubbleViewRightPadding)
        ])
        
    }
    
    private func setUpSmallBubble() {
        addSubview(smallBubbleView)
        smallBubbleView.layer.cornerRadius = Constants.bubbleCornerRadius
        
        smallBubbleView.setHeight(Constants.SmallBubbleView.smallBubbleViewHeight)
        smallBubbleView.setWidth(Constants.SmallBubbleView.smallBubbleViewWidth)
        
        NSLayoutConstraint.activate([
            smallBubbleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            smallBubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.SmallBubbleView.smallBubbleBottomPadding)
        ])
    }
}

//MARK: - Constants
private extension SenderMessageView {
    enum Constants {
        static let bubbleCornerRadius = 25.0
        
        enum CapsuleView {
            static let capsuleViewBottomPadding = -14.0
            static let capsuleViewRightPadding = -16.0
        }
        enum MediumBubbleView {
            static let mediumBubbleViewHeight = 17.4
            static let mediumBubbleViewWidth = 18.18
            static let mediumBubbleViewBottomPadding = -13.0
            static let mediumBubbleViewRightPadding = -12.0
        }
        
        enum SmallBubbleView {
            static let smallBubbleViewHeight = 9.57
            static let smallBubbleViewWidth = 10.0
            static let smallBubbleBottomPadding = -9.0
        }
        
        enum MessageLabel {
            static let messageLabelHeightPadding = 15.0
            static let messageLabelWidthPadding = 18.0
        }
        
        enum DateLabel {
            static let dateLabelHeight = 10.0
            static let dateLabelRightPadding = -30.0
        }
        
        enum Color {
            static let messageTextBlackColor = UIColor(red: 25, green: 25, blue: 25, alpha: 1)
            static let dateLabelTextGreyColor = UIColor(red: 199, green: 199, blue: 199, alpha: 1)
            static let dateLabelErrorTextRedColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
        }
    }
}
