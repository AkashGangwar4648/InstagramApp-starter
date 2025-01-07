//
//  ActivityTableViewCell.swift
//  InstagramApp
//
//  Created by Apple on 07/01/25.
//  Copyright © 2025 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImage.layer.masksToBounds = true
        
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        profileImage.layer.cornerRadius = profileImage.frame.width / 2

    }
    
}
