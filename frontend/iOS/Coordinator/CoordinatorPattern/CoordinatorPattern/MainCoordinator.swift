//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Grazi  Berti on 25/11/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    func eventOccurred(with type: Event) {
        switch type {
        case .buttonTapped:
            var viewController: UIViewController & Coordinating = SecondViewController()
            viewController.coordinator = self
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func start() {
        var viewController: UIViewController & Coordinating = ViewController()
        viewController.coordinator = self
        navigationController?.setViewControllers([viewController], animated: false)
    }
}
