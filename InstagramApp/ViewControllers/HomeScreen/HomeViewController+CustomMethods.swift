//
//  HomeViewController+CustomMethods.swift
//  InstagramApp
//
//  Created by Aman Kumar on 02/01/25.
//  Copyright © 2025 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit
import Foundation
extension HomeViewController {
    internal func initialSetup() {
        self.tableView.register(UINib(nibName: "StoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "StoriesTableViewCell")
        self.tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        
        self.setupNavigationBar()
    }
    
    internal func setupNavigationBar() {
        var rightBarItemImage = UIImage(named: "send_nav_icon")
        rightBarItemImage = rightBarItemImage?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarItemImage, style: .plain, target: nil, action: nil)
        
        var leftBarItemImage = UIImage(named: "camera_nav_icon")
        leftBarItemImage = leftBarItemImage?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftBarItemImage, style: .plain, target: nil, action: nil)
        
        let profileImageView = UIImageView(image: UIImage(named: "logo_nav_icon"))
        self.navigationItem.titleView = profileImageView

    }
}
