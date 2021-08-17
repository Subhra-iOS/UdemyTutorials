//
//  BinaryTree.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 17/08/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation

class TreeNode<T> {
    var value: T
    weak var pareant: TreeNode?
    var children: [TreeNode] = []
    init(value: T) {
        self.value = value
    }
    func add(child: TreeNode){
        self.children.append(child)
        child.pareant = self
    }
}

extension TreeNode where T : Equatable {
    func search(_ value: T) -> TreeNode?{
        if value == self.value {
            return self
        }else{
            for child in children{
                if let node = child.search(value){
                    return node
                }
            }
        }
        return nil
    }
}
