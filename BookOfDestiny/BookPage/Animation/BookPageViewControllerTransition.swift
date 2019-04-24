//
//  BookPageViewControllerTransition.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/18.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit
import Foundation

enum TransitionType {
    case present
    case dismiss
    case push
    case pop
    case systemDefault
}

let ANIMATION_TRANSITIONING_DURATION = 1.0

class BookPageViewControllerTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    lazy var transitionType: TransitionType = {
        return .systemDefault
    }()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return ANIMATION_TRANSITIONING_DURATION
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        switch self.transitionType {
        case .present:
            self.presentTransition(using: transitionContext)
        case .dismiss:
            self.dismissTransition(using: transitionContext)
        default:
            self.systemDefault()
        }
    }
    
    func presentTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //get from and to view controller
        guard let fromViewController = transitionContext.viewController(forKey: .from) else {
            return
        }
        guard let toViewController = transitionContext.viewController(forKey: .to) else {
            return
        }
        let containerView = transitionContext.containerView
        //get from and to view
        let fromView = fromViewController.view//transitionContext.view(forKey: .from)
        let toView = toViewController.view//transitionContext.view(forKey: .to)
        //get snapshot of from and to view
        let toViewSnapView = toView?.snapshotView(afterScreenUpdates: true)
        let fromViewSnapView = fromView?.snapshotView(afterScreenUpdates: false)
        
        //设置转场之前的状态
        toViewSnapView?.frame = SCREEN_BOUNDS
        toViewSnapView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 1)
        
        //add view and snapshot view to container view
        containerView.addSubview(toView!)
        containerView.addSubview(toViewSnapView!)
        containerView.addSubview(fromViewSnapView!)
        
        toView?.isHidden = true
        fromView?.isHidden = true
        
        //core animation
        UIView.animate(withDuration: ANIMATION_TRANSITIONING_DURATION, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            fromViewSnapView?.frame.origin.x = -SCREEN_WIDTH
            toViewSnapView?.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }) { (finished) in
            toView?.isHidden = false
            fromView?.isHidden = false
            fromViewSnapView?.removeFromSuperview()
            toViewSnapView?.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    func dismissTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //get from and to view controller
        guard let fromViewController = transitionContext.viewController(forKey: .from) else {
            return
        }
        guard let toViewController = transitionContext.viewController(forKey: .to) else {
            return
        }
        let containerView = transitionContext.containerView
        //get from and to view
        let fromView = fromViewController.view//transitionContext.view(forKey: .from)
        let toView = toViewController.view//transitionContext.view(forKey: .to)
        //get snapshot of from and to view
        let toViewSnapView = toView?.snapshotView(afterScreenUpdates: true)
        let fromViewSnapView = fromView?.snapshotView(afterScreenUpdates: true)
        
        //设置转场之前的状态
        toViewSnapView?.frame = SCREEN_BOUNDS
        toViewSnapView?.frame.origin.x = -SCREEN_WIDTH
        
        //add view and snapshot view to container view
        containerView.addSubview(toView!)
        containerView.addSubview(fromViewSnapView!)
        containerView.addSubview(toViewSnapView!)
        
        toView?.isHidden = true
        fromView?.isHidden = true
        
        //core animation
        UIView.animate(withDuration: ANIMATION_TRANSITIONING_DURATION, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            toViewSnapView?.frame.origin.x = 0
            fromViewSnapView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 1)
        }) { (finished) in
            toView?.isHidden = false
            fromView?.isHidden = false
            fromViewSnapView?.removeFromSuperview()
            toViewSnapView?.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    func systemDefault() {
        print("Please pass a transition type to perform custom transition animation")
    }
    
    //MARK: abandoned code
    //        let toView = toViewController!.view
    //        let fromView = fromViewController!.view
    //
    //        let toViewSnapShot = toView?.snapshotView(afterScreenUpdates: true)
    //        let leftFrame = CGRect.init(x: 0, y: 0, width: fromView!.frame.width / 2.0, height: fromView!.frame.height)
    //        let rightFrame = CGRect.init(x: fromView!.frame.width / 2.0, y: 0, width: fromView!.frame.width / 2.0, height: fromView!.frame.height)
    //
    //        let fromLeftViewSnapShot = fromView?.resizableSnapshotView(from: leftFrame, afterScreenUpdates: false, withCapInsets: UIEdgeInsets.zero)
    //        let fromRightViewSnapShot = fromView?.resizableSnapshotView(from: rightFrame, afterScreenUpdates: false, withCapInsets: UIEdgeInsets.zero)
    //
    //        toViewSnapShot?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 1)
    //        fromLeftViewSnapShot?.frame = leftFrame
    //        fromRightViewSnapShot?.frame = rightFrame
    //
    //        containerView.addSubview(toViewSnapShot!)
    //        containerView.addSubview(fromLeftViewSnapShot!)
    //        containerView.addSubview(fromRightViewSnapShot!)
    //        fromView?.isHidden = true
    //
    //        UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
    //            fromLeftViewSnapShot?.frame.offsetBy(dx: -fromLeftViewSnapShot!.frame.width, dy: 0)
    //            fromRightViewSnapShot?.frame.offsetBy(dx: fromRightViewSnapShot!.frame.width, dy: 0)
    //            toViewSnapShot?.layer.transform = CATransform3DIdentity
    //        }) { (finished) in
    //            fromView?.isHidden = false
    //            fromLeftViewSnapShot?.removeFromSuperview()
    //            fromRightViewSnapShot?.removeFromSuperview()
    //            toViewSnapShot?.removeFromSuperview()
    //
    //            if transitionContext.transitionWasCancelled {
    //                containerView.addSubview(fromView!)
    //            } else {
    //                containerView.addSubview(toView!)
    //            }
    //            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    //        }
}
