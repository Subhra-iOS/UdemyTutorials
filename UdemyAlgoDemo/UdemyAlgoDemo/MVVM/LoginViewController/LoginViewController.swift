//
//  LoginViewController.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 02/10/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation
import  UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    private var authViewModel: AuthViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userModel: AuthUsreModel = AuthUsreModel(userName: "", password: "")
        self.authViewModel = AuthViewModel(user: userModel)
        self.authViewModel?.userName.bind { [unowned self] in
            self.txtUserName.text = $0
            print("User name: \(String(describing: self.txtUserName.text))")
        }
        self.authViewModel?.password.bind { [unowned self] in
            self.txtPassword.text = $0
            print("User password: \(String(describing: self.txtPassword.text))")
        }
    }
    
    @IBAction func textFieldEditingDidChange(_ sender: UITextField) {
        
        let textField: UITextField = sender
        switch textField {
            case txtUserName:
                self.authViewModel?.setUserName(name: textField.text ?? "")
            case txtPassword:
                self.authViewModel?.setPassword(pass: textField.text ?? "")
            default: break
        }
    }
    
    
}


extension LoginViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
            case 0:
                textField.text = self.authViewModel?.userName.value
            case 1:
                textField.text = self.authViewModel?.password.value
            default: break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
            case txtUserName:
                textField.text = self.authViewModel?.protectedUserName
            case txtPassword:
                textField.text  = self.authViewModel?.password.value
            default: break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case txtUserName:
                self.txtPassword.becomeFirstResponder()
            case txtPassword:
                self.txtPassword.resignFirstResponder()
            default: break
        }
        return true
    }
}
