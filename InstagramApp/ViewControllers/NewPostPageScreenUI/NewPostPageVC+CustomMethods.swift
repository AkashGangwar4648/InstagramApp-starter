//
//  NewPostPageVC+CustomMethods.swift
//  InstagramApp
//
//  Created by Apple on 04/01/25.
//  Copyright © 2025 Gwinyai Nyatsoka. All rights reserved.
//

import Foundation
import UIKit

extension NewPostPageVC: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllerCount = orderedViewControllers.count
        guard orderedViewControllerCount != nextIndex else {
            return nil
        }
        guard orderedViewControllerCount > nextIndex else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
}
