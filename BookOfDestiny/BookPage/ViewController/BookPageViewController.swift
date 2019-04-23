//
//  BookPageViewController.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/18.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

class BookPageViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let bookPageViewControllerTransition = BookPageViewControllerTransition()
    let viewModel = BookPageViewControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        renderSubviews()
        renderEvents()
    }
    
    func renderSubviews() {
        self.transitioningDelegate = self
    }
    
    func renderEvents() {
        
    }
    
    //MARK: ButtonAction
    
    //MARK: UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.bookPageViewControllerTransition.transitionType = .present
        return self.bookPageViewControllerTransition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.bookPageViewControllerTransition.transitionType = .dismiss
        return self.bookPageViewControllerTransition
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
