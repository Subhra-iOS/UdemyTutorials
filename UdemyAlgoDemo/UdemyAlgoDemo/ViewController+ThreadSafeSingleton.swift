//
//  ViewController+ThreadSafeSingleton.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 18/06/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation

extension ViewController {
    
    func checkThreadSafeSingleton(){
        
        let sharedInstance = ThreadSafeSingleton.shared
        sharedInstance.set(value: "Subhra", for: "name")
        sharedInstance.set(value: 36, for: "age")
        print("\(sharedInstance.getValue(for: "name") ?? "")")
        sharedInstance.set(value: "iOS Developer", for: "occupation")
        sharedInstance.set(value: 50.0, for: "pocketmoney")
        print("\(sharedInstance.getValue(for: "pocketmoney") ?? 0.0)")
        sharedInstance.set(value: "code", for: "hobby")
        sharedInstance.set(value: 200.0, for: "pocketmoney")
        print("\(sharedInstance.getValue(for: "pocketmoney") ?? 0.0)")
        print("\(sharedInstance.getValue(for: "occupation") ?? "")")
        sharedInstance.set(value: 100.0, for: "pocketmoney")
        print("\(sharedInstance.getValue(for: "pocketmoney") ?? 0.0)")
        
    }
    
    func longestSubStringWithUnique(characterCount: Int, source: String) -> (maximumLength: Int, result: String){
        //"abcbbbbcccbdddadacb"
        var maxLength = 0
        var lastDuplicateIndex = -1
        var charaterDict = [Character : Int]()
        var longestCharArray = [Character]()
        let charArr = Array(source)
        for (index, character) in charArr.enumerated(){
            if let currentIndex = charaterDict[character], lastDuplicateIndex <  currentIndex {
                lastDuplicateIndex = currentIndex
                if longestCharArray.contains(character), let _index = longestCharArray.firstIndex(of: character) { longestCharArray.remove(at: _index) }
            }else{
                longestCharArray.append(character)
            }
            let currentLength = index - lastDuplicateIndex
            maxLength = max(maxLength, currentLength)
            charaterDict[character] = index
        }
        let output = String(longestCharArray)
        return (maximumLength: maxLength, result: output)
    }
    
    
}
