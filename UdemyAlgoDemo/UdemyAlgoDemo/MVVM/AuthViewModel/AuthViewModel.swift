//
//  AuthViewModel.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 02/10/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit
 
let minCharacterExpose = 6

class AuthViewModel {
    
    //MARK:------Access User name and password----------//
    var userName: GenericListener<String> = GenericListener(newValue: "")
    var password: GenericListener<String> = GenericListener(newValue: "")
    
    private var  user: AuthUsreModel {
        didSet{
            userName.value = user.userName
            password.value = user.password
        }
    }
    
    var protectedUserName: String {
        
        let characters = Array(userName.value)
        guard characters.count > minCharacterExpose else {
            return  userName.value
        }
        var newCharacters: [Character] = [Character]()
        for (index, character) in characters.enumerated(){
            if index >= (characters.count - minCharacterExpose){
                newCharacters.append(character)
            }else{
                newCharacters.append("*")
            }
        }
        return  String(newCharacters)
    }
    
  func setUserName(name: String){
        user.userName = name
    }
   func setPassword(pass: String){
        user.password = pass
    }
    
    init(user: AuthUsreModel) {
        self.user = user
    }
    
    deinit {
        print("AuthViewModel  dealloc")
    }
    
}
