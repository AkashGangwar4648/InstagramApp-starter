//
//  NewPostViewController.swift
//  InstagramApp
//
//  Created by Apple on 29/12/24.
//  Copyright © 2024 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

enum NewPostPageToShow: Int {
    
    case liberary, camera
    
    var identifier: String {
        
        switch self {
            
        case .liberary:
            
            return "PhotoLiberaryVC"
            
        case .camera:
            
            return "CameraVC"
            
        }
        
    }
    
    static func pagesToShow() -> [NewPostPageToShow] {
        
        return [.liberary, .camera]
        
    }
    
}

class NewPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

        
    }
    
    override var prefersStatusBarHidden: Bool {
        
        return true
        
    }
    
    @objc func cancelButtonPressed() {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func libraryButtonDidTouch(_ sender: Any) {
        
        NotificationCenter.default.post(name: NSNotification.Name("newPage"), object: NewPostPageToShow.liberary)
        
    }
    
    @IBAction func photoButtonDidTouch(_ sender: Any) {
        
        NotificationCenter.default.post(name: NSNotification.Name("newPage"), object: NewPostPageToShow.camera)
        
    }
    

}
