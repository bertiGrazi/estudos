//
//  ReceiptsViewController.swift
//  VirtualClock
//
//  Created by Grazielli Berti on 23/02/22.
//

import UIKit

class ReceiptsViewController: UIViewController {
    //MARK: - Variable
    
    //MARK: - View
    let viewPicture: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupControllers()
    }
    
    fileprivate func setupView() {
        view.addSubview(viewPicture)
    }
    
    fileprivate func setupControllers() {
        NSLayoutConstraint.activate([
            viewPicture.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            viewPicture.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            viewPicture.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            viewPicture.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            viewPicture.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}
