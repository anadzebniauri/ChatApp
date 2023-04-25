////
////  TypingArea.swift
////  ChatApp
////
////  Created by Ana Dzebniauri on 22.04.23.
////

import UIKit

class TypingArea: UIView {

    private let messageTextView = UITextView().forAutoLayout()
    private let sendButton = UIButton().forAutoLayout()
    let placeholderLabel = UILabel().forAutoLayout()
    
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

    func setUp() {
        setUpMessageTextView()
        setUpSendButton()
        setUpMessageTextViewPlaceholder()
    }

    func setUpView() {
        layer.cornerRadius = 15
    }

    func setUpMessageTextView() {
        addSubview(messageTextView)
        messageTextView.font = UIFont(name: "Myriad GEO", size: 14)
        messageTextView.textAlignment = .left
        messageTextView.backgroundColor = .clear
        messageTextView.layer.borderWidth = 1.0
        messageTextView.layer.borderColor = CGColor(red: 159/255, green: 96/255, blue: 255/255, alpha: 1) //add it to extension
        messageTextView.layer.cornerRadius = 18
        messageTextView.isScrollEnabled = false
        messageTextView.textContainerInset = UIEdgeInsets(top: 12, left: 22, bottom: 15, right: 82)
        messageTextView.scrollIndicatorInsets = UIEdgeInsets(top: 17, left: 283, bottom: 12, right: 56)

        // MARK: Cosntraints
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

        messageTextView.delegate = self
        messageTextView.becomeFirstResponder()
}
    
    func setUpMessageTextViewPlaceholder() {
        messageTextView.addSubview(placeholderLabel)
        
        placeholderLabel.text = "დაწერე შეტყობინება..."
        placeholderLabel.font = UIFont(name: "Myriad GEO", size: 14)
        placeholderLabel.textColor = .SystemGreyTextColor
        placeholderLabel.sizeToFit()
        placeholderLabel.isHidden = !messageTextView.text.isEmpty
        
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: messageTextView.topAnchor, constant: 8),
            placeholderLabel.leadingAnchor.constraint(equalTo: messageTextView.leadingAnchor, constant: 34),
            placeholderLabel.bottomAnchor.constraint(equalTo: messageTextView.bottomAnchor, constant: -12),
        ])
}
    
    func setUpSendButton() {
        addSubview(sendButton)
        sendButton.setImage(UIImage(named: "sendButton"), for: .normal)
        sendButton.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
        sendButton.setWidth(32)
        sendButton.setHeight(32)
        
        NSLayoutConstraint.activate([
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -27),
            sendButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
        ])
    }

    @objc func sendButtonPressed() {
        // Add your send button action here
    }
}
//
extension TypingArea: UITextViewDelegate {
//    func textViewDidChange(_ textView: UITextView) {
//        guard let lineHeight = textView.font?.lineHeight else { return }
//        let maxHeight: CGFloat = lineHeight * 5 + textView.textContainerInset.top + textView.textContainerInset.bottom
//        let fixedWidth = textView.frame.size.width
//
//        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//        let clampedHeight = min(newSize.height, maxHeight)
//
//        var newFrame = textView.frame
//        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: clampedHeight)
//        textView.frame = newFrame
//
//        textView.isScrollEnabled = newSize.height >= maxHeight
//
//    }
//}
func textViewDidChange(_ textView: UITextView) {
    // Update placeholder label
    if let placeholderLabel = textView.subviews.first(where: { $0 is UILabel }) as? UILabel {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }

    guard let lineHeight = textView.font?.lineHeight else { return }
    let maxHeight: CGFloat = lineHeight * 5 + textView.textContainerInset.top + textView.textContainerInset.bottom
    let fixedWidth = textView.frame.size.width

    let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
    let clampedHeight = min(newSize.height, maxHeight)

    var newFrame = textView.frame
    newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: clampedHeight)
    textView.frame = newFrame

    textView.isScrollEnabled = newSize.height >= maxHeight
}

}



