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
  
    func isPalindrom(value: String) -> Bool {
        let input = value
        guard input.count > 1 else { return false }
        let array = Array(input)
        var i = 0
        var j = array.count - 1
        while i <= j {
            if array[i] != array[j] { return false }
            i = i + 1
            j = j - 1
        }
       return true
    }
    
    func checkPalindrom(value: String) -> Bool{
        let len = value.count / 2

        for i in 0..<len {
            let start = value.index(value.startIndex, offsetBy: i)
            let end = value.index(value.endIndex, offsetBy: (i * -1) - 1)

            if value[start] != value[end] {
                return false
            }
        }

        return true
    }
    
    func getFibonnaciSeriesOf(number: Int) -> (series: [Int]?, last: Int?) {
        guard number > 0 else { return (series: nil, last: 0) }
        var fibArr: [Int] = [1, 1]
        
        for index in 2 ..< number{
            fibArr.append(fibArr[index - 1] + fibArr[index - 2])
        }
        return (series: fibArr, last: fibArr.last)
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
