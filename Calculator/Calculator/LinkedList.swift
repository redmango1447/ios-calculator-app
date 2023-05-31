//
//  LinkedList.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/01.
//

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    func checkHeadValue() -> Node<T>? {
        return head
    }
    
    func checkTailValue() -> Node<T>? {
        return tail
    }
    
    func append(_ NewElement: T) {
        if head == nil {
            head = Node(data: NewElement)
            tail = Node(data: NewElement)
        }
    }
}
