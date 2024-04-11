//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 11.04.2024.
//

import UIKit
import SnapKit
import Kingfisher

protocol RMCharacterDetailViewControllerProtocol: AnyObject {}

final class RMCharacterDetailViewController: UIViewController {
    
    private lazy var viewModel = RMCharacterDetailViewModel(view: self)
    
    private lazy var heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        view.backgroundColor = .systemBackground
        makeHeroImageView()
    }
    
    private func makeHeroImageView(){
        view.addSubview(heroImageView)
        
        guard let url = URL(string: viewModel.characterDetails?.image ?? "") else { return }
        
        heroImageView.kf.setImage(with: url)
        
        heroImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
    }
    
    func set(character: RMCharacter){
        viewModel.setCharacter(character: character)
    }
}

extension RMCharacterDetailViewController: RMCharacterDetailViewControllerProtocol {}
