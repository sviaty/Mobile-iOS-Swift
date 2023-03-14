//
//  PageViewController.swift
//  PageView
//
//  Created by Dufour Sviatoslav on 23/02/2023.
//  Copyright © 2023 Merge Light. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    lazy var viewControllerList: [UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let page1 = sb.instantiateViewController(identifier: "page1")
        let page2 = sb.instantiateViewController(identifier: "page2")
        
        return [page1,page2]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let i = viewControllerList.firstIndex(of: viewController) else {return nil}
        let pi = i - 1
        guard pi >= 0 else { return nil }
        guard viewControllerList.count > pi else { return nil }
        
        return viewControllerList[pi]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let i = viewControllerList.firstIndex(of: viewController) else {return nil}
        let ni = i + 1
        guard viewControllerList.count != ni else { return nil }
        guard viewControllerList.count > ni else { return nil }
        
        return viewControllerList[ni]
    }
}
