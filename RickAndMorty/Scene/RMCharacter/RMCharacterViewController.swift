//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 11.04.2024.
//

import UIKit
import SnapKit

final class RMCharacterViewController: UIViewController {
    
    private lazy var rmCharacterList: RMCharacterList = {
        let view = RMCharacterList()
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        view.backgroundColor = .systemBackground
        title = "Character"
        
        makeCharacterList()
    }
    
    private func makeCharacterList(){
        view.addSubview(rmCharacterList)
        
        rmCharacterList.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension RMCharacterViewController: RMCharacterListDelegate {
    func didSelectCharacterItem(character: RMCharacter) {
        let vc = RMCharacterDetailViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = character.name
        navigationController?.pushViewController(vc, animated: true)
    }
}
