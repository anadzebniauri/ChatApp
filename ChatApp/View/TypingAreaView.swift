//
//  TypingArea.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 22.04.23.
//

import UIKit

class TypingAreaView: UIView {
    
    //MARK: - Properties
    private lazy var messageTextView = UITextView().forAutoLayout()
    private lazy var sendButton = UIButton().forAutoLayout()
    private lazy var placeholderLabel = UILabel().forAutoLayout()
    
    //MARK: - Init
    override required init(frame: CGRect) {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setUp() {
        setUpMessageTextView()
        setUpMessageTextViewConstraints()
        setUpSendButton()
        setUpMessageTextViewPlaceholder()
    }
    
    private func setUpView() {
        layer.cornerRadius = Constants.cornerRadius
    }
    
    private func setUpMessageTextView() {
        addSubview(messageTextView)
        messageTextView.font = .systemFont(ofSize: 14)
        messageTextView.textAlignment = .left
        messageTextView.backgroundColor = .clear
        messageTextView.layer.borderWidth = Constants.messageTextViewBorderWidth
        messageTextView.layer.borderColor = Constants.typeAreaBorderPurpleColor.cgColor
        messageTextView.layer.cornerRadius = Constants.messageTextViewCornerRadius
        messageTextView.isScrollEnabled = false
        messageTextView.textContainerInset = UIEdgeInsets(top: 12, left: 22, bottom: 15, right: 82)
        messageTextView.scrollIndicatorInsets = UIEdgeInsets(top: 17, left: 283, bottom: 12, right: 56)
        
        messageTextView.delegate = self
        messageTextView.becomeFirstResponder()
    }
    
    private func setUpMessageTextViewConstraints() {
        let maxHeightConstraint = messageTextView.heightAnchor.constraint(lessThanOrEqualToConstant: 90)
        maxHeightConstraint.isActive = true
        maxHeightConstraint.priority = .defaultHigh
        
        let heightConstraint = messageTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 40)
        heightConstraint.isActive = true
        heightConstraint.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            messageTextView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.messageTextViewHeightPadding),
            messageTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.messageTextViewWidthPadding),
            messageTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.messageTextViewWidthPadding),
            messageTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.messageTextViewHeightPadding),
        ])
    }
    
    private func setUpMessageTextViewPlaceholder() {
        messageTextView.addSubview(placeholderLabel)
        
        placeholderLabel.text = "დაწერე შეტყობინება..."
        placeholderLabel.font = UIFont.systemFont(ofSize: 14)
        placeholderLabel.textColor = Constants.placeholderTextGreyColor
        placeholderLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: messageTextView.topAnchor, constant: Constants.placeholderLabelHeightPadding),
            placeholderLabel.leftAnchor.constraint(equalTo: messageTextView.leftAnchor, constant: Constants.placeholderLabelLeftPadding),
            placeholderLabel.bottomAnchor.constraint(equalTo: messageTextView.bottomAnchor, constant: -Constants.placeholderLabelHeightPadding),
        ])
    }
    
    private func setUpSendButton() {
        addSubview(sendButton)
        sendButton.setImage(UIImage(named: "sendButton"), for: .normal)
        sendButton.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
        sendButton.setWidth(Constants.sendButtonWidth)
        sendButton.setHeight(Constants.sendButtonHeight)
        
        NSLayoutConstraint.activate([
            sendButton.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.sendButtonRightPadding),
            sendButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.sendButtonBottomPadding)
        ])
    }
    
    @objc func sendButtonPressed() {
        // Add your send button action here
    }
}

extension TypingAreaView: UITextViewDelegate {
    //MARK: - Placeholder
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !messageTextView.text.isEmpty
    }
    
    //MARK: - Typing Area Height
    func textViewDidChangeSelection(_ textView: UITextView) {
        guard let lineHeight = textView.font?.lineHeight else { return }
        let maxHeight: CGFloat = lineHeight * 4 + textView.textContainerInset.top + textView.textContainerInset.bottom
        let fixedWidth = textView.frame.size.width
        
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let clampedHeight = min(newSize.height, maxHeight)
        
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: clampedHeight)
        textView.frame = newFrame
        
        textView.isScrollEnabled = newSize.height >= maxHeight
    }
}

// MARK: - Constants
private extension TypingAreaView {
    enum Constants {
        static let cornerRadius = 15.0
        
        static let messageTextViewBorderWidth = 1.0
        static let messageTextViewCornerRadius = 18.0
        
        static let sendButtonWidth = 32.0
        static let sendButtonHeight = 32.0
        
        static let messageTextViewHeightPadding = 19.0
        static let messageTextViewWidthPadding = 22.0
        
        static let placeholderLabelHeightPadding = 12.0
        static let placeholderLabelLeftPadding = 34.0
        
        static let sendButtonRightPadding = -27.0
        static let sendButtonBottomPadding = -24.0
        
        static let messageTextBlackColor = UIColor(red: 25, green: 25, blue: 25, alpha: 1)
        static let placeholderTextGreyColor = UIColor(red: 199, green: 199, blue: 199, alpha: 1)
        static let typeAreaBorderPurpleColor = UIColor(red: 159, green: 96, blue: 255, alpha: 1)
    }
}
