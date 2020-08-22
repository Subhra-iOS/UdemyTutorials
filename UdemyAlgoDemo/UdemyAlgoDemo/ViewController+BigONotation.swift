//
//  ViewController+BigONotation.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 22/08/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

extension ViewController{
    
    func startWithZeroElementWith(array: [Int]) -> Bool{
        guard array.count != 0 else { return false }
        return array.first == 0 ? true : false
    }
    
    func constantTimeComplexity() {
        // Do any additional setup after loading the view.
        let smallArray = Array(repeating: 0, count: 10)
        let smallExecutionTime = ExecutionBenchMark.executionHandler {
            _ = self.startWithZeroElementWith(array: smallArray)
        }
        
        print("Avg executionTime for small array: \(smallExecutionTime)")
        
        let mediumArray = Array(repeating: 0, count: 1000)
        let mediumExecutionTime = ExecutionBenchMark.executionHandler {
            _ = self.startWithZeroElementWith(array: mediumArray)
        }
        
        print("Avg executionTime for medium array: \(mediumExecutionTime)")
        
        let largeArray = Array(repeating: 0, count: 1000000)
        let largeExecutionTime = ExecutionBenchMark.executionHandler {
            _ = self.startWithZeroElementWith(array: largeArray)
        }
        
        print("Avg executionTime for large array: \(largeExecutionTime)")
    }

}

extension ViewController{
    
    func sumOfArrayWith(array: [Int]?) -> Int{
        
        guard let tempArr: [Int] = array, tempArr.count > 0 else { return 0 }
        return tempArr.reduce(0, +)
        
    }
    
    private func  oddEvenElementFor( array: [Int]) -> (oddElement: Int, eveneElement: Int) {
        
        var oddCount: Int = 0
        var evenCount: Int = 0
        
        let _ = array.map { (item) -> Int in
            
            if item % 2 == 0 { evenCount += 1 }
            else { oddCount += 1 }
            return 1
        }
        
        return (oddElement: oddCount, eveneElement: evenCount)
    }
    
    func calculateOddEven(){
        
        let samllArray: [Int] = ExecutionBenchMark.generateRandomArrayWith(size: 1000, maxValue: UInt32.max)
        let value = self.oddEvenElementFor(array: samllArray)
        print("Calculate total odd ele: \(value.oddElement) and even ele: \(value.eveneElement)")
    }
    
    func  linerTimeComplexity() -> Void{
        
        let samllArray: [Int] = ExecutionBenchMark.generateRandomArrayWith(size: 100, maxValue: UInt32.max)
        let smallExecutionTime = ExecutionBenchMark.executionHandler {
            _ = self.sumOfArrayWith(array: samllArray)
        }
        
        print("Avg executionTime for sum of small array: \(smallExecutionTime)")
        
        let mediumArray = ExecutionBenchMark.generateRandomArrayWith(size: 10000, maxValue: UInt32.max)
        let mediumExecutionTime = ExecutionBenchMark.executionHandler {
            _ = self.sumOfArrayWith(array: mediumArray)
        }
        
        print("Avg executionTime for sum of medium array: \(mediumExecutionTime)")
        
        let largeArray = ExecutionBenchMark.generateRandomArrayWith(size: 1000000, maxValue: UInt32.max)
        let largeExecutionTime = ExecutionBenchMark.executionHandler {
            _ = self.startWithZeroElementWith(array: largeArray)
        }
        
        print("Avg executionTime for sum of large array: \(largeExecutionTime)")
    }
    
}

class ExecutionBenchMark{
    
    static func executionHandler(_ closure: @escaping () -> Void) -> CFTimeInterval{
        let runtime = 10
        var executionArray = Array<Double>(repeating: 0, count: runtime)
        
        for i in 0 ..< runtime{
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            let executionTime = endTime - startTime
            executionArray[i] = executionTime
        }
        
        return  (executionArray.reduce(0, +) / Double(runtime) )
    }
    
    static func generateRandomArrayWith(size: Int, maxValue: UInt32) -> [Int]{
        
        guard size > 0 else { return [] }
        var result: [Int] = Array<Int>(repeating: 0, count: size)
        for i in 0 ..< size {
            result[i] = Int(arc4random_uniform(maxValue))
        }
        return result
    }
    
}
