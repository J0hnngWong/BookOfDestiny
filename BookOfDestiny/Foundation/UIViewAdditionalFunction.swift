//
//  UIViewAdditionalFunction.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/5/14.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

extension UIView: CAAnimationDelegate {
    
    private struct associatedPropertyList {
        static var colorArray: Array<UIColor> = Array<UIColor>()
        static var duration: Double = 0.0
        static var beginningTime: Double = 0.0
        static var circulation: Bool = false
    }
    
    private var colorArray: Array<UIColor> {
        get {
            return objc_getAssociatedObject(self, &associatedPropertyList.colorArray) as! Array<UIColor>
        }
        set {
            objc_setAssociatedObject(self, &associatedPropertyList.colorArray, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private var duration: Double {
        get {
            return objc_getAssociatedObject(self, &associatedPropertyList.duration) as! Double
        }
        set {
            objc_setAssociatedObject(self, &associatedPropertyList.duration, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    private var beginningTime: Double {
        get {
            return objc_getAssociatedObject(self, &associatedPropertyList.beginningTime) as! Double
        }
        set {
            objc_setAssociatedObject(self, &associatedPropertyList.beginningTime, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    private var circulation: Bool {
        get {
            return objc_getAssociatedObject(self, &associatedPropertyList.circulation) as! Bool
        }
        set {
            objc_setAssociatedObject(self, &associatedPropertyList.circulation, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    public func addGradientColorAnimation(with colorArray: Array<UIColor>, duration: Double, beginningTime: Double, circulation: Bool) {
        //存储动画结束后再次调用的变量
        self.colorArray = colorArray
        self.duration = duration
        self.beginningTime = beginningTime
        self.circulation = circulation
        
        //初始化动画组，设定参数
        let animateGroup = CAAnimationGroup.init()
        animateGroup.delegate = self
        animateGroup.duration = Double(colorArray.count) * duration
        animateGroup.animations = nil
        animateGroup.isRemovedOnCompletion = false
        animateGroup.autoreverses = false
        animateGroup.fillMode = CAMediaTimingFillMode.forwards
        animateGroup.beginTime = beginningTime
        
        var animationArray: Array<CAAnimation> = Array<CAAnimation>()
        
        //储存上一个颜色和开始的时间
        guard var previousTempColor: UIColor = colorArray.first else {
            return
        }
        var startTime: Double = 0.0
        //主动画组成员
        for color: UIColor in colorArray {
            let animateGroupMemeber = CABasicAnimation.init(keyPath: "backgroundColor")
            animateGroupMemeber.duration = duration
            animateGroupMemeber.fromValue = previousTempColor.cgColor
            animateGroupMemeber.toValue = color.cgColor
            animateGroupMemeber.repeatCount = 0
            animateGroupMemeber.autoreverses = false
            animateGroupMemeber.isRemovedOnCompletion = false
            animateGroupMemeber.fillMode = CAMediaTimingFillMode.forwards
            animateGroupMemeber.beginTime = startTime
            
            animationArray.append(animateGroupMemeber)
            previousTempColor = color
            startTime = startTime + duration
        }
        //如果是循环动画则添加最后元素至最初元素的动画到末尾
        if circulation {
            let animateGroupFinalMemeber = CABasicAnimation.init(keyPath: "backgroundColor")
            animateGroupFinalMemeber.duration = duration
            animateGroupFinalMemeber.fromValue = previousTempColor.cgColor
            animateGroupFinalMemeber.toValue = colorArray.first?.cgColor
            animateGroupFinalMemeber.repeatCount = 0
            animateGroupFinalMemeber.autoreverses = false
            animateGroupFinalMemeber.isRemovedOnCompletion = false
            animateGroupFinalMemeber.fillMode = CAMediaTimingFillMode.forwards
            animateGroupFinalMemeber.beginTime = startTime
            
            animationArray.append(animateGroupFinalMemeber)
            animateGroup.duration = Double(colorArray.count + 1) * duration
        }
        //设定动画组的一些属性，添加并执行动画
        animateGroup.animations = animationArray
        self.layer.add(animateGroup, forKey: "backgroundColor")
        
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag && self.circulation {
            self.layer.removeAnimation(forKey: "backgroundColor")
            self.addGradientColorAnimation(with: self.colorArray, duration: self.duration, beginningTime: self.beginningTime, circulation: self.circulation)
        }
    }
}
