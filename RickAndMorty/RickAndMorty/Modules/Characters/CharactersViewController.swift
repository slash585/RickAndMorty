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
}

final class CharactersViewController: UIViewController {

    var viewModel: CharactersViewModelProtocol!
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        return activityIndicator
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
