//
//  DoubleLinkedListNode.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/25.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

class DoubleLinkedListNode<T> {
    
    var value: T?
    
    //doubleLinkedList
    weak var previousNode: DoubleLinkedListNode?
    var nextNode: DoubleLinkedListNode?
    
    init(_ value: T) {
        self.value = value
    }

}
