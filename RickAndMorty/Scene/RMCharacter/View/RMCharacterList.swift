//
//  RMCharacterList.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 11.04.2024.
//

import UIKit

protocol RMCharacterListProtocol: AnyObject {
    func prepareCollectionView()
    func startSpinnerAnimation()
    func stopSpinnerAnimation()
    func reloadCollectionView()
}

protocol RMCharacterListDelegate: AnyObject {
    func didSelectCharacterItem(character: RMCharacter)
}

final class RMCharacterList: UIView {
    
    private lazy var viewModel = RMCharacterListViewModel(view: self)
    
    weak var delegate: RMCharacterListDelegate?
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RMCharacterListCell.self, forCellWithReuseIdentifier: RMCharacterListCell.reuseID)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewModel.viewDidLoad()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        makeSpinner()
    }
    
    private func makeSpinner(){
        addSubview(spinner)
        
        spinner.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
    }
}

extension RMCharacterList: RMCharacterListProtocol{
    func reloadCollectionView() {
        collectionView.reloadData()
    }
    
    func startSpinnerAnimation() {
        spinner.startAnimating()
    }
    
    func stopSpinnerAnimation() {
        spinner.stopAnimating()
    }
    
    func prepareCollectionView() {
        DispatchQueue.main.async {
            self.addSubview(self.collectionView)

            self.collectionView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
}

extension RMCharacterList: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterListCell.reuseID, for: indexPath) as! RMCharacterListCell
        
        cell.configure(name: viewModel.characters?.results[indexPath.item].name ?? "", status: (viewModel.characters?.results[indexPath.item].status ?? RMCharacterStatus.unknown).rawValue)
        
        cell.downloadImage(url: viewModel.characters?.results[indexPath.item].image ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let bounds = UIScreen.main.bounds
        let width: CGFloat
        width = (bounds.width-30)/2
        return CGSize(
            width: width,
            height: width * 1.5
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let character = viewModel.characters?.results[indexPath.item] else { return }
        delegate?.didSelectCharacterItem(character: character)
    }
}
