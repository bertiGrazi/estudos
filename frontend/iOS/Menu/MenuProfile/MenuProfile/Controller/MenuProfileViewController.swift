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
    
    @objc
    func tapSection(_ sender: UIButton) {
        let section = sender.tag
        if self.viewModel.constainsSection(section) {
            self.viewModel.tappdeSection(type: .remove, section: section)
            self.screen?.insertRowsTableView(indexPath: self.viewModel.indexPathForSection(section), section: section)
        } else {
            self.viewModel.tappdeSection(type: .insert, section: section)
            self.screen?.deleteRowsTableView(indexPath: self.viewModel.indexPathForSection(section), section: section)
        }
    }
}

//MARK: - MenuProfileViewModelDelegate
extension MenuProfileViewController: MenuProfileViewModelDelegate {
    func sucess() {
        self.screen?.setupDelegateTableView(delegate: self, dataSource: self)
        self.screen?.tableView.reloadData()
    }
    
    func error(_ message: String) {
        print("deu ruim: \(message)")
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension MenuProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionView()
        view.referencebutton.addTarget(self, action: #selector(self.tapSection(_:)), for: .touchUpInside)
        view.referencebutton.tag = section
        view.setupSection(description: self.viewModel.titleForSection(section: section))
        view.expandButton(value: self.viewModel.constainsSection(section))
        return view
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
