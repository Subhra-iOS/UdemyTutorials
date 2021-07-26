//
//  KayValueCoding.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 23/07/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation
/**Key-value coding depends on Objective-C, and under Swift 4 and the new Objective-C inference rules, your name and email properties will not be available.
 You can mark individual properties as @objc
 ================================================================================================================================
 KVO (Key-Value-Observing) and KVC(Key-Value-Coding) are mechanisms originally build and provided by Objective-C that allow us to locate  and inertact with the underlying properties of a class that inherits NSObject at runtime.
 ================================================================================================================================
 */

class DemoClass: NSObject {
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    
    convenience init(first: String, last: String) {
        self.init()
        self.firstName = first
        self.lastName = last
    }
    
    override private init() {
        super.init()
    }
}
