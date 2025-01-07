//
//  SearchViewController.swift
//  InstagramApp
//
//  Created by Apple on 29/12/24.
//  Copyright © 2024 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchController: UISearchController!
    
    lazy var posts: [Post] = {
        let model = Model()
        return model.postList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    func collectionView(_ collectionview: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Dequeue the reusable cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCollectionViewCell", for: indexPath) as! ExploreCollectionViewCell
        // Configure the cell
        cell.exploreImage.image = posts[indexPath.row].postImage
        return cell
    }
}
