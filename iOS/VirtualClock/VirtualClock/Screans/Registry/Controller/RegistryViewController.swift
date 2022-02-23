//
//  ViewController.swift
//  VirtualClock
//
//  Created by Grazielli Berti on 23/02/22.
//

import UIKit

class RegistryViewController: UIViewController {
    //MARK: - Variable
    private var time: Timer?
    
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
        label.textColor = .systemGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        viewHour.layer.cornerRadius = view.layer.bounds.width/4
        setupView()
        setupControllers()
        updateSchedule()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        time?.invalidate()
    }
    
    private func configTimer() {
        time = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateSchedule),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func updateSchedule() {
        let currentTime = FormatTime().getHour(Date())
        labelHour.text = currentTime
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

