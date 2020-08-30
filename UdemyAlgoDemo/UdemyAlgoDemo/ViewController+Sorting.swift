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
    
    func mergeSortOn(array: [Int]) -> [Int]{
        
        guard array.count > 1 else { return array }
        
        let midPoint = array.count / 2
        let leftArray = mergeSortOn(array: Array(array[0 ..< midPoint]))
        let rightArray = mergeSortOn(array: Array(array[midPoint ..< array.count]))
        
        return merge(left: leftArray, right: rightArray)
    }
    
    private func merge(left: [Int], right: [Int]) -> [Int]{
        
        var sortArray: [Int] = [Int]()
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < left.count && rightIndex < right.count {
            
            if left[leftIndex] < right[rightIndex]{
                sortArray.append(left[leftIndex])
                leftIndex = leftIndex + 1
            }else if left[leftIndex] > right[rightIndex]{
                sortArray.append(right[rightIndex])
                rightIndex = rightIndex + 1
            }else{
                sortArray.append(left[leftIndex])
                leftIndex = leftIndex + 1
                sortArray.append(right[rightIndex])
                rightIndex = rightIndex + 1
            }
            
        }
        
        if leftIndex < left.count {
            sortArray.append(contentsOf: left[leftIndex ..< left.count])
        }else if rightIndex < right.count{
            sortArray.append(contentsOf: right[rightIndex ..< right.count])
        }
        
        return sortArray
    }
    
    func quickSortOn(array: [Int]) -> [Int]{
        
        guard array.count > 1 else { return array }
        let pivot = array.count / 2
        
        let pivotElement = array[pivot]
        let leftElements  = array.filter{ $0 < pivotElement}
        let pivotArray = array.filter{ $0 == pivotElement }
        let rightElements  = array.filter{ $0 > pivotElement}
        
        return quickSortOn(array: leftElements) + pivotArray + quickSortOn(array: rightElements)
        
    }
    
}
