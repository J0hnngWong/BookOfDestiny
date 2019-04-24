//
//  SystemToolBox.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/24.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

class SystemToolBox: NSObject {
    
    class func triggerImpactFeedBack() {
        let feedBackGenerator = UIImpactFeedbackGenerator.init(style: UIImpactFeedbackGenerator.FeedbackStyle.medium)
        feedBackGenerator.impactOccurred()
    }

}
