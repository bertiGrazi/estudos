//
//  ReceiptsTableViewCell.swift
//  VirtualClock
//
//  Created by Grazielli Berti on 24/02/22.
//

import UIKit

class ReceiptsTableViewCell: UITableViewCell {
    //MARK: - Variable
    static let reuseIdentifier = "receiptsTableViewCell"
    private var sucessColorLabel = UIColor(red: 52.0/255.0, green: 199.0/255.0, blue: 89.0/255.0, alpha: 1)
    private var failColorLabel = UIColor(red: 215.0/255.0, green: 59.0/255.0, blue: 48.0/255.0, alpha: 1)
    
    //MARK: - View
        //StackView
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .yellow
        stackView.layer.cornerRadius = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
        //Label Status Sincronizada
    let statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        //Label Registro
    let registryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .systemGray2
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        // Label Data - Alura Ponto
    let dateRegistryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        // Delete Receipts Button
    fileprivate let deleteReceiptsButton: UIButton = {
        let button = UIButton()
        button.setTitle("x", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.darkGray, for: .normal)
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        configureConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        addSubview(stackView)
        stackView.addSubview(statusLabel)
        stackView.addSubview(deleteReceiptsButton)
        stackView.addSubview(registryLabel)
        stackView.addSubview(dateRegistryLabel)
    }
    
    fileprivate func configureConstrains() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            statusLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 12),
            statusLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8),
            
            registryLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
            registryLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8),
            
            dateRegistryLabel.topAnchor.constraint(equalTo: registryLabel.bottomAnchor, constant: 8),
            dateRegistryLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8)
        ])
    }
    
    func configCell(_ receipts: Receipts?) {
        statusLabel.text = receipts?.status == true ? "STATUS: SINCRONIZADO" : "STATUS: NÃO SINCRONIZADO"
        statusLabel.textColor = receipts?.status == true ? sucessColorLabel : failColorLabel
        registryLabel.text = receipts?.registry
        dateRegistryLabel.text = receipts?.data
    }
}
