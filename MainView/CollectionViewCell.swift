//
//  MainView.swift
//  Twitter1
//
//  Created by zhanybek salgarin on 5/12/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let cellId = "cellId"
    let cell = "fjkf"
     
    let wordLabel: UILabel = {
        let label = UILabel()
        label.text = "Test Test Test"
        label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    this gets called when a cell is dequeued
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        
    }
    
    func setUpViews() {
        backgroundColor = .yellow
        addSubview(wordLabel)
        addSubview(profileImageView)
        NSLayoutConstraint.activate([
        wordLabel.topAnchor.constraint(equalTo: self.topAnchor),
        wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
        wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
        wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
        profileImageView.topAnchor.constraint(equalTo: wordLabel.topAnchor, constant: 16),
        profileImageView.leftAnchor.constraint(equalTo: wordLabel.leftAnchor,constant: 16),
        profileImageView.widthAnchor.constraint(equalToConstant: 50),
        profileImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
