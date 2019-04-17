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
import SnapKit

class MainViewController: UIViewController {

    @IBOutlet weak var bookCoverView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var transform = CATransform3DIdentity
        let angle = CGFloat(Double.pi / 2)
        transform.m34 = -1.0 / 500
        print(self.bookCoverView.frame)
        let positionOldX: CGFloat = self.bookCoverView.layer.position.x
        print(self.bookCoverView.frame)
        self.bookCoverView.layer.anchorPoint = CGPoint.init(x: 0, y: 0.5)
        print(self.bookCoverView.frame)
        self.bookCoverView.layer.position.x = positionOldX - 0.5 * self.bookCoverView.frame.width
        print(self.bookCoverView.frame)
        
//        let view:UIView = UIView.init()
//        view.backgroundColor = UIColor.red
//        self.view.addSubview(view)
//        view.snp.makeConstraints { (make) in
//            make.width.height.equalTo(100)
//            make.center.equalToSuperview()
//        }
        self.bookCoverView.snp.remakeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(20)
        }
        
        let transform1 = CATransform3DTranslate(transform, -150, 0, 0)
        let transform2 = CATransform3DScale(transform1, 2, 2, 2)
        let transform3 = CATransform3DRotate(transform2, -angle, 0, 1, 0)
        
//        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 2.0, initialSpringVelocity: 2.0, options: UIView.AnimationOptions.repeat, animations: {
//            self.bookCoverView.layer.transform = transform3
//        }) { (isFinished) in
//        }
        getData()
    }
    
    func getData() {
        //http://api.big-hep.com/data
        let address: URL = URL.init(string: "http://api.big-hep.com/data")!
        let request: URLRequest = URLRequest.init(url: address)
        let session: URLSession = URLSession.shared
        let dataTask: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                print(data)
            }
        }
        dataTask.resume()
    }
}
