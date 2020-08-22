//
//  ViewController+Recursion.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 22/08/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    
    func  findRecursiveElementWith(node: Node?) -> Void{
        guard let currentNode: Node = node else { return }
        print("Current Node Value: \(String(describing: currentNode.value))")
        self.findRecursiveElementWith(node: currentNode.next)
    }
    
    func checkFactorialOf(number: Int) -> Int{
        
        guard number > 1 else { return 1}
        
        let factValue = number * checkFactorialOf(number: (number - 1))
        return factValue
    }
    
    func findSumOfElementUpto(element: Int) -> Int{
        
        guard  element > 0 else { return 0 }
        let sum = element + findSumOfElementUpto(element: (element - 1))
        return sum
    }
    
}

class Node{
    var next: Node?
    var value: String?
    
    init(value: String?, node: Node?) {
        self.next = node
        self.value = value
    }
}
