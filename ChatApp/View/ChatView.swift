//
//  ChatView.swift
//  ChatApp
//
//  Created by Ana Dzebniauri on 01.05.23.
//

import UIKit

class ChatView: UIView {
    
    //MARK: - Properties
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecipientTableViewCell.self, forCellReuseIdentifier: "receiverTableViewCell")
        tableView.register(SenderTableViewCell.self, forCellReuseIdentifier: "senderTableViewCell")
        return tableView
    }()
    
    private let typingAreaView = TypingAreaView().forAutoLayout()
    
    private let dummyData: [String] = ["anahjhjhj", "1111", "222", "ana"]
    
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
            typingAreaView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.TypingArea.typingAreaViewPadding),
            typingAreaView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.TypingArea.typingAreaViewPadding),
            typingAreaView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    //MARK: - Table View Set Up
    private func setUpTableView() {
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

//MARK: - Table View Delegate, DataSource
extension ChatView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 { // even rows are "receiverTableViewCell"
            if let cell = tableView.dequeueReusableCell(withIdentifier: "receiverTableViewCell", for: indexPath) as? RecipientTableViewCell
            {
                cell.setup(with: dummyData[indexPath.row])
                return cell
            }
        } else { // odd rows are "senderTableViewCell"
            if let cell = tableView.dequeueReusableCell(withIdentifier: "senderTableViewCell", for: indexPath) as? SenderTableViewCell {
                cell.setup(with: dummyData[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
}

//MARK: - Constants
extension ChatView {
    enum Constants{
        enum TypingArea {
            static let typingAreaViewPadding = 16.0
        }
    }
}
