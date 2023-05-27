//
//  RecipientTypingIndicator.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 28.05.23.
//

import UIKit

class RecipientTypingIndicator: UIView {
    
    //MARK: - Properties
    private let capsuleView = RecipientCapsuleBubbleView()
    private let mediumBubbleView = RecipientMediumBubbleView()
    private let smallBubbleView = RecipientSmallBubbleView()
    private var typingIndicator = UILabel()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setUpTypingIndicator() {
        capsuleView.addSubview(typingIndicator)
        backgroundColor = .red
        
        NSLayoutConstraint.activate([
            typingIndicator.topAnchor.constraint(equalTo: capsuleView.topAnchor, constant: Constants.TypingIndicator.typingIndicatorHeightPadding),
            typingIndicator.bottomAnchor.constraint(equalTo: capsuleView.bottomAnchor, constant: -Constants.TypingIndicator.typingIndicatorHeightPadding),
            typingIndicator.trailingAnchor.constraint(equalTo: capsuleView.trailingAnchor, constant: -Constants.TypingIndicator.typingIndicatorWidthPadding),
            typingIndicator.leadingAnchor.constraint(equalTo: capsuleView.leadingAnchor, constant: Constants.TypingIndicator.typingIndicatorWidthPadding)
        ])
    }
    
    private func setUpCapsuleView() {
        addSubview(capsuleView)
        capsuleView.layer.cornerRadius = Constants.bubbleCornerRadius
        capsuleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            capsuleView.topAnchor.constraint(equalTo: topAnchor),
            capsuleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            capsuleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.CapsuleView.capsuleViewLeftPadding),
            capsuleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.CapsuleView.capsuleViewBottomPadding),
        ])
    }
    
    private func setUpMediumBubble() {
        addSubview(mediumBubbleView)
        mediumBubbleView.layer.cornerRadius = Constants.bubbleCornerRadius
        mediumBubbleView.translatesAutoresizingMaskIntoConstraints = false
        
        mediumBubbleView.setHeight(Constants.MediumBubbleView.mediumBubbleViewHeight)
        mediumBubbleView.setWidth(Constants.MediumBubbleView.mediumBubbleViewWidth)
        
        NSLayoutConstraint.activate([
            mediumBubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.MediumBubbleView.mediumBubbleViewBottomPadding),
            mediumBubbleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.MediumBubbleView.mediumBubbleViewLeftPadding)
        ])
    }
    
    private func setUpSmallBubble() {
        addSubview(smallBubbleView)
        smallBubbleView.layer.cornerRadius = Constants.bubbleCornerRadius
        smallBubbleView.translatesAutoresizingMaskIntoConstraints = false
        
        smallBubbleView.setHeight(Constants.SmallBubbleView.smallBubbleViewHeight)
        smallBubbleView.setWidth(Constants.SmallBubbleView.smallBubbleViewWidth)
        
        NSLayoutConstraint.activate([
            smallBubbleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            smallBubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.SmallBubbleView.smallBubbleViewBottomPadding)
        ])
    }
}

//MARK: - Constants
private extension RecipientTypingIndicator {
    enum Constants {
        static let bubbleCornerRadius = 25.0
        
        enum CapsuleView {
            static let capsuleViewLeftPadding = 16.0
            static let capsuleViewBottomPadding = -14.0
        }
        
        enum MediumBubbleView {
            static let mediumBubbleViewHeight = 17.4
            static let mediumBubbleViewWidth = 18.18
            static let mediumBubbleViewBottomPadding = -14.0
            static let mediumBubbleViewLeftPadding = 12.0
        }
        
        enum SmallBubbleView {
            static let smallBubbleViewHeight = 9.57
            static let smallBubbleViewWidth = 10.0
            static let smallBubbleViewBottomPadding = -9.0
        }
        
        enum TypingIndicator {
            static let typingIndicatorHeightPadding = 16.0
            static let typingIndicatorWidthPadding = 18.0
        }
    }
}
