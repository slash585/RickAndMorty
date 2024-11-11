//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 11.11.2024.
//

import Foundation

protocol CharacterListViewModelProtocol { 
    func viewDidLoad()
}

final class CharacterListViewModel: CharacterListViewModelProtocol {
    private weak var view: CharacterListViewControllerProtocol?
    
    init(view: CharacterListViewControllerProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        print("im here")
    }
}
