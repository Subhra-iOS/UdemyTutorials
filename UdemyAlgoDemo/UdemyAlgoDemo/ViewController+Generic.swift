//
//  ViewController+Generic.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 28/08/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    
    func findFizzBuzzOn(array: [Int]) -> String{
        
        let inputArray: [String] = array.map { (item) -> String in
            if item % 3 == 0 { return "Fizz" }
            else if item % 5 == 0 { return "Buzz" }
            else { return "\(item)" }
        }
        
        return inputArray.joined(separator: ", ")
        
    }
}

struct ArrayStack<Element> {
    
    private var  stack: [Element] = [Element]()
    
    func count() -> Int{
        guard stack.count > 0 else { return 0 }
        return stack.count
    }
    
    func isEmpty() -> Bool{
        return stack.count == 0 ? true : false
    }
    
    mutating func push(element: Element){
       stack.append(element)
    }
    
    mutating func pop() -> Element?{
        stack.removeLast()
    }
    
    func peek() -> Element?{
        stack.last
    }
    
    mutating func removeAll(){
        stack.removeAll()
    }
    
}
