//
//  ChatView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 01.05.23.
//

import UIKit

class ChatView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties
    private lazy var tableView = UITableView().forAutoLayout()
    private lazy var typingAreaView = TypingAreaView().forAutoLayout()
    
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
        setUpTableView()
        setUpTypingAreaView()
    }
    
    //MARK: - Typing Area
    private func setUpTypingAreaView() {
        addSubview(typingAreaView)
        
        NSLayoutConstraint.activate([
            typingAreaView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            typingAreaView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            typingAreaView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            typingAreaView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    //MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeue and configure a cell for tableView1
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "receiverTableViewCell", for: indexPath) as? RecipientTableViewCell else {
            fatalError("Cell can't cast to ReceiverTableViewCell") }
        tableView.separatorStyle = .none
        return cell
    }
    
    
    private func setUpTableView() {
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        tableView.register(RecipientTableViewCell.self, forCellReuseIdentifier: "receiverTableViewCell")
    }
}
