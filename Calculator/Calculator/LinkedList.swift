//
//  LinkedList.swift
//  Calculator
//
//  Created by redmango1446 on 2023/05/31.
//

class LinkedList<T> {
    private var head: Node<T>?
    
    func append(data: T?) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
}
