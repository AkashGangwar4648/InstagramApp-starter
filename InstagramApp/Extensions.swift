//
//  Extensions.swift
//  InstagramApp
//
//  Created by Apple on 08/01/25.
//  Copyright © 2025 Gwinyai Nyatsoka. All rights reserved.
//

import Foundation

import UIKit

extension UIViewController {
    class func displayLoading(withView: UIView) -> UIView {
        
        let spinnerView = UIView.init(frame: withView.bounds)
        spinnerView.backgroundColor = UIColor.clear
        
        let ai = UIActivityIndicatorView.init(style: .gray)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            withView.addSubview(spinnerView)
        }
        return spinnerView
    }
    class func removeLoading(spinner: UIView) {
        
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
