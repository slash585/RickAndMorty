//
//  CharactersBuilder.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 30.08.2024.
//

import Foundation

final class CharactersBuilder {
    static func make() -> CharactersViewController {
        let viewController = CharactersViewController()
        let service = NetworkManager.shared
        let viewModel: CharactersViewModelProtocol = CharactersViewModel(view: viewController, service: service)
        viewController.viewModel = viewModel
        return viewController
    }
}
