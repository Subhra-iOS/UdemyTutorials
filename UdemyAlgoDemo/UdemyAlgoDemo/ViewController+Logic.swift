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
}
