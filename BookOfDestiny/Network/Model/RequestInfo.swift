//
//  RequestInfo.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/25.
//  Copyright © 2019 王嘉宁. All rights reserved.
//


/// network request model
import UIKit

enum RequestMethod {
    case get
    case post
    case delete
    case put
}

enum ProtocalType {
    case http
    case https
}

class RequestInfo: NSObject {
    
    var protocalType: ProtocalType
    var requestMethod: RequestMethod
    var baseHostAddress: String?
    var actionAddress: String?
    ///default is 3 seconds
    lazy var expireTime: Double = {
        return 3
    }()
    var requestParameters: Dictionary<String, Any>?
    
    init(with requestMethod: RequestMethod, using protocal: ProtocalType) {
        self.requestMethod = requestMethod
        self.protocalType = protocal
    }
    
    func setBaseHostAddress(_ host: String) {
        self.baseHostAddress = host
    }
    
    func setActionAddress(_ action: String) {
        self.actionAddress = action
    }
    
    func setExpireTime(_ time: Double) {
        self.expireTime = time
    }
    
    func setRequestParameters(_ parameters: Dictionary<String, Any>) {
        self.requestParameters = parameters
    }
    
    func getFullAddress() -> String {
        var address: String = ""
        switch self.protocalType {
        case .http:
            address.append("http://")
        case .https:
            address.append("https://")
        }
        address.append(protectString(self.baseHostAddress))
        address.append(protectString(self.actionAddress))
        return address
    }
}
