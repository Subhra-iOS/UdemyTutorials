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
        
        let pairIndex = self.matchPairFor(target: 4, array: [1, 2, 2, 3, 4])
        
        print("\(pairIndex)")
        
        let outputArray = self.equilibriumIndexFor(array: [-3, 2, -2, 1, -2])
        print("Equilibrium index: \(String(describing: outputArray))")
        
        let intPair: Pair = Pair<Int, Int>(firstObj: 5, secondObj: 10)
        let strPair: Pair = Pair<String, String>(firstObj: "Subhra", secondObj: "Roy")
        let comPair: Pair = Pair<Int, String>(firstObj: 10, secondObj: "Test")
        
        print("\(intPair) || \(strPair) || \(comPair)")
        
        let set = Set<SimpleStruct>()
        print("\(set)")
        
        
        let dictionary: Dictionary<AnyHashable, Any> = Dictionary<AnyHashable, Any>() // a heterogeneous dictionary, where key value is conform  to Hashable protocol
    }
    
    private func resursionCheck(){
        let node3: Node = Node(value: "Node3", node: nil)
        let node2: Node = Node(value: "Node2", node: node3)
        let node1: Node = Node(value: "Node1", node: node2)
        self.findRecursiveElementWith(node: node1)
    }


}

struct Pair<T1, T2>{
    var firstObj: T1
    var secondObj: T2
}

//Safe index operator
extension Array{
    
    subscript(safe index: Index) -> Element?{
        return indices.contains(index) ? self[index] : nil
    }
    
}

struct SimpleStruct: Hashable {
    var indentifier: String
    
    public static func ==(lhs: SimpleStruct, rhs: SimpleStruct) -> Bool{
        return lhs.indentifier == rhs.indentifier
    }
}
