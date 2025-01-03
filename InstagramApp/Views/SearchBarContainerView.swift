//
//  CSearchBarContainerView.swift
//  InstagramApp
//
//  Created by Apple on 01/01/25.
//  Copyright © 2025 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class SearchBarContainerView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let searchBar: UISearchBar
    
    init(customSearchBar: UISearchBar) {
        
        searchBar = customSearchBar
        
        super.init(frame: CGRect.zero)
        
        addSubview(searchBar)
        
    }
    
    convenience override init(frame: CGRect) {
        
        self.init(customSearchBar: UISearchBar())
        
        self.frame = frame
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        searchBar.frame = bounds
    }

}
