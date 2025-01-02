//
//  HomeViewController.swift
//  InstagramApp
//
//  Created by Apple on 29/12/24.
//  Copyright © 2024 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var posts: [Post] = {
        
        let model = Model()
        
        return model.postList
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = CGFloat(88.0)
        
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        
        tableView.register(UINib(nibName: "StoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "StoriesTableViewCell")
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
        tableView.tableFooterView = UIView()
        
        var rightBarItemImage = UIImage(named: "send_nav_icon")
        
        rightBarItemImage = rightBarItemImage?.withRenderingMode(.alwaysOriginal)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarItemImage, style: .plain, target: nil, action: nil)
        
        var leftBarItemImage = UIImage(named: "camera_nav_icon")
        
        leftBarItemImage = leftBarItemImage?.withRenderingMode(.alwaysOriginal)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftBarItemImage, style: .plain, target: nil, action: nil)
        
        let profileImageView = UIImageView(image: UIImage(named: "logo_nav_icon"))
        
        self.navigationItem.titleView = profileImageView

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoriesTableViewCell") as! StoriesTableViewCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell") as! FeedTableViewCell
        
        let currentIndex = indexPath.row
        
        let postData = posts[currentIndex]
        
        cell.profileImage.image = postData.user.profileImage
        
        cell.postImage.image = postData.postImage
        
        cell.dateLabel.text = postData.datePosted
        
        cell.likesCountLabel.text = "\(postData.likesCount) likes"
        
        cell.postCommentLabel.text = postData.postComment
        
        cell.userNameTitleButton.setTitle(postData.user.name, for: .normal)
        
        cell.commentCountButton.setTitle("View all \(postData.commentCount) comments", for: .normal)
        
        return cell
        
    }
    
    /*func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // First row is the Stories cell
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoriesTableViewCell", for: indexPath) as! StoriesTableViewCell
            return cell
        }

        // Other rows are Feed cells
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell

        // Adjust the index for posts array
        let currentIndex = indexPath.row - 1

        // Safely access the posts array
        guard currentIndex >= 0 && currentIndex < posts.count else {
            fatalError("Invalid index for posts array")
        }

        let postData = posts[currentIndex]

        // Populate cell with post data
        cell.profileImage.image = postData.user.profileImage
        cell.postImage.image = postData.postImage
        cell.dateLabel.text = postData.datePosted
        cell.likesCountLabel.text = "\(postData.likesCount) likes"
        cell.postCommentLabel.text = postData.postComment
        cell.userNameTitleButton.setTitle(postData.user.name, for: .normal)
        cell.commentCountButton.setTitle("View all \(postData.commentCount) comments", for: .normal)

        return cell
    }*/

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
