//
//  BookCoverViewController.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/18.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

class BookCoverViewController: UIViewController {
    
    let viewModel = BookCoverViewControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor.darkGray
        renderSubviews()
        renderEvents()
    }
    
    func renderSubviews() {
        let colorArray = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.cyan, UIColor.blue, UIColor.purple]
        
        self.view.addGradientColorAnimation(with: colorArray, duration: 1.0, beginningTime: 0, circulation: true)
    }
    
    func renderEvents() {
        let tapOpenBookGesture = UITapGestureRecognizer.init(target: self, action: #selector(openBookAction))
        self.view.addGestureRecognizer(tapOpenBookGesture)
        
        viewModel.getBookContentData()
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
