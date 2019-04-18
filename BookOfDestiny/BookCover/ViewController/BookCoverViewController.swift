//
//  BookCoverViewController.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/18.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

class BookCoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor.blue
        renderSubviews()
        renderEvent()
    }
    
    func renderSubviews() {
    }
    
    func renderEvent() {
        let tapOpenBookGesture = UITapGestureRecognizer.init(target: self, action: #selector(openBookAction))
        self.view.addGestureRecognizer(tapOpenBookGesture)
    }
    
    @objc func openBookAction() {
        let bookPageViewController = BookPageViewController()
        self.present(bookPageViewController, animated: true, completion: nil)
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
