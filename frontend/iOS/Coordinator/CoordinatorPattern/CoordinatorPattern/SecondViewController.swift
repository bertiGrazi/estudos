//
//  SecondViewController.swift
//  CoordinatorPattern
//
//  Created by Grazi  Berti on 25/11/22.
//

import UIKit

class SecondViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        title = "Second"
    }
}
