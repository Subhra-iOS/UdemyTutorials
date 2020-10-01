//
//  ViewController+PropertyObserver.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 01/10/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation

extension ViewController{
    func checkPropertyObserver(){
        let observer: PropertyObserver = PropertyObserver(newValue: "Subhra")
        observer.bindDataWith { (str) in
            print("Change New Value: \(str)")
        }
        observer.value = "Srutaparna"        
    }
}

class PropertyObserver<T>{
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
    
    func bindDataWith(newListener: Listener?){
        self.listener = newListener
        newListener?(value)
    }
}
