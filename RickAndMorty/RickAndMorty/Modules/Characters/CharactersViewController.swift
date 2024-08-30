//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 30.08.2024.
//

import UIKit

protocol CharactersViewControllerProtocol: AnyObject { }

final class CharactersViewController: UIViewController {

    var viewModel: CharactersViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
}

extension CharactersViewController: CharactersViewControllerProtocol { }
