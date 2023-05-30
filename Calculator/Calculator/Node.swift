//
//  Node.swift
//  Calculator
//
//  Created by redmango1446 on 2023/05/31.
//

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T? = nil, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
