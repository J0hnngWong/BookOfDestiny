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
            
            print("data : \(data) and response : \(String(describing: response))")
            do {
                let dict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                print("dict : \(dict)")
            }
            catch{
                print("error")
            }
            
        }) { (error) in
            print("error")
        }
    }

}
