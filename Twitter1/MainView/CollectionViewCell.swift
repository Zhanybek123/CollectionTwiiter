//
//  MainView.swift
//  Twitter1
//
//  Created by zhanybek salgarin on 5/12/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let cellId = "cellId"
    
    var wordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@lollypop"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bioTextView: UILabel = {
        let bio = UILabel()
        bio.translatesAutoresizingMaskIntoConstraints = false
        bio.font = UIFont.systemFont(ofSize: 15)
        bio.numberOfLines = 0
        return bio
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.configuration = .borderedTinted()
        button.configuration?.title = "Follow"
        button.configuration?.image = UIImage(systemName: "person.badge.plus")
        button.configuration?.imagePadding = 6
////        button.layer.borderColor = UIColor.blue.cgColor
//        button.setImage(UIImage(named: "folllow_icon"), for: .normal)
//        button.layer.cornerRadius = 8
//        button.layer.borderColor = UIColor.systemBlue.cgColor
//        button.layer.borderWidth = 1
//        button.setImage(UIImage(named: "f"), for: .normal)
//        button.imageView?.contentMode = .scaleAspectFit
////        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
//        button.setTitle("Follow", for: .normal)
//        button.setTitleColor(.systemBlue.withAlphaComponent(1), for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let firstLine: UIView = {
        let line = UIView()
        line.backgroundColor = .black
        line.layer.borderWidth = 4
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    //    this gets called when a cell is dequeued
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        [followButton, wordLabel,profileImageView,usernameLabel,bioTextView,firstLine] .forEach {
            contentView.addSubview($0)
            
        }
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 13),
            profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 13),
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            
            wordLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 13),
            wordLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8),
            wordLabel.rightAnchor.constraint(equalTo: followButton.leftAnchor, constant: -8),
            wordLabel.heightAnchor.constraint(equalToConstant: 20),
            
            usernameLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor),
            usernameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor,constant: 8),
            usernameLabel.rightAnchor.constraint(equalTo: followButton.leftAnchor, constant: -8),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioTextView.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor),
            bioTextView.leftAnchor.constraint(equalTo: usernameLabel.leftAnchor),
            bioTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -13),
            bioTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            
            followButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 13),
            followButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -13),
            followButton.widthAnchor.constraint(equalToConstant: 120),
            followButton.heightAnchor.constraint(equalToConstant: 36),
            
            firstLine.topAnchor.constraint(equalTo: bioTextView.bottomAnchor),
            firstLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -13),
            firstLine.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 13),
            firstLine.heightAnchor.constraint(equalToConstant: 1)
            
        ])
        
    }
    
    func configure(with model: MainModel) {
        wordLabel.text = model.users
        profileImageView.image = UIImage(named: model.userImage)
        usernameLabel.text = model.userlabel 
        bioTextView.text = model.bioText
    }
    
  
    
}
