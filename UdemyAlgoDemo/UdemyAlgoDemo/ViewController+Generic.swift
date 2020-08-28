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
    
    func invertStarTriangleOf(number: Int) -> Void{
        
        var i = number
        while i > 0 {
            var space: String = " "
            var star: String = ""
           
            space = space + String(repeating: " ", count: (number - i))
            star = space  + String(repeating: "*", count: (2*i - 1))
           
            print("\(star)")
            i = i - 1
        }
        
    }
    
    func starTriangleOf(number: Int) -> Void{
        
        var i = 0
        while i < number {
            var space: String = " "
            var star: String = ""
           
            space = space + String(repeating: " ", count: (number - i))
            star = space  + String(repeating: "*", count: (2*i + 1))
           
            print("\(star)")
            i = i + 1
        }
        
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
