//
//  ViewController.swift
//  MenuProfile
//
//  Created by Grazi  Berti on 09/11/22.
//

import UIKit

class MenuProfileVC: UIViewController {
    //MARK: - Variable
    let viewModel: MenuProfileViewModel = MenuProfileViewModel()
    var screen: MenuProfileScreen?

    override func loadView() {
        self.screen = MenuProfileScreen()
        self.view = self.screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetch(.request)
    }
}

extension MenuProfileVC: MenuProfileViewModelDelegate {
    func sucess() {
        print("deu certo")
    }
    
    func error(_ message: String) {
        print("deu ruim: \(message)")
    }
}
