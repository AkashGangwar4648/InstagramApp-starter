//
//  FeedTableViewCell.swift
//  InstagramApp
//
//  Created by Apple on 31/12/24.
//  Copyright © 2024 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewProfilePicture: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var imageViewPost: UIImageView!
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var labelPostComment: UILabel!
    @IBOutlet weak var buttonCommentCountRef: UIButton!
    @IBOutlet weak var labelDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupUI()
        
    }
    
    internal func setupUI() {
        self.imageViewProfilePicture.layer.cornerRadius = self.imageViewProfilePicture.frame.width / 2
        self.imageViewProfilePicture.layer.masksToBounds = true
    }
    
    internal func configure(with post: Post) {
        self.imageViewProfilePicture.image = post.user.profileImage
        self.imageViewPost.image = post.postImage
        self.labelDate.text = post.datePosted
        self.labelCount.text = "\(post.likesCount) likes"
        self.labelPostComment.text = post.postComment
        self.labelUserName.text = post.user.name
        self.buttonCommentCountRef.setTitle("View all \(post.commentCount) comments", for: .normal)
    }
    
}
