////
////  TypingArea.swift
////  ChatApp
////
////  Created by Ana Dzebniauri on 22.04.23.
////

import UIKit

class TypingArea: UIView {
    
    var messageTextView = UITextView().forAutoLayout()
    var maxHeightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpMessageTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpMessageTextView() {
        messageTextView.font = UIFont(name: "Myriad GEO", size: 14)
        messageTextView.textColor = .messageTextColor
        messageTextView.textAlignment = .left
        messageTextView.backgroundColor = .clear
        messageTextView.layer.borderWidth = 2.0
        messageTextView.layer.borderColor = CGColor(red: 159/255, green: 96/255, blue: 255/255, alpha: 1)
        messageTextView.layer.cornerRadius = 15
        messageTextView.isEditable = true
        messageTextView.isScrollEnabled = false
        messageTextView.isUserInteractionEnabled = true
        messageTextView.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5) // Add some padding
        
        addSubview(messageTextView)
        messageTextView.translatesAutoresizingMaskIntoConstraints = false
        maxHeightConstraint = messageTextView.heightAnchor.constraint(equalToConstant: 140)
        maxHeightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            messageTextView.topAnchor.constraint(equalTo: bottomAnchor, constant: 19),
            messageTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -22),
            messageTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 22),
            messageTextView.bottomAnchor.constraint(equalTo: topAnchor, constant: -19)
            
        ])
        messageTextView.delegate = self
        messageTextView.becomeFirstResponder()
    }
    
}

extension TypingArea: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let maxHeight: CGFloat = 140 // Maximum height in points
        let maxLines: Int = 6
        // Maximum number of lines
        
        let fixedWidth = textView.frame.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newHeight = min(newSize.height, maxHeight)
        let lineHeight = textView.font?.lineHeight ?? 0.0
        let maxTextHeight = CGFloat(maxLines) * lineHeight
        newHeight = min(newHeight, maxTextHeight)
        messageTextView.isScrollEnabled = newSize.height > newHeight
        
        // Update the height constraint
        maxHeightConstraint?.constant = newHeight
        
        // Call layoutIfNeeded to update the layout immediately
        layoutIfNeeded()
    }
}
