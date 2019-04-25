//
//  BookPageViewControllerViewModel.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/23.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

class BookPageViewControllerViewModel: NSObject {
    
    //MARK: test data
    
    let contentArray = ["black all the time", "to be or not to be"]
    
    var pageNumber = 0
    
    private(set) var content:String?
    
    lazy var bookContentDictionary = {
        return ["":"", "":"", "":""]
    }()
    
    public func getBookContent() -> String {
        if pageNumber > contentArray.count - 1 {
            pageNumber = 0
        }
        let content = contentArray[pageNumber]
        pageNumber += 1
        return content
    }
    
}
