//
//  ViewController.swift
//  AppMusicBF
//
//  Created by Grazi  Berti on 22/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    var screen: HomeViewControllerScreen?
    
    override func loadView() {
        /// gerando a minha instäncia
        self.screen = HomeViewControllerScreen()
        /// toda vizualização da nossa HomeviewController é a nossa Screen
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
