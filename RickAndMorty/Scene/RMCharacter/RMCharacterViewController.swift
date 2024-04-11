//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 11.04.2024.
//

import UIKit

final class RMCharacterViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        view.backgroundColor = .systemBackground
        title = "Character"
    }
}
