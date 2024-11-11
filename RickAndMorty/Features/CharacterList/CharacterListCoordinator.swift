//
//  CharacterListCoordinator.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 11.11.2024.
//

import UIKit

final class CharacterListCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let characterListViewController = CharacterListViewController()
        let characterListViewModel: CharacterListViewModel = CharacterListViewModel(view: characterListViewController)
        characterListViewController.viewModel = characterListViewModel
        characterListViewController.coordinator = self
        navigationController.pushViewController(characterListViewController, animated: true)
    }
    
    func goToDetail() {
        print("go to detail")
    }
}
