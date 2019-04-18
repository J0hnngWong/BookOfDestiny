//
//  BookPageViewControllerTransition.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/18.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

let ANIMATION_TRANSITIONING_DURATION = 0.3

class BookPageViewControllerTransition: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return ANIMATION_TRANSITIONING_DURATION
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        
        if fromViewController != nil && toViewController != nil {
            let fromView = transitionContext.view(forKey: .from)
            let toView = transitionContext.view(forKey: .to)
            
            let containerView = transitionContext.containerView
            
            //设置转场之前的状态
            toViewController?.view.frame = SCREEN_BOUNDS
            
            containerView.addSubview(toViewController!.view)
            containerView.addSubview(fromViewController!.view)
            
            UIView.animate(withDuration: 5.0, delay: 0, usingSpringWithDamping: 2.0, initialSpringVelocity: 0.1, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                fromViewController?.view.frame.origin.x = -SCREEN_WIDTH
            }) { (finished) in
                fromViewController?.view.isHidden = true
                transitionContext.completeTransition(true)
            }
        }
    }
    
    
    

}
