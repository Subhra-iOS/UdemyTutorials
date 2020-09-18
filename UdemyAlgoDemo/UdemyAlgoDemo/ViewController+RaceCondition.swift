//
//  ViewController+RaceCondition.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 17/09/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import Foundation

extension ViewController{
    
    func createTranscationRaceConditions(){
        self.atmQueue.async{
            let atm1: ATM = ATM(name: "ATM_First")
            atm1.raceWithdrawal(amount: 800)
        }
        
        self.atmQueue.async{
            let atm2: ATM = ATM(name: "ATM_Second")
            atm2.raceWithdrawal(amount: 600)
        }
    }
    
    func resolveTranscationRaceConditions(){
        self.atmQueue.async{
            let atm1: ATM = ATM(name: "ATM_First")
            atm1.withdrawal(amount: 800)
        }
        
        self.atmQueue.async{
            let atm2: ATM = ATM(name: "ATM_Second")
            atm2.withdrawal(amount: 600)
        }
    }
    
}

struct Balance {
   static var amount: Double = 1000
}

struct ATM{
    private let operationQueue = DispatchQueue(label: "com.aync.operation" , attributes: .concurrent)
    private let atmName: String
    
    init(name: String){
        self.atmName = name
    }
    
    func withdrawal(amount: Double){
        operationQueue.async(flags: .barrier) {
            print("\(self.atmName): checking if balance containing sufficent money")
            if Balance.amount >= amount{
                print("\(self.atmName): Balance is sufficent, please wait while processing withdrawal")
                Balance.amount -= amount
                print("\(self.atmName): Done: \(amount) has been withdrawed")
                print("\(self.atmName): current balance is \(Balance.amount)")
            }else{
                print("\(self.atmName): Can't withdraw: insufficent balance")
            }
        }
    }
    
    func raceWithdrawal(amount: Double){
        
        print("\(self.atmName): checking if balance containing sufficent money")
        if Balance.amount >= amount{
            print("\(self.atmName): Balance is sufficent, please wait while processing withdrawal")
            Balance.amount -= amount
            print("\(self.atmName): Done: \(amount) has been withdrawed")
            print("\(self.atmName): current balance is \(Balance.amount)")
        }else{
            print("\(self.atmName): Can't withdraw: insufficent balance")
        }
        
    }
    
}
