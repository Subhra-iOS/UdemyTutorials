//
//  ThreadSafeSingleton.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 18/06/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation

class ThreadSafeSingleton {
    static  let shared = ThreadSafeSingleton()
    private let threadSafeQueue: DispatchQueue = DispatchQueue(label: "ThreadSafeSingletonQueue",
                                                                               qos: .default,
                                                                               attributes: .concurrent)
    private var itemdict: [String: Any] = [String: Any]()
    private init(){ }
    
    func set<T>(value: T, for key: String) {
        threadSafeQueue.async(flags: .barrier) {
            self.itemdict.updateValue(value, forKey: key)
        }
    }
    
    func getValue<T>(for key: String) -> T? {
       // itemdict[key] as? T
      return  threadSafeQueue.sync {
            itemdict[key] as? T
        }
    }
    
}
