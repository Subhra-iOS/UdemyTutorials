//
//  SubstituteClass.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 21/06/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation

protocol LiskovProtocol {
    func finish()
}

class SubstituteClass : LiskovProtocol{
    func finish() {
        print("Call Parent class function")
    }
    
}

class NewSubs: SubstituteClass {
    override func finish() {
        super.finish()
        print("Call sub class function")
    }
}
