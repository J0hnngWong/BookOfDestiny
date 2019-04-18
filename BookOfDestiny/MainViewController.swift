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
