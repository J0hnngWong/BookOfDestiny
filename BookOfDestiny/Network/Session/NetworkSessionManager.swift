//
//  NetworkSessionManager.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/25.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

// the tool that real send the network request
import UIKit

class NetworkSessionManager: NSObject {
    
    static let defaultManager = NetworkSessionManager()

    func sendRequest(_ requestInfo: RequestInfo, success: @escaping (Data?, URLResponse?) -> Void, failure: @escaping (Error?) -> Void) {
        let address: URL = URL.init(string: requestInfo.getFullAddress())!
        var request: URLRequest = URLRequest.init(url: address)
        request.timeoutInterval = requestInfo.expireTime
        let session: URLSession = URLSession.shared
        let dataTask: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                success(data, response)
            } else {
                failure(error)
            }
        }
        dataTask.resume()
    }
}
