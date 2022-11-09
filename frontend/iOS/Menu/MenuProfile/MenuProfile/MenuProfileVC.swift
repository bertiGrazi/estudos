//
//  ViewController.swift
//  MenuProfile
//
//  Created by Grazi  Berti on 09/11/22.
//

import UIKit

class MenuProfileVC: UIViewController {
    
    let viewModel: MenuProfileViewModel = MenuProfileViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel.fetch(.request)
    }
}

