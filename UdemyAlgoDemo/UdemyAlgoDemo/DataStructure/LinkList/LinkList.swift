//
//  LinkList.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 20/09/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation

 class ListNode<Value> {
    public var value: Value
    public var next: ListNode?
    public init(value: Value, next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
}
 extension ListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " " }
}

 struct LinkedList<Value> {
     var head: ListNode<Value>?
     var tail: ListNode<Value>?
     init() {
        
    }
    public var isEmpty: Bool {
        return head == nil
    }
    
    func creatNodes() {
        let node1 = ListNode(value: 1)
        let node2 = ListNode(value: 2)
        let node3 = ListNode(value: 3)
        node1.next = node2
        node2.next = node3
        print(node1)
    }
    
    mutating func push(_ value: Value) {
        head = ListNode(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        // 2
        tail!.next = ListNode(value: value)
        // 3
        tail = tail!.next
    }
     func node(at index: Int) -> ListNode<Value>? { // 1
        var currentNode = head
        var currentIndex = 0
        // 2
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    @discardableResult
     mutating func insert(_ value: Value,
                             after node: ListNode<Value>) -> ListNode<Value>{
    // 2
    guard tail !== node else {
    append(value)
    return tail!
    }
    // 3
    node.next = ListNode(value: value, next: node.next)
    return node.next!
  }
    @discardableResult
     mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
     }
    @discardableResult
    mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.value
    }
}
extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

struct DSExample {
    func pushExample() {
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        print(list)
    }
    
    func append() {
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        print(list)
    }
    
   func insert() {
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        print("Before inserting: \(list)")
        var middleNode = list.node(at: 1)!
        for _ in 1...4 {
            middleNode = list.insert(-1, after: middleNode)
        }
        print("After inserting: \(list)")
    }
    
    func pop() {
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        print("Before popping list: \(list)")
        let poppedValue = list.pop()
        print("After popping list: \(list)")
        print("Popped value: " + String(describing: poppedValue))
    }
    
    func removeLast() {
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        print("Before removing last node: \(list)")
        let removedValue = list.removeLast()
        print("After removing last node: \(list)")
        print("Removed value: " + String(describing: removedValue))
    }
    
}
