//
//  CommentTableViewCell.swift
//  InstagramApp
//
//  Created by Apple on 07/01/25.
//  Copyright © 2025 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var commentLabel: UILabel!
    
    var commentIndex: Int?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //commentLabel.delegate = self
        
        selectionStyle = .none
        
    }
    
}


