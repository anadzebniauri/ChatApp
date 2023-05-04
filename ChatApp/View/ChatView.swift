//
//  ChatView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 01.05.23.
//

import UIKit

//aq unda ikos marto tableview da typing area orive erti cali

//switcher delegate ikos switcheris fileshi

class ChatView: UIView, SwitcherDelegate {
    
    //MARK: - Properties
    let switcherView = SwitcherView().forAutoLayout() //controllershi gaitane
    
    let receiverTypingArea = TypingAreaView().forAutoLayout() // erti unda ikos
    let senderTypingArea = TypingAreaView().forAutoLayout()
    
    let receiverMessageView = RecipientMessageView().forAutoLayout()
    let senderMessageView = SenderMessageView().forAutoLayout()
    
    let dividerView = DividerView().forAutoLayout() // controllershi
    
    //table view aq unda ikos
    
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
        setUpSwitcherView()
        setUpDividerView()
        
        setUpReceiverTypingArea()
        setUpSenderTypingArea()
    }
    
    //MARK: - Typing Areas
    private func setUpReceiverTypingArea() {
        addSubview(receiverTypingArea)
        
        NSLayoutConstraint.activate([
            receiverTypingArea.bottomAnchor.constraint(equalTo: dividerView.topAnchor, constant: -30),
            receiverTypingArea.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            receiverTypingArea.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }
    
    private func setUpSenderTypingArea() {
        addSubview(senderTypingArea)
        
        NSLayoutConstraint.activate([
            senderTypingArea.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            senderTypingArea.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            senderTypingArea.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }
    
    //MARK: - Message Views
    private func setUpRecipientMessageView() {
        addSubview(receiverMessageView)
        
        NSLayoutConstraint.activate([
            receiverMessageView.topAnchor.constraint(equalTo: topAnchor, constant: 95),
            receiverMessageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            receiverMessageView.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor)
        ])
    }
    
    private func setUpSenderMessageView() {
        addSubview(senderMessageView)
        
        NSLayoutConstraint.activate([
            senderMessageView.bottomAnchor.constraint(equalTo: receiverTypingArea.topAnchor, constant: -16),
            senderMessageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            senderMessageView.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor)
        ])
    }
    
    //MARK: - Switcher
    private func setUpSwitcherView() {
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
    private func setUpDividerView() {
        addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            dividerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dividerView.centerYAnchor.constraint(equalTo: centerYAnchor ),
            dividerView.rightAnchor.constraint(equalTo: rightAnchor),
            dividerView.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
}

