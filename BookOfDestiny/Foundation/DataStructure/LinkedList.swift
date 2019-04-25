//
//  LinkedList.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/25.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

class LinkedList<T> {
    
    typealias Node = LinkedListNode<T>
    
    var headNode: Node?
    var tailNode: Node?
    
    func isEmpty() -> Bool {
        return headNode == nil
    }
    
    func firstElement() -> Node? {
        return headNode
    }
    
    func lastElement() -> Node? {
        return tailNode
    }
    
    func appendAtTail(_ value: T) {
        let newNode = Node.init(value)
        if !self.isEmpty() {
            self.lastElement()?.nextNode = newNode
        } else {
            self.headNode = newNode
        }
        self.tailNode = newNode
    }

}
