//
//  Helper.swift
//  InstagramApp
//
//  Created by Apple on 07/01/25.
//  Copyright © 2025 Gwinyai Nyatsoka. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class Helper {
    
    class func errorAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        
        return alert
    }
    
    class func login() {
        let tabController = UITabBarController()
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        
        let searchStoryboard = UIStoryboard(name: "Search", bundle: nil)
        
        let newPostStoryboard = UIStoryboard(name: "NewPost", bundle: nil)
        
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        
        let activityStoryboard = UIStoryboard(name: "Activity", bundle: nil)
        
        let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        
        let searchVC = searchStoryboard.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        
        let newPostVC = newPostStoryboard.instantiateViewController(withIdentifier: "NewPostVC") as! NewPostVC
        
        let profileVC = profileStoryboard.instantiateViewController(withIdentifier: "Profile") as! ProfileViewController
        
        let activityVC = activityStoryboard.instantiateViewController(withIdentifier: "ActivityVC") as! ActivityVC
        
        let vcData: [(UIViewController, UIImage, UIImage)] = [
            
            (homeVC, UIImage(named: "home_tab_icon")!, UIImage(named: "home_selected_tab_icon")!),
            
            (searchVC, UIImage(named: "search_tab_icon")!, UIImage(named: "search_selected_tab_icon")!),
            
            (newPostVC, UIImage(named: "post_tab_icon")!, UIImage(named: "post_tab_icon")!),
            
            (profileVC, UIImage(named: "profile_tab_icon")!, UIImage(named: "profile_selected_tab_icon")!),
            
            (activityVC, UIImage(named: "activity_tab_icon")!, UIImage(named: "activity_selected_tab_icon")!),
            
        ]
        
        //Map function
        let vcs = vcData.map { (vc, defaultImage, selectedImage) -> UINavigationController in
            
            let nav = UINavigationController(rootViewController: vc)
            
            nav.tabBarItem.image = defaultImage
            
            nav.tabBarItem.selectedImage = selectedImage
            
            return nav
            
        }
        
        tabController.viewControllers = vcs
        
        //-------------Question-----------------
        
        tabController.tabBar.isTranslucent = true
        
        tabController.delegate = TabBarDelegate()
        
        if let items = tabController.tabBar.items {
            
            for item in items {
                
                if let image = item.image {
                    
                    item.image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                    
                }
                
                if let selectedImage = item.selectedImage {
                    
                    item.selectedImage = selectedImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                    
                }
                
                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
                
            }
            
        }
        
        
        UINavigationBar.appearance().backgroundColor = UIColor.white
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        guard let window = appDelegate.window else { return }
        
        window.rootViewController = tabController
        
    }
    
    class func logout() {
        
        do {
           
            try Auth.auth().signOut()
            
        
        let loginStoryboard = UIStoryboard(name: "Login", bundle: nil)
        
        let LoginViewController = loginStoryboard.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        guard let window = appDelegate.window else { return }
        
        window.rootViewController = LoginViewController
        }catch let error as NSError {
            
            print(error.localizedDescription)
            
        }
    }
    
}
