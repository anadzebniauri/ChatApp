//
//  MessageView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 21.04.23.
//

import UIKit

class SenderMessageView: UIView {
    
//MARK: - Properties
    private let capsuleView = SenderCapsuleBubbleView().forAutoLayout()
    private let mediumBubbleView = SenderMediumBubbleView().forAutoLayout()
    private let smallBubbleView = SenderSmallBubbleView().forAutoLayout()
        
    private let messageLabel = UILabel().forAutoLayout()
    private let dateLabel = UILabel().forAutoLayout()
    
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
         messageLabel.textColor = .messageTextBlackColor
         messageLabel.textAlignment = .left
         messageLabel.lineBreakMode = .byWordWrapping
         messageLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: capsuleView.topAnchor, constant: 15),
            messageLabel.bottomAnchor.constraint(equalTo: capsuleView.bottomAnchor, constant: -15),
            messageLabel.rightAnchor.constraint(equalTo: capsuleView.rightAnchor, constant: -18),
            messageLabel.leftAnchor.constraint(equalTo: capsuleView.leftAnchor, constant: 18)
        ])
        messageLabel.text = "გამა"
    }
    
    private func setUpDateLabel() {
        addSubview(dateLabel)
        dateLabel.font = .systemFont(ofSize: 10)
        dateLabel.textColor = .dateLabelTextGreyColor
        dateLabel.numberOfLines = 0
        
        dateLabel.setHeight(10)

        NSLayoutConstraint.activate([
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            dateLabel.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor)
        ])

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, h:mm "
        let currentDateTime = Date()
        let dateTimeString = dateFormatter.string(from: currentDateTime)
        dateLabel.text = dateTimeString
        
//        dateLabel.text = "არ გაიგზავნა"
//        dateLabel.textColor = .datelabelErrorTextRedColor
    }
    
    private func setUpCapsuleView() {
        addSubview(capsuleView)

        NSLayoutConstraint.activate([
            capsuleView.topAnchor.constraint(equalTo: topAnchor),
            capsuleView.leftAnchor.constraint(equalTo: leftAnchor),
            capsuleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
            capsuleView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
        capsuleView.layer.cornerRadius = 25
    }
    
    private func setUpMediumBubble() {
        addSubview(mediumBubbleView)
        
        mediumBubbleView.setHeight(Constants.mediumBubbleViewHeight)
        mediumBubbleView.setWidth(Constants.mediumBubbleViewWidth)
        
        NSLayoutConstraint.activate([
            mediumBubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13),
            mediumBubbleView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12)
        ])
        
        mediumBubbleView.layer.cornerRadius = 25
    }
    
    private func setUpSmallBubble() {
        addSubview(smallBubbleView)
        
        smallBubbleView.setHeight(Constants.smallBubbleViewHeight)
        smallBubbleView.setWidth(Constants.smallBubbleViewWidth)
        
        NSLayoutConstraint.activate([
            smallBubbleView.rightAnchor.constraint(equalTo: rightAnchor),
            smallBubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9)
        ])
        smallBubbleView.layer.cornerRadius = 25
    }
    
}

extension UIEdgeInsets {
    static func make(horizontal: CGFloat, vertical: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}

//MARK: - Constants
private extension SenderMessageView {
    enum Constants {
        static let mediumBubbleViewHeight = 17.4
        static let mediumBubbleViewWidth = 18.18
        
        static let smallBubbleViewHeight = 9.57
        static let smallBubbleViewWidth = 10.0
        
    }
}
