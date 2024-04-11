//
//  RMCharacterListCell.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 11.04.2024.
//

import UIKit
import SnapKit
import Kingfisher

class RMCharacterListCell: UICollectionViewCell {
    static let reuseID = "RMCharacterListCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var cellContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.label.cgColor
        view.layer.shadowOffset = CGSize(width: -4, height: 4)
        view.layer.shadowOpacity = 0.3
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    private func configureUI(){
        makeCellContentView()
    }
    
    private func makeCellContentView(){
        addSubview(cellContainerView)

        cellContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        makeImageView()
        makeNameLabel()
        makeStatusLabel()
    }
    
    private func makeImageView(){
        cellContainerView.addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-60)
        }
    }
    
    private func makeNameLabel(){
        cellContainerView.addSubview(nameLabel)

        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.top.equalTo(imageView.snp.bottom)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
    }
    
    private func makeStatusLabel(){
        cellContainerView.addSubview(statusLabel)

        statusLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.top.equalTo(nameLabel.snp.bottom)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
    }
        
    func configure(name: String, status: String){
        nameLabel.text = name
        statusLabel.text = "Status: \(status)"
    }
    
    func downloadImage(url: String) {
        guard let url = URL(string: url) else { return }
        imageView.kf.setImage(with: url)
    }
}
