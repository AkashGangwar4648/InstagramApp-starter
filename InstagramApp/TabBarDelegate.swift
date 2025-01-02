//
//  TabBarDelegate.swift
//  InstagramApp
//
//  Created by Apple on 02/01/25.
//  Copyright © 2025 Gwinyai Nyatsoka. All rights reserved.
//

import Foundation

import UIKit

class TabBarDelegate: NSObject, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        let navigationController = viewController as? UINavigationController
        
        _ = navigationController?.popViewController(animated: false)
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let selectedViewController = tabBarController.selectedViewController
        
        guard let _selectedViewController = selectedViewController else {
            
            return false
            
        }
        
        if viewController == _selectedViewController {
            
            return false
        }
        
        guard let controllerIndex = tabBarController.viewControllers?.index(of: viewController) else {
            
            return true
            
        }
        
        if controllerIndex == 2 {
            
            let newPostStorybard = UIStoryboard(name: "NewPost", bundle: nil)
            
            let newPostVC = newPostStorybard.instantiateViewController(withIdentifier: "NewPost") as! NewPostViewController
            
            let navController = UINavigationController(rootViewController: newPostVC)
            
            _selectedViewController.present(navController, animated: true, completion: nil)
            
            return false
            
        }
        
        let navgationController = viewController as? UINavigationController
        
        _ = navgationController?.popToRootViewController(animated: false)
        
        return true
    }
    
}


