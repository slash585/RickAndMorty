//
//  AppCoorinator.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 11.11.2024.
//

import UIKit

protocol Coordinator {
    func start()
}

final class AppCoorinator: Coordinator {
    var window: UIWindow
    var characterListCoordinator: CharacterListCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        characterListCoordinator = CharacterListCoordinator(navigationController: navigationController)
        characterListCoordinator?.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
