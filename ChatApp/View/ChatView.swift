//
//  ChatView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 01.05.23.
//

import UIKit

class ChatView: UIView, SwitcherDelegate {
    
    //MARK: - Properties
    let switcherView = SwitcherView().forAutoLayout()
    
    let receiverTypingArea = TypingAreaView().forAutoLayout()
    let senderTypingArea = TypingAreaView().forAutoLayout()
    
    let receiverMessageView = RecipientMessageView().forAutoLayout()
    let senderMessageView = SenderMessageView().forAutoLayout()
    
    let dividerView = DividerView().forAutoLayout()
    
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
    func setUp() {
        setUpSwitcherView()
        setUpDividerView()
        
        setUpReceiverTypingArea()
        setUpSenderTypingArea()
    }
    
    //MARK: - Typing Areas
    func setUpReceiverTypingArea() {
        addSubview(receiverTypingArea)
        
        NSLayoutConstraint.activate([
            receiverTypingArea.bottomAnchor.constraint(equalTo: dividerView.topAnchor, constant: -30),
            receiverTypingArea.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            receiverTypingArea.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }
    
    func setUpSenderTypingArea() {
        addSubview(senderTypingArea)
        
        NSLayoutConstraint.activate([
            senderTypingArea.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            senderTypingArea.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            senderTypingArea.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }
    
    //MARK: - Message Views
    func setUpRecipientMessageView() {
        addSubview(receiverMessageView)
        
        NSLayoutConstraint.activate([
            receiverMessageView.topAnchor.constraint(equalTo: topAnchor, constant: 95),
            receiverMessageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            receiverMessageView.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor)
        ])
    }
    
    func setUpSenderMessageView() {
        addSubview(senderMessageView)
        
        NSLayoutConstraint.activate([
            senderMessageView.bottomAnchor.constraint(equalTo: receiverTypingArea.topAnchor, constant: -16),
            senderMessageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            senderMessageView.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor)
        ])
    }
    
    //MARK: - Switcher
    func setUpSwitcherView() {
        addSubview(switcherView)
        
        switcherView.delegate = self
        
        NSLayoutConstraint.activate([
            switcherView.topAnchor.constraint(equalTo: topAnchor, constant: 52),
            switcherView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12)
        ])
    }
    
    func switcherDidTap() {
        print("tapped")
    }
    
    //MARK: - Divider View
    func setUpDividerView() {
        addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            dividerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dividerView.centerYAnchor.constraint(equalTo: centerYAnchor ),
            dividerView.rightAnchor.constraint(equalTo: rightAnchor),
            dividerView.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
}

