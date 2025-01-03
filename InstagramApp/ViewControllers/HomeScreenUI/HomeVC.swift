//
//  HomeVC.swift
//  InstagramApp
//
//  Created by Aman Kumar on 03/01/25.
//  Copyright © 2025 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit
// MARK: - STEP 2 Confirm Protocol for data source and delegate
class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    
    lazy var posts: [Post] = {
        
        let model = Model()
        
        return model.postList
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    @objc func leftBarButtonTapped() {
        print("Left bar button tapped!")
        // Add your desired functionality here
    }
    
    @objc func rightBarButtonTapped() {
        print("Right bar button tapped!")
        // Add your desired functionality here
    }
    
    // MARK: - STEP 2 Provide of data source and delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell") as? FeedTableViewCell else { return UITableViewCell() }
        cell.configure(with: self.posts[indexPath.row])
        return cell
    }
    
}
