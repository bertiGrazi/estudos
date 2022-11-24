//
//  TabBarViewController.swift
//  Pagination
//
//  Created by Grazi  Berti on 24/11/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupControllers()
    }
    
    private func setupControllers() {
        let iOSAcademyVC = iOSAcademyViewController()
        let swiftTutorialsVC = SwiftTutorialsViewController()
        
        iOSAcademyVC.navigationItem.largeTitleDisplayMode = .always
        swiftTutorialsVC.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: iOSAcademyVC)
        let nav2 = UINavigationController(rootViewController: swiftTutorialsVC)
        
        nav1.tabBarItem = UITabBarItem(title: "One", image: UIImage(systemName: "1.circle.fill"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "One", image: UIImage(systemName: "2.circle.fill"), tag: 1)
        
        iOSAcademyVC.title = "iOS Academy"
        swiftTutorialsVC.title = "Swift Tutorials"
        
        setViewControllers([nav1, nav2], animated: true)
    }
}
