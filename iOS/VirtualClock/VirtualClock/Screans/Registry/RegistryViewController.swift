//
//  ViewController.swift
//  VirtualClock
//
//  Created by Grazielli Berti on 23/02/22.
//

import UIKit

class RegistryViewController: UIViewController {
    //MARK: - Variable
    
    //MARK: - View
    let viewHour: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let labelHour: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 52, weight: .bold)
        label.tintColor = .systemGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "12:12"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        viewHour.layer.cornerRadius = view.layer.bounds.width/4
        setupView()
        setupControllers()
    }
    
    fileprivate func setupView() {
        view.addSubview(viewHour)
        viewHour.addSubview(labelHour)
    }
    
    fileprivate func setupControllers() {
        NSLayoutConstraint.activate([
            viewHour.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewHour.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewHour.widthAnchor.constraint(equalToConstant: 250),
            viewHour.heightAnchor.constraint(equalToConstant: 250),
            
            labelHour.centerXAnchor.constraint(equalTo: viewHour.centerXAnchor),
            labelHour.centerYAnchor.constraint(equalTo: viewHour.centerYAnchor),
        ])
    }
}

