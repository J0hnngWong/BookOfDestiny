//
//  BookContentNetworkRequest.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/25.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

class BookContentNetworkRequest: NSObject {
    
    /// http://api.big-hep.com/data
    class func getBookContentRequest() -> RequestInfo {
        let request = RequestInfo.init(with: .get, using: .http)
        request.baseHostAddress = BASE_HOST
        request.actionAddress = "/data"
        request.expireTime = 5
        
        return request
    }
}
