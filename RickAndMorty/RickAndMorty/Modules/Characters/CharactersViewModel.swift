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
    
    init(view: CharactersViewControllerProtocol?) {
        self.view = view
    }
    
    func viewDidLoad() {
        print("worked")
    }
}
