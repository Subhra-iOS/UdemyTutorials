//
//  InstantiatePool.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 26/07/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation

class Item: NSObject {
    var id: Int!
    var name: String!
   convenience init(id: Int, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
    
    override private init() {
        super.init()
    }
}

extension String.StringInterpolation{
    mutating func appendInterpolation(_ object: Item){
        appendInterpolation("item id: \(String(describing: object.id)) and name \(String(describing: object.name))")
    }
}

class Pool: NSObject{
    
    func getAllObjectsInPool() -> [Item] {
        autoreleasepool { () -> [Item] in
            var array: [Item] = [Item]()
            for i in 1..<100{
                let item: Item = Item(id: i+100, name: "name_\(i)")
                array.append(item)
                print("\(item)")
            }
            return array
        }
    }
}
