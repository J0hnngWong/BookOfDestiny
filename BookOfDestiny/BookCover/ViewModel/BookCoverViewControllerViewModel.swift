//
//  BookCoverViewControllerViewModel.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/25.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

class BookCoverViewControllerViewModel: NSObject {
    
    func getBookContentData() {
        NetworkSessionManager.defaultManager.sendRequest(BookContentNetworkRequest.getBookContentRequest(), success: { (data, response) in
            print("data : \(String(describing: data)) and response : \(String(describing: response))")
            let bookContentArray = jsonTranslate(with: data)
            BookContentDataManager.defaultManager.setBookContent(bookContentArray as! Array<Any>)
        }) { (error) in
            print("error")
        }
    }

}
