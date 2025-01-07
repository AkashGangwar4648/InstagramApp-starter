//
//  NewPostVC+CustomMethods.swift
//  InstagramApp
//
//  Created by Apple on 03/01/25.
//  Copyright © 2025 Gwinyai Nyatsoka. All rights reserved.
//

import Foundation
import UIKit

extension NewPostVC {
    
    func intialSetup() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}
