//
//  BookContentDataManager.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/25.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

class BookContentDataManager: NSObject {
    
    static let defaultManager = BookContentDataManager()
    
    var bookContentArray: Array<Any>?
    
    func setBookContent(_ array: Array<Any>) {
        self.bookContentArray = array
    }

}
