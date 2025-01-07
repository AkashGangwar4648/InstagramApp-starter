//
//  HomeVC+CustomMethods.swift
//  InstagramApp
//
//  Created by Aman Kumar on 03/01/25.
//  Copyright © 2025 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit
import Foundation
/*extension HomeVC {
    
    func initialSetup() {
        self.setupnavigationBar()
        
        // MARK: - STEP 1 Register Xib
        self.tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    
    func setupnavigationBar() {
        let profileImageView = UIImageView(image: UIImage(named: "logo_nav_icon"))
        self.navigationItem.titleView = profileImageView
        
        var leftBarItemImage = UIImage(named: "camera_nav_icon")
        leftBarItemImage = leftBarItemImage?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftBarItemImage, style: .plain, target: self, action: #selector(leftBarButtonTapped))
        
        var rightBarItemImage = UIImage(named: "send_nav_icon")
        rightBarItemImage = rightBarItemImage?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarItemImage, style: .plain, target: self, action: #selector(rightBarButtonTapped))
    }
    
}*/
extension HomeVC {
 
    func initialSetup() {
        self.tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.setupNavigationBar()
        
    }
    
    func setupNavigationBar() {
        let profileImageView = UIImageView(image: UIImage(named: "logo_nav_icon"))
        self.navigationItem.titleView = profileImageView
        
        var leftBarItemImage = UIImage(named: "camera_nav_icon")
        leftBarItemImage = leftBarItemImage?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftBarItemImage, style: .plain, target: self, action: #selector(leftBarButtonTapped))
        
        var rightBarItemImage = UIImage(named: "send_nav_icon")
        rightBarItemImage = rightBarItemImage?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarItemImage, style: .plain, target: self, action: #selector(rightBarButtonTapped))
    }

}



