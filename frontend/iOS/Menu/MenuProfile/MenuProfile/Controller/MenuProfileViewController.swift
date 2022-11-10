//
//  ViewController.swift
//  MenuProfile
//
//  Created by Grazi  Berti on 09/11/22.
//

import UIKit

class MenuProfileViewController: UIViewController {
    //MARK: - Variable
    let viewModel: MenuProfileViewModel = MenuProfileViewModel()
    var screen: MenuProfileScreen?

    override func loadView() {
        self.screen = MenuProfileScreen()
        self.screen?.setupDelegateTableView(delegate: self, dataSource: self)
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

//MARK: - MenuProfileViewModelDelegate
extension MenuProfileViewController: MenuProfileViewModelDelegate {
    func sucess() {
        print("deu certo")
    }
    
    func error(_ message: String) {
        print("deu ruim: \(message)")
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension MenuProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        /// passa uma view para que ela seja a nossa section
        /// poderia ser return nil poeque ele esperar um view opicional
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        /// para não ficar um espaçamento
        return nil
    }
}
