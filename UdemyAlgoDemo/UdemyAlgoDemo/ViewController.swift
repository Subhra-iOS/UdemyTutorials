//
//  ViewController.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 22/08/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.constantTimeComplexity()
      //  self.linerTimeComplexity()
      //  self.calculateOddEven()
       // self.resursionCheck()
        let item: Int = 10
        let result = self.checkFactorialOf(number: item)
        print("Factorial value of \(item) is \(result)")
        
        let sum = self.findSumOfElementUpto(element: item)
         print("Sum value of \(item) is \(sum)")
        
    }
    
    private func resursionCheck(){
        let node3: Node = Node(value: "Node3", node: nil)
        let node2: Node = Node(value: "Node2", node: node3)
        let node1: Node = Node(value: "Node1", node: node2)
        self.findRecursiveElementWith(node: node1)
    }


}

