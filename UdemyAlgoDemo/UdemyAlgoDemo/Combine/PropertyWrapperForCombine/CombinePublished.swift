//
//  CombinePublished.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 30/06/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation
import Combine

/*struct PoloGT {
    var kwInBettery = CurrentValueSubject<Double, Never>(50.0)
    let kwPerKilometer = 0.14
    
    func drive(kilometer: Double){
        let kwNeeded = kwPerKilometer * kilometer
        guard kwNeeded <= kwInBettery.value else { return }
        kwInBettery.value = kwInBettery.value - kwNeeded
    }
}*/

class PoloGT {
    @Published var kwInBettery = 50.0
    let kwPerKilometer = 0.14
    
    func drive(kilometer: Double){
        let kwNeeded = kwPerKilometer * kilometer
        guard kwNeeded <= kwInBettery else { return }
        kwInBettery = kwInBettery - kwNeeded
    }
}
