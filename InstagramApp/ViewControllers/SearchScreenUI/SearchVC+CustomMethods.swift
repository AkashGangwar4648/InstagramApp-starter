//
//  SearchViewCustomMethods.swift
//  InstagramApp
//
//  Created by Apple on 02/01/25.
//  Copyright © 2025 Gwinyai Nyatsoka. All rights reserved.
//

import Foundation
import UIKit

extension SearchVC {
    func initialSetup(){
        searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.showsCancelButton = false
        self.setupSearchController()
        
    }
    
    func setupSearchController() {
        for subView in searchController.searchBar.subviews {
            for subView1 in subView.subviews {
                if let textField = subView1 as? UITextField{
                    textField.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)
                    textField.textAlignment = NSTextAlignment.center
                }
            }
        }
        
        searchController.dimsBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false
        
        let searchBarContainer = SearchBarContainerView(customSearchBar: searchController.searchBar)
        
        searchBarContainer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
        
        navigationItem.titleView = searchBarContainer
    }
    
}



