//
//  ViewController+PropertyWrapper.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 27/08/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation

extension ViewController{
    
    
}

@propertyWrapper
struct Base64Encode {
    
    private var value: String = ""
    
    init(newValue: String) {
        self.value = newValue
    }
    
    var wrappedValue: String{
        get { Data(value.utf8).base64EncodedString() }
        set{ value = newValue }
    }
    
}

struct Payload {
    @Base64Encode var payloadStr : String
}
