//
//  RMCharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 11.04.2024.
//

import Foundation

protocol RMCharacterDetailViewModelProtocol {
    var characterDetails: RMCharacter? { get set }
    
    func setCharacter(character: RMCharacter)
}

final class RMCharacterDetailViewModel: RMCharacterDetailViewModelProtocol  {
    private weak var view: RMCharacterDetailViewControllerProtocol?
    
    var characterDetails: RMCharacter?
    
    init(view: RMCharacterDetailViewControllerProtocol?) {
        self.view = view
    }
    
    func setCharacter(character: RMCharacter) {
        self.characterDetails = character
    }
}
