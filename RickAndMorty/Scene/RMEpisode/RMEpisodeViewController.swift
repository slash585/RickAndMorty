//
//  RMEpisodeViewController.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 11.04.2024.
//

import UIKit

final class RMEpisodeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        view.backgroundColor = .systemBackground
        title = "Episode"
    }
}
