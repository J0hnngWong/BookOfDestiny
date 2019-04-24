//
//  BookPageViewController.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/18.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

class BookPageViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var mainContentLabel: UILabel!
    @IBOutlet weak var dismissTopBookMarkView: UIView!
    @IBOutlet weak var dismissTopBookMarkViewTopMargin: NSLayoutConstraint!
    
    let bookPageViewControllerTransition = BookPageViewControllerTransition()
    let viewModel = BookPageViewControllerViewModel()
    
    //MARK: pull down dismiss gesture
    lazy var nextPageTapGesture = {
        return UITapGestureRecognizer.init(target: self, action: #selector(self.handleNextPageActionGesture(gesture:)))
    }()
    var panDownCountDownTimer: Timer?
    var gestureStartPoint: CGPoint?
    var gestureTranslatePoint: CGPoint?
    var trigonometricOfGesture: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderSubviews()
        renderEvents()
    }
    
    func renderSubviews() {
        self.transitioningDelegate = self
        self.view.backgroundColor = UIColor.red
        self.dismissTopBookMarkViewTopMargin.constant = -self.dismissTopBookMarkView.frame.height * 6 / 8
    }
    
    func renderEvents() {
        
//        let swipeGesture = UISwipeGestureRecognizer.init(target: self, action: #selector(handleSwipeDownGesture(gesture:)))
//        swipeGesture.direction = .down
//        self.view.addGestureRecognizer(swipeGesture)
//        
        let panDownBookMarkGesture = UIPanGestureRecognizer.init(target: self, action: #selector(handlePanDownGesture(gesture:)))
        self.dismissTopBookMarkView.addGestureRecognizer(panDownBookMarkGesture)
        
        self.view.addGestureRecognizer(self.nextPageTapGesture)
        
        self.mainContentLabel.addObserver(self, forKeyPath: "alpha", options: NSKeyValueObservingOptions.new, context: nil)
        
    }
    
    //MARK: KVO
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        //mainContentLabel alpha value
        if self.mainContentLabel.isEqual(object) && keyPath == "alpha" {
            print("kvo self.mainContentLabel alpha value and alpha value is \(self.mainContentLabel.alpha)")
            if self.mainContentLabel.alpha == 0 {
                UIView.animate(withDuration: LABEL_FADE_IN_TIME, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                    self.view.removeGestureRecognizer(self.nextPageTapGesture)
                    self.mainContentLabel.alpha = 1
                }) { (finished) in
                    self.view.addGestureRecognizer(self.nextPageTapGesture)
                }
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    //MARK: gesture function
    @objc func handleNextPageActionGesture(gesture: UITapGestureRecognizer) {
        print("tap")
        UIView.animate(withDuration: LABEL_FADE_OUT_TIME, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.view.removeGestureRecognizer(self.nextPageTapGesture)
            self.mainContentLabel.alpha = 0.001
        }) { (finished) in
            if finished {
                self.view.addGestureRecognizer(self.nextPageTapGesture)
                self.mainContentLabel.alpha = 0
            }
        }
    }
    
    @objc func dismissPage() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handlePanDownGesture(gesture: UIPanGestureRecognizer) {
        
        switch gesture.state {
        case .began:
            print("begin")
            gestureStartPoint = gesture.translation(in: self.dismissTopBookMarkView)
            break
        case .changed:
            if self.gestureStartPoint != nil {
                self.gestureTranslatePoint = gesture.translation(in: self.dismissTopBookMarkView)
                print("changed : \(self.gestureTranslatePoint!.y * CGFloat(BASE_DAMP))")
                self.dismissTopBookMarkView.transform = CGAffineTransform.init(translationX: 0, y: self.gestureTranslatePoint!.y * CGFloat(BASE_DAMP))
            }
            break
        case .ended:
            print("ended")
            if self.gestureTranslatePoint != nil {
                if self.gestureTranslatePoint!.y * CGFloat(BASE_DAMP) > ACTION_TRIGGER_THRESHOLD_VALUE {
                    self.dismissPage()
                } else {
                    UIView.animate(withDuration: 0.1, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                        self.dismissTopBookMarkView.transform = CGAffineTransform.init(translationX: 0, y: 0)
                    }) { (finished) in
                    }
                }
            }
            gestureStartPoint = nil

        default:
            gestureStartPoint = nil
            print("default gesture state")
        }
    }
    
    @objc func handleSwipeDownGesture(gesture: UISwipeGestureRecognizer) {
        print("handleSwipeDownGesture")
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touches begin with : \(String(describing: touches.first?.location(in: self.view)))")
//        gestureStartPoint = touches.first?.location(in: self.view)
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touches moved with : \(String(describing: touches.first?.location(in: self.view)))")
//        if gestureStartPoint != nil && touches.first != nil {
//            if touches.first!.location(in: self.view).y - gestureStartPoint!.y < 0 {
//                return
//            }
////            self.dismissTopHintViewTopMargin.constant = touches.first!.location(in: self.view).y - gestureStartPoint!.y
////            self.dismissTopHintView.transform = CGAffineTransform.init(translationX: 0, y: touches.first!.location(in: self.view).y - gestureStartPoint!.y)
//        }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touches end")
//        gestureStartPoint = nil
////        self.dismissTopHintViewTopMargin.constant = 0
//        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
////            self.dismissTopHintView.transform = CGAffineTransform.init(translationX: 0, y:0)
//        }) { (finished) in
//        }
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touches cancel")
//        gestureStartPoint = nil
////        self.dismissTopHintViewTopMargin.constant = 0
//        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
////            self.dismissTopHintView.transform = CGAffineTransform.init(translationX: 0, y:0)
//        }) { (finished) in
//        }
//    }
    
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
    
    //MARK: gesture transition animation
//    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        <#code#>
//    }
//
//    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        <#code#>
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
