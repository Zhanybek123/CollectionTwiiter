//
//  HomeController.swift
//  Twitter1
//
//  Created by zhanybek salgarin on 5/11/22.
//

import UIKit



class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var data: [MainModel] {
        let brian = MainModel(users: "Brian", userImage: "profile_image", userlabel: "@Brianiosdev", bioText: "iPhone, Ipad, iOS programming community. Join me an see all the posibilities ouyt there dedicated speacial for you and people like you and me")
        let ray = MainModel(users: "Ray", userImage: "ray", userlabel: "@Raymyname", bioText: "Hi esveryone! I'm really excited to attend in here. Also iPhone, Ipad, iOS programming community. Join me an see all the posibilities ouyt there dedicated speacial for you and people like you and me")
        let sam = MainModel(users: "Sam", userImage: "ray", userlabel: "@RSamsname", bioText: "Hi esveryone! I'm really excited to attend in here. Also iPhone, Ipad, iOS programming community. Join me an see all the posibilities ouyt there dedicated speacial for you and people like you and me. going to add some more text and see the reaction of costomized cell in action")
        return [brian, ray, sam]
    }
    
    var dataForHeader = HeaderAndFooter(header: "WHO TO FOLLOW", footer: "")
    var dataForFooter = HeaderAndFooter(header: "", footer: "Show me more")
    let refreshMainVIew = UIRefreshControl()
    
    
    //    let footerId = "footerId"
    //    @Interface
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell().cellId)
        collectionView?.register(CollectionVIewCellHeaderAndFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionVIewCellHeaderAndFooter().headerId)
        collectionView?.register(CollectionVIewCellFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CollectionVIewCellFooter().footerId)
        //        self.collectionView.layoutMargins = UIEdgeInsets.zero
        setUpNavigationItems()
        refreshMainVIew.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        collectionView.addSubview(refreshMainVIew)
    }
    
    @objc func didPullToRefresh() {
        print("refreshed")
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.refreshMainVIew.endRefreshing()
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let rows = data.count
        return rows
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell().cellId, for: indexPath) as! CollectionViewCell
        let data = data[indexPath.item]
        cell.configure(with: data)
        //        cell.layoutMargins = UIEdgeInsets.zero
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let _ = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell().cellId, for: indexPath) as? CollectionViewCell {
            let data = data[indexPath.item]
            let aproximateWidthOfBioTextView = collectionView.frame.width - 104
            let size = CGSize(width: aproximateWidthOfBioTextView, height: 1000)
            let font = UIFont.systemFont(ofSize: 15)
            let attributes = [NSAttributedString.Key.font: font]
            let bioString = NSString(string: data.bioText)
            let estimateFrame = bioString.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSize(width: view.frame.width, height: estimateFrame.height + 63)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionVIewCellHeaderAndFooter().headerId, for: indexPath) as! CollectionVIewCellHeaderAndFooter
            header.configureHeader(with: dataForHeader)
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionVIewCellFooter().footerId, for: indexPath) as! CollectionVIewCellFooter
            footer.configureFooter(with: dataForFooter)
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}

