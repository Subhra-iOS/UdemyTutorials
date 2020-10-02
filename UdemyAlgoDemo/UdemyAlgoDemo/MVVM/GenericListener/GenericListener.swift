//
//  GenericListener.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 02/10/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation

class GenericListener<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T{
        didSet{
            listener?(value)
        }
    }
    init(newValue: T) {
        self.value = newValue
    }
    
    func bind(newListener: Listener?){
        self.listener = newListener
        newListener?(value)
    }
}
