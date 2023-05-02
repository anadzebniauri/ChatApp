//
//  TypingArea.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 22.04.23.
//

import UIKit

class TypingAreaView: UIView {
    
    //MARK: - Properties
    private let messageTextView = UITextView().forAutoLayout()
    private let sendButton = UIButton().forAutoLayout()
    private let placeholderLabel = UILabel().forAutoLayout()
    
    //MARK: - Init
    override required init(frame: CGRect) {
        super.init(frame: .zero)
        setUp()
    }
    
    convenience init() {
        self.init(frame: .zero)
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
        messageTextView.layer.borderColor = UIColor.typeAreaBorderPurpleColor.cgColor
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
            messageTextView.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            messageTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            messageTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            messageTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -19),
        ])
    }
    
    private func setUpMessageTextViewPlaceholder() {
        messageTextView.addSubview(placeholderLabel)
        
        placeholderLabel.text = "დაწერე შეტყობინება..."
        placeholderLabel.font = UIFont.systemFont(ofSize: 14)
        placeholderLabel.textColor = .placeholderTextGreyColor
        placeholderLabel.sizeToFit()
        placeholderLabel.isHidden = !messageTextView.text.isEmpty
        
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: messageTextView.topAnchor, constant: 12),
            placeholderLabel.leadingAnchor.constraint(equalTo: messageTextView.leadingAnchor, constant: 34),
            placeholderLabel.bottomAnchor.constraint(equalTo: messageTextView.bottomAnchor, constant: -12),
        ])
    }
    
    private func setUpSendButton() {
        addSubview(sendButton)
        sendButton.setImage(UIImage(named: "sendButton"), for: .normal)
        sendButton.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
        sendButton.setWidth(Constants.sendButtonWidth)
        sendButton.setHeight(Constants.sendButtonHeight)
        
        NSLayoutConstraint.activate([
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -27),
            sendButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
        ])
    }
    
    @objc func sendButtonPressed() {
        // Add your send button action here
    }
}

extension TypingAreaView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        // Update placeholder label
        if let placeholderLabel = textView.subviews.first(where: { $0 is UILabel }) as? UILabel {
            placeholderLabel.isHidden = !textView.text.isEmpty
        }
        //update message text view height + scroll
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
    }
}

