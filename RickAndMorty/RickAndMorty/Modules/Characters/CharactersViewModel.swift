//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 30.08.2024.
//

import Foundation

protocol CharactersViewModelProtocol {
    var characters: RMGetAllCharactersResponse? { get set }
    
    func viewDidLoad()
}

final class CharactersViewModel: CharactersViewModelProtocol {
    
    private weak var view: CharactersViewControllerProtocol?
    private let service: NetworkManagerProtocol?
    
    var characters: RMGetAllCharactersResponse?
    
    init(view: CharactersViewControllerProtocol?, service: NetworkManagerProtocol) {
        self.service = NetworkManager.shared
        self.view = view
    }
    
    func viewDidLoad() {
        fetchCharacters()
    }
}

extension CharactersViewModel {
    private func fetchCharacters() {
        view?.activityIndicatorStart()
        service?.request(.getCharacters, completion: { [weak self] (result: (Result<RMGetAllCharactersResponse, Error>)) in
            
            guard let self else { return }
            self.view?.activityIndicatorStop()
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.characters = data
                }
            case .failure(let error):
                print(error)
            }
        })
    }
}
