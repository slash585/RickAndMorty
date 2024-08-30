//
//  MainTabbarController.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 30.08.2024.
//

import UIKit

final class MainTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        createTabbar()
    }
    
    private func configureUI(){
        tabBar.tintColor = .label
        tabBar.barTintColor = .systemBlue
    }
        
    private func createTabbar(){
        let charactersVC = CharactersViewController()
        charactersVC.tabBarItem.image = UIImage(named: "Home")
        charactersVC.tabBarItem.selectedImage = UIImage(named: "HomeSelected")
        charactersVC.title = "Characters"
        charactersVC.view.backgroundColor = .white
        
        setViewControllers([charactersVC], animated: true)
    }
}
