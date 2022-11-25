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
        print("Oi")
    }
    
    func start() {
        var viewController: UIViewController & Coordinating = ViewController()
        viewController.coordinator = self
        navigationController?.setViewControllers([viewController], animated: false)
    }
}
