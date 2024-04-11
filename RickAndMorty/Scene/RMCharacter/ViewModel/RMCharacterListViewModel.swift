//
//  RMCharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 11.04.2024.
//

import Foundation

protocol RMCharacterListViewModelProtocol {
    var characters: RMGetAllCharactersResponse? { get set }
    func viewDidLoad()
}

final class RMCharacterListViewModel: RMCharacterListViewModelProtocol {
    private weak var view: RMCharacterListProtocol?
    
    var characters: RMGetAllCharactersResponse? {
        didSet {
            view?.reloadCollectionView()
        }
    }
    
    let itemsPerRow: CGFloat = 2
    
    init(view: RMCharacterListProtocol?) {
        self.view = view
    }
    
    func viewDidLoad() {
        fetchCharacters()
    }
}

extension RMCharacterListViewModel {
    
    private func fetchCharacters(){
        view?.startSpinnerAnimation()
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.view?.stopSpinnerAnimation()
                    self.characters = model
                    self.view?.prepareCollectionView()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
