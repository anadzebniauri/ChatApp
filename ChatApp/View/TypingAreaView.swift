//
//  TypingArea.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 22.04.23.
//

import UIKit

class TypingAreaView: UIView {
    
    //MARK: - Properties
    private lazy var messageTextView: UITextView = { () -> UITextView in
        let messageTextView = UITextView()
        messageTextView.font = .systemFont(ofSize: 14)
        messageTextView.textAlignment = .left
        messageTextView.backgroundColor = .clear
        messageTextView.layer.borderColor = Constants.Color.typeAreaBorderPurpleColor.cgColor
        messageTextView.isScrollEnabled = false
        messageTextView.delegate = self
        messageTextView.becomeFirstResponder()
        return messageTextView
    }().forAutoLayout()
    
    private lazy var placeholderLabel: UILabel = { () -> UILabel in
        let placeholderLabel = UILabel()
        placeholderLabel.text = "დაწერე შეტყობინება..."
        placeholderLabel.font = UIFont.systemFont(ofSize: 14)
        placeholderLabel.textColor = Constants.Color.placeholderTextGreyColor
        placeholderLabel.sizeToFit()
        return placeholderLabel
    }().forAutoLayout()
    
    private lazy var sendButton: UIButton = { () -> UIButton in
        let sendButton = UIButton()
        sendButton.setImage(UIImage(named: "sendButton"), for: .normal)
        return sendButton
    }().forAutoLayout()
    
    
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
        setUpMessageTextViewConstraints()
        setUpSendButton()
        setUpMessageTextViewPlaceholder()
    }
    
    private func setUpView() {
        layer.cornerRadius = Constants.cornerRadius
    }
    
    private func setUpMessageTextViewConstraints() {
        addSubview(messageTextView)
        
        messageTextView.layer.borderWidth = Constants.MessageTextView.messageTextViewBorderWidth
        messageTextView.layer.cornerRadius = Constants.MessageTextView.messageTextViewCornerRadius
        messageTextView.textContainerInset = UIEdgeInsets(top: 12, left: 22, bottom: 15, right: 82)
        messageTextView.scrollIndicatorInsets = UIEdgeInsets(top: 17, left: 283, bottom: 12, right: 56)
        
        let maxHeightConstraint = messageTextView.heightAnchor.constraint(lessThanOrEqualToConstant: 90)
        maxHeightConstraint.isActive = true
        maxHeightConstraint.priority = .defaultHigh
        
        let heightConstraint = messageTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 40)
        heightConstraint.isActive = true
        heightConstraint.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            messageTextView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.MessageTextView.messageTextViewHeightPadding),
            messageTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.MessageTextView.messageTextViewWidthPadding),
            messageTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.MessageTextView.messageTextViewWidthPadding),
            messageTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.MessageTextView.messageTextViewHeightPadding),
        ])
    }
    
    private func setUpMessageTextViewPlaceholder() {
        messageTextView.addSubview(placeholderLabel)
        
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: messageTextView.topAnchor, constant: Constants.PlaceholderLabel.placeholderLabelHeightPadding),
            placeholderLabel.leadingAnchor.constraint(equalTo: messageTextView.leadingAnchor, constant: Constants.PlaceholderLabel.placeholderLabelLeftPadding),
            placeholderLabel.bottomAnchor.constraint(equalTo: messageTextView.bottomAnchor, constant: -Constants.PlaceholderLabel.placeholderLabelHeightPadding),
        ])
    }
    
    private func setUpSendButton() {
        addSubview(sendButton)
        sendButton.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
        sendButton.setWidth(Constants.SendButton.sendButtonWidth)
        sendButton.setHeight(Constants.SendButton.sendButtonHeight)
        
        NSLayoutConstraint.activate([
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.SendButton.sendButtonRightPadding),
            sendButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.SendButton.sendButtonBottomPadding)
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
        
        enum MessageTextView{
            static let messageTextViewBorderWidth = 1.0
            static let messageTextViewCornerRadius = 18.0
            static let messageTextViewHeightPadding = 19.0
            static let messageTextViewWidthPadding = 22.0
        }
        
        enum PlaceholderLabel{
            static let placeholderLabelHeightPadding = 12.0
            static let placeholderLabelLeftPadding = 34.0
        }
        
        enum SendButton{
            static let sendButtonWidth = 32.0
            static let sendButtonHeight = 32.0
            static let sendButtonRightPadding = -27.0
            static let sendButtonBottomPadding = -24.0
        }
        
        enum Color {
            static let messageTextBlackColor = UIColor(red: 25, green: 25, blue: 25, alpha: 1)
            static let placeholderTextGreyColor = UIColor(red: 199, green: 199, blue: 199, alpha: 1)
            static let typeAreaBorderPurpleColor = UIColor(red: 159, green: 96, blue: 255, alpha: 1)
        }
    }
}
