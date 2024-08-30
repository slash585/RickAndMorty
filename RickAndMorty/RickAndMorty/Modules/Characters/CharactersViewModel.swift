//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 30.08.2024.
//

import Foundation

protocol CharactersViewModelProtocol {
    func viewDidLoad()
}

final class CharactersViewModel: CharactersViewModelProtocol {
    
    private weak var view: CharactersViewControllerProtocol?
    private let service: NetworkManagerProtocol?
    
    init(view: CharactersViewControllerProtocol?, service: NetworkManagerProtocol) {
        self.service = NetworkManager.shared
        self.view = view
    }
    
    func viewDidLoad() {
        print("worked")
    }
}
