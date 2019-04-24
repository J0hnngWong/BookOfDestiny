//
//  BookPageViewController.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/18.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

class BookPageViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var dismissTopHintView: UIView!
    @IBOutlet weak var dismissTopHintViewTopMargin: NSLayoutConstraint!
    
    let bookPageViewControllerTransition = BookPageViewControllerTransition()
    let viewModel = BookPageViewControllerViewModel()
    
    //MARK: pull down dismiss gesture
    var panDownCountDownTimer: Timer?
    var gestureStartPoint: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderSubviews()
        renderEvents()
    }
    
    func renderSubviews() {
        self.transitioningDelegate = self
        self.view.backgroundColor = UIColor.red
    }
    
    func renderEvents() {
        
//        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(handlePanDownGesture(gesture:)))
//        self.view.addGestureRecognizer(gesture)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        let view = UIView.init(frame: SCREEN_BOUNDS)
//        self.view.addSubview(view)
//        view.backgroundColor = UIColor.white
//        UIView.animate(withDuration: 3.0, delay: 0, options: UIView.AnimationOptions.repeat, animations: {
//            view.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
//        }) { (finished) in
//        }
    }
    
    @objc func dismissPage() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handlePanDownGesture(gesture: UIPanGestureRecognizer) {
        
//        switch gesture.state {
//        case .began:
//            gesture.location(in: self.view).y
//            break
//        case .changed:
//
//        default:
//            <#code#>
//        }
    }
    
    //MARK: gesture function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches begin with : \(String(describing: touches.first?.location(in: self.view)))")
        gestureStartPoint = touches.first?.location(in: self.view)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches moved with : \(String(describing: touches.first?.location(in: self.view)))")
        if gestureStartPoint != nil && touches.first != nil {
            self.dismissTopHintViewTopMargin.constant = touches.first!.location(in: self.view).y - gestureStartPoint!.y
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches end")
        gestureStartPoint = nil
        self.dismissTopHintViewTopMargin.constant = 0
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches cancel")
        gestureStartPoint = nil
        self.dismissTopHintViewTopMargin.constant = 0
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
