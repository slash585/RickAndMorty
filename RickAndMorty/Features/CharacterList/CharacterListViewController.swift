//
//  CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 11.11.2024.
//

import UIKit

protocol CharacterListViewControllerProtocol: AnyObject { }

final class CharacterListViewController: UIViewController {
    
    weak var coordinator: CharacterListCoordinator?
    var viewModel: CharacterListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel?.viewDidLoad()
        setupDetailButton()
    }
    
    private func setupDetailButton() {
        let detailButton = UIButton(type: .system)
        detailButton.setTitle("Go to Detail", for: .normal)
        detailButton.addTarget(self, action: #selector(detailButtonTapped), for: .touchUpInside)
        
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailButton)
        
        // Buton yerleşimini ayarla (örneğin ortada konumlandırın)
        NSLayoutConstraint.activate([
            detailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func detailButtonTapped() {
        coordinator?.goToDetail()
    }
}

extension CharacterListViewController: CharacterListViewControllerProtocol { }
