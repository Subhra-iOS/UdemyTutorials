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
    
}
