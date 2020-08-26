//
//  ViewController+Sorting.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 26/08/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    
    func isPalindrome(_ value: String) -> Bool
    {
        let len = value.count / 2

        for i in 0..<len
        {
            let start = value.index(value.startIndex, offsetBy: i)
            let end = value.index(value.endIndex, offsetBy: (i * -1) - 1)

            if value[start] != value[end] {
                return false
            }
        }

        return true
    }
    
    func selectionSortOn(array: [Int]) -> [Int]{
        
        var tempArray: [Int] = array
        var lowerIndex = 0
        for i in 0 ..< (array.count - 1){
            lowerIndex = i
            for forwardIndex in (lowerIndex + 1) ..< array.count{
                if array[forwardIndex] < array[lowerIndex]{
                    lowerIndex = forwardIndex
                }
                if i != lowerIndex{
                    tempArray.swapAt(i, lowerIndex)
                }
            }
            
        }
        return tempArray
    }
    
    func insertionSortOn(array: [Int]) -> [Int]{
        guard array.count > 1 else { return array }
        var temArray: [Int] = array
        
        for index in 1 ..< array.count {
            let insertionIndex = index
            while insertionIndex > 0, temArray[insertionIndex] < temArray[insertionIndex - 1] {
                temArray.swapAt(insertionIndex, (insertionIndex - 1))
            }
        }
        return temArray
    }
    
    func bubbleSortOn(array: [Int]) -> [Int]{
        guard array.count > 0 else { return array }
        var temArray: [Int] = array
        var isSwap: Bool = false
            repeat{
                isSwap = false
                for index in 1 ..< array.count{
                    if temArray[index] < temArray[index - 1]{
                        temArray.swapAt(index, (index - 1))
                        isSwap = true
                    }
                }
            }while isSwap
        
        return temArray
    }
    
}
