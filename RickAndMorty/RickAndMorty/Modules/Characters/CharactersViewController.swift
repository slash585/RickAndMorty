//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 30.08.2024.
//

import UIKit
import SnapKit

protocol CharactersViewControllerProtocol: AnyObject {
    func activityIndicatorStart()
    func activityIndicatorStop()
    func prepareCollectionView()
    func collectionViewReloadData()
}

final class CharactersViewController: UIViewController {

    var viewModel: CharactersViewModelProtocol!
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        return activityIndicator
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelpers.createTwoColumnFlowLayout(in: view))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseID)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        configureUI()
    }
}

extension CharactersViewController {
    private func configureUI(){
        view.backgroundColor = .white
        
        makeActivityIndicator()
    }
    
    private func makeActivityIndicator(){
        view.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension CharactersViewController: CharactersViewControllerProtocol {
    func collectionViewReloadData() {
        collectionView.reloadData()
    }
    
    func prepareCollectionView() {
        DispatchQueue.main.async {
            self.view.addSubview(self.collectionView)
            
            self.collectionView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
    
    func activityIndicatorStart() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func activityIndicatorStop() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
}

extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseID, for: indexPath) as! CharacterCell
        if let character = viewModel.characters?.results[indexPath.item] {
            cell.set(character: character)
        }
        return cell
    }
}
