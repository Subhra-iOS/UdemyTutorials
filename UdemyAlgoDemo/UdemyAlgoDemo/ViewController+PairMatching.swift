//
//  ViewController+PairMatching.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 23/08/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    func matchPairFor(target: Int, array: [Int]) -> Array<Int>{
        
         var dict_store: Dictionary<Int, Int> = Dictionary<Int, Int>()
         var result: Array<Int> = Array<Int>()
        
        for (index, value) in array.enumerated(){
            dict_store[index] = value
        }
        
        for i in 0 ..< array.count{
            let item = array[i]
            let next = target - item
            if let nextIndex = dict_store[next] {
                if !result.contains(nextIndex) { result.append(nextIndex) }
            }
            
        }
        return result
    }
    
    func equilibriumIndexFor(array: [Int]) -> [Int]?{
        
        var indices: [Int] = [Int]()
        var sum: Int = array.reduce(0, +)
        var leftSum = 0
        for i in 0 ..< array.count{
            sum = sum - array[i]
            if leftSum == sum{
                indices.append(i)
            }
            leftSum = leftSum + array[i]
        }
        
        return indices.isEmpty ? nil : indices
    }
    
}
