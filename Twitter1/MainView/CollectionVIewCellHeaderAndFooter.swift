//
//  CollectionVIewCellHeaderAndFooter.swift
//  Twitter1
//
//  Created by zhanybek salgarin on 5/14/22.
//

import Foundation
import UIKit

class CollectionVIewCellHeaderAndFooter: UICollectionViewCell {
    
    let headerId = "headerId"
    
    var header: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var footer: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpHeader()
        self.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.borderWidth = 1
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpHeader() {
        contentView.addSubview(header)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: self.topAnchor),
            header.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            header.rightAnchor.constraint(equalTo: self.rightAnchor),
            header.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func configureHeader(with model: HeaderAndFooter) {
        header.text = model.header
    }
}

class CollectionVIewCellFooter: UICollectionViewCell {
    
    let footerId = "FooterId"
    
    var footer: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpFooter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpFooter() {
        contentView.addSubview(footer)
        
        NSLayoutConstraint.activate([
            footer.topAnchor.constraint(equalTo: self.topAnchor),
            footer.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            footer.rightAnchor.constraint(equalTo: self.rightAnchor),
            footer.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func configureFooter(with model: HeaderAndFooter) {
        footer.text = model.footer
        
}
}
