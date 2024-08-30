//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 30.08.2024.
//

import UIKit
import SnapKit
import Kingfisher

class CharacterCell: UICollectionViewCell {
    static let reuseID = "CharacterCell"
    
    private var character: RMCharacter? {
        didSet {
            self.setTitleLabel(title: self.character?.name ?? "")
            self.downloadImage(url: self.character?.image ?? "")
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(character: RMCharacter){
        self.character = character
    }
}

extension CharacterCell {
    private func configureUI(){
        makeTitleLabel()
        makeCharacterImage()
    }
    
    private func makeTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.centerX.equalToSuperview().offset(-10)
        }
    }
    
    private func makeCharacterImage(){
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().offset(-50)
        }
    }
    
    private func setTitleLabel(title: String){
        titleLabel.text = title
    }
    
    private func downloadImage(url: String){
        guard let url = URL(string: url) else { return }
        
        imageView.kf.setImage(with: url)
    }
}
