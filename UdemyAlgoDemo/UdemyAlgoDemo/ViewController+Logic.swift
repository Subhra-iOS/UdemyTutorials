//
//  ViewController+Logic.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 10/09/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    
    func findElementOfOddOccuranceFor(array: [Int]) -> Int?{
        var collectionDict: [String: Int] = [String: Int]()
        for (_, item) in array.enumerated(){
            if var counter: Int = collectionDict["\(item)"]{
                counter = counter + 1
                collectionDict.updateValue(counter, forKey: "\(item)")
            }else{
                collectionDict.updateValue(1, forKey: "\(item)")
            }
        }
        let oddItemDict: [String : Int] = collectionDict.filter { (dict) -> Bool in
            return dict.value % 2 != 0
        }
        if oddItemDict.count == 1 {
            return Int(oddItemDict.keys.first!)
        }else{
            return nil
        }
    }
    
    func reverseInput(array: [Int]) -> [Int]{
        var minLimit = 0
        var maxLimit = array.count - 1
        var tempArr: [Int] = array
        
        while minLimit <= maxLimit {
            tempArr.swapAt(minLimit, maxLimit)
            minLimit = minLimit + 1
            maxLimit = maxLimit - 1
        }
        return tempArr
    }
    
    /**
     For a given array:
       - return number of zeros with in the array
       - return all zeros move upfront in array
     */
    func getAllZeroCountFor(array: [Int]) -> Int{
        return array.filter { (item) -> Bool in
            return item == 0
        }.count
    }
    
    func moveAllZeroUpfrontFor(array: [Int]) -> [Int]{
        var tempArr: [Int] = array
        var i = array.count - 1
        var j = 0
        while(i >= 0){
            if(tempArr[i] == 0 && i>j){
                tempArr.swapAt(i, j)
            }
            i = i - 1
            j = j + 1
        }
        return tempArr
    }
    
    /**
     Given an UIView, determine whether an UIView hierarchy contains that UIView
        - return whether or not it contains an UIView
        - return superview of that UIView
     
                -
            -   -   -
            -   -   -
            -       -
            -       -
            -       -
        Dept First Search Algorithm
     */
    
    func isContains(view: UIView, for targetView: UIView) -> Bool{
        if(view.subviews.count == 0){
            return view == targetView
        }else{
            var count = 0
            while count <= view.subviews.count {
                let node = view.subviews[count]
                if(node == targetView){
                    return true
                }
                if(self.isContains(view: node, for: targetView)){
                    return true
                }
                count = count + 1
            }
        }
        return false
    }
    
    func isContains(view: UIView, for targetView: UIView) -> UIView?{
        if(view.subviews.count == 0){
            if(view == targetView){
                return targetView.superview
            }
        }else{
            var count = 0
            while count <= view.subviews.count {
                let node = view.subviews[count]
                if(node == targetView){
                    return node.superview
                }
                
                if let resultView = self.isContains(view: node, for: targetView){
                    return resultView
                }
                count = count + 1
            }
        }
        return nil
    }
    
}
