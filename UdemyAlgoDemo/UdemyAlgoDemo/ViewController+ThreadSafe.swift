//
//  ViewController+ThreadSafe.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 15/09/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    
    func threadSafeIterrationWith(names: [NameModel]){
        for (_ , name) in names.enumerated(){
            self.workerQueue.async(group: self.workerGroup) {
                self.person.changeNameWith(_firstname: name.firstname, _lastname: name.lastname)
                print("Person New name: \(self.person.fullName ?? "")")
            }
        }
    }
    
}

struct NameModel {
    let firstname: String?
    let lastname: String?
}

class Person{
    private var firstName: String?
    private var lastName: String?
    
    convenience init(_firstname: String?, _lastname: String?){
        self.init()
        self.firstName = _firstname
        self.lastName = _lastname
    }
    init(){
        
    }
    func changeNameWith(_firstname: String?, _lastname: String?){
        self.firstName = _firstname
        self.lastName = _lastname
    }
    var fullName: String? {
        return "\(self.firstName ?? "" )" + " " + "\(self.lastName ?? "")"
    }
}

class ThreadSafePerson: Person{
    let isolationQueue: DispatchQueue?
      
    override init() {
        isolationQueue = DispatchQueue(label: "com.demo.threadSafeQueue" , attributes: .concurrent)
    }
    
    override func changeNameWith(_firstname: String?, _lastname: String?) {
        isolationQueue?.async(flags: .barrier) {
            super.changeNameWith(_firstname: _firstname, _lastname: _lastname)
        }
    }
    
    override var fullName: String?{
        return isolationQueue?.sync {
          return  super.fullName
        }
    }
}
