//
//  HomeControllerBarConfiguration.swift
//  Twitter1
//
//  Created by zhanybek salgarin on 5/19/22.
//

import UIKit

extension HomeController {
    
    func setUpNavigationItems() {
        
        let titleImageView: UIImageView = {
            let title = UIImageView()
            title.image = UIImage(named: "twitt")
            title.translatesAutoresizingMaskIntoConstraints = false
            title.widthAnchor.constraint(equalToConstant: self.view.center.x).isActive = true
            title.contentMode = .scaleAspectFit
            return title
        }()
        navigationItem.titleView = titleImageView
        
        
        
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "f")?.withRenderingMode(.alwaysOriginal), style: ., target: nil, action: nil)
        
        let followButton = UIButton(type: .custom)
        
        followButton.setImage(UIImage(systemName: "person.badge.plus")?.withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.addTarget(self, action: #selector(hhh), for: .touchUpInside)
        //        followButton.frame = CGRect(x: 0, y: 0, width: 250, height: 250) -------this is for old version of iOS
        followButton.widthAnchor.constraint(equalToConstant: 33).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
        //        followButton.translatesAutoresizingMaskIntoConstraints = false
                    followButton.contentMode = .scaleAspectFit
        //            followButton.translatesAutoresizingMaskIntoConstraints = false
        let barButton = UIBarButtonItem(customView: followButton)
        self.navigationItem.leftBarButtonItem = barButton
        
        
        let searchButton  = UIButton(type: .system)
        searchButton.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.widthAnchor.constraint(equalToConstant: 33).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
        
        
        let composeButton  = UIButton(type: .system)
        composeButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        //        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        composeButton.widthAnchor.constraint(equalToConstant: 33).isActive = true
        composeButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
        composeButton.contentMode = .scaleAspectFit
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)
        ]
    }
    
    @objc func hhh() {
        print("did press")
    }
}
