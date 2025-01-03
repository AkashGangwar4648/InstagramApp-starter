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
        self.initialSetup()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else {
            return posts.count
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoriesTableViewCell") as! StoriesTableViewCell
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { fatalError() }
            cell.configure(with: posts[indexPath.row])
            return cell
        }
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
