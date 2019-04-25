//
//  DoubleLinkedList.swift
//  BookOfDestiny
//
//  Created by 王嘉宁 on 2019/4/25.
//  Copyright © 2019 王嘉宁. All rights reserved.
//

import UIKit

class DoubleLinkedList<T> {
    
    typealias Node = DoubleLinkedListNode<T>
    
    var headNode: Node?
    var tailNode: Node?
    
    var isEmpty: Bool {
        return headNode == nil
    }
    
    var firstElement: Node? {
        return headNode
    }
    
    var lastElement: Node? {
        return tailNode
    }
    
    /// not recommand to use this property
    var count: Int {
        var countOfNode: Int = 0
        var node = headNode
        while node != nil {
            countOfNode += 1
            node = node?.nextNode
        }
        return countOfNode
    }
    
    func appendAtTail(_ value: T) {
        let newNode = Node.init(value)
        if !self.isEmpty {
            self.lastElement?.nextNode = newNode
            newNode.previousNode = self.lastElement
        } else {
            self.headNode = newNode
        }
        self.tailNode = newNode
    }
    
    func removeAllNodes() {
        self.headNode = nil
        self.tailNode = nil
    }
    
    func removeNodes(before node: Node) {
        let previousNode = node.previousNode
        if previousNode != nil {
            previousNode!.nextNode = nil
            node.previousNode = nil
        }
        self.headNode = node
    }
    
    func removeNodes(after node: Node) {
        let nextNode = node.nextNode
        if nextNode != nil {
            nextNode!.previousNode = nil
            node.nextNode = nil
        }
        self.tailNode = node
    }

}
