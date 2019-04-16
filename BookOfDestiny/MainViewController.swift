//
//  MainViewController.swift
//  BookOfDestiny
//
//  Created by JianingWang on 4/16/19.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit
import AFNetworking
import Alamofire

class MainViewController: UIViewController {

    @IBOutlet weak var bookCoverView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var transform = CATransform3DIdentity
        let angle = CGFloat(Double.pi / 2)
        transform.m34 = -1.0 / 500
        self.bookCoverView.layer.anchorPoint = CGPoint.init(x: 0, y: 0.5)
        
        transform = CATransform3DTranslate(transform, -150, 0, 0)
        transform = CATransform3DScale(transform, 2, 2, 2)
        transform = CATransform3DRotate(transform, -angle, 0, 1, 0)
        
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 2.0, initialSpringVelocity: 2.0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.bookCoverView.layer.transform = transform
        }) { (isFinished) in
            
        }
        getData()
    }
    
    func getData() {
        //http://api.big-hep.com/data
        Alamofire.request("http://api.big-hep.com/data").responseJSON { response in
            print(response.request)
            print(response.response)
            print(response.data)
            print(response.result)
        }
        Alamofire.request("http://api.big-hep.com/data").response { response in
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            print("Error: \(response.error)")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
    }
}
