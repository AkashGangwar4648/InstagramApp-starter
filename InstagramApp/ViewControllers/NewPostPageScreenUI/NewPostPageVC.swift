//
//  NewPostPageVC.swift
//  InstagramApp
//
//  Created by Apple on 03/01/25.
//  Copyright © 2025 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class NewPostPageVC: UIPageViewController, UIPageViewControllerDelegate {
    var orderedViewControllers: [UIViewController] = [UIViewController]()
    var pagesToShow: [NewPostPageToShow] = NewPostPageToShow.pagesToShow()
    var currentIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self

        for pageToShow in pagesToShow {
            let page = newViewController(pageToShow: pageToShow)
            orderedViewControllers.append(page)
        }
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(NewPostPageVC.newPage(notification:)), name: NSNotification.Name(rawValue: "newPage"), object: nil)
    }
    @objc func newPage(notification: NSNotification) {
        if let receivedObject = notification.object as? NewPostPageToShow {
            showViewController(index: receivedObject.rawValue)
        }
    }
    private func newViewController(pageToShow: NewPostPageToShow) -> UIViewController {
        var viewController: UIViewController!
        let newPostStoryboard = UIStoryboard(name: "NewPost", bundle: nil)
        switch pageToShow {
        case .camera:
            viewController = newPostStoryboard.instantiateViewController(withIdentifier: pageToShow.identifier) as! CameraViewController
        case .liberary:
            viewController = newPostStoryboard.instantiateViewController(withIdentifier: pageToShow.identifier) as! PhotoLibraryViewController
        }
        return viewController
    }
    func showViewController(index: Int) {
        if currentIndex > index {
            setViewControllers([orderedViewControllers[index]], direction: UIPageViewController.NavigationDirection.reverse, animated: true, completion: nil)
        }
        else if currentIndex < index {
            setViewControllers([orderedViewControllers[index]], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        }
        currentIndex = index
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "newPage"), object: nil)
    }
}


