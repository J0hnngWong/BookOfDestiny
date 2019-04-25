//
//  LinkedListNode.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/25.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

class LinkedListNode<T> {
    var value: T?
    
    //doubleLinkedList
    //weak var previousNode: LinkedListNode?
    var nextNode: LinkedListNode?
    
    init(_ value: T) {
        self.value = value
    }
    
}
