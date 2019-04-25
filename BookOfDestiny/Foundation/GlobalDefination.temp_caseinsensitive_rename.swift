//
//  GlobalDefination.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/18.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import Foundation
import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.height
let SCREEN_HEIGHT = UIScreen.main.bounds.width
let SCREEN_BOUNDS = UIScreen.main.bounds

let TAN30 = 1.0 / sqrt(3.0)
let SIN30 = 1.0 / 2.0
let COS30 = sqrt(3.0) / 2.0

let BASE_DAMP = 0.2
let ACTION_TRIGGER_THRESHOLD_VALUE = SCREEN_HEIGHT / 8

let LABEL_FADE_OUT_TIME = 1.5
let LABEL_FADE_IN_TIME = 1.5

//MARK: network address defination
let BASE_HOST = "api.big-hep.com"


func CHECK_ALL_DEFINATION() {
    print("SCREEN_WIDTH : \(SCREEN_WIDTH)")
    print("SCREEN_HEIGHT: \(SCREEN_HEIGHT)")
}

func protectString(_ string: String?) -> String! {
    if string == nil {
        return ""
    } else {
        return string
    }
}

func jsonTranslate(with data: Data?) -> Any? {
    if data != nil {
        do {
            let dict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            return dict
        }
        catch {
            print("error with JSON serialization")
        }
    }
    return nil
}
