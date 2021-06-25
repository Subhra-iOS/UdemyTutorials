//
//  GenericClassOrStruct.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 25/06/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation
import UIKit

protocol Commute {
    var speed: Double? { get }
    var isFavorite: Bool? { get set }
    var powerFactor: Double { get set }
    var brandId: String { get }
    var color: UIColor? { get set }
    var year: String { get set }
}
struct Car: Commute {
    let company: String
    var owner: String
    var isFavorite: Bool?
    var powerFactor: Double = 2.0
    var color: UIColor?
    var year: String
    
    var brandId: String{
        return company + "_" + year
    }
    
    var speed: Double? {
        return powerFactor*50.0
    }
}

struct Flight: Commute {
    let company: String
    var owner: String
    var isFavorite: Bool?
    var powerFactor: Double = 2.0
    var color: UIColor?
    var canFly: Bool = true
    var year: String
    
    var brandId: String{
        return company + "_" + year
    }
    
    var speed: Double? {
        return powerFactor*100.0
    }
}

struct ListOfCommute<Element> where Element: Commute {
    private var list: [Element] = [Element]()
    
    mutating func add(item: Element){
        list.append(item)
    }
    
    mutating func deleteListRef(){
        list.removeAll()
    }
    
    subscript(index: Int) -> Element?{
        guard index < list.count else { return nil }
        return list[index]
    }
}

struct Transport {
    
    static func carAsTransportCommute(){
        var list = ListOfCommute<Car>()
        
        let bmw: Car = Car(company: "BMW", owner: "Subhra", isFavorite: true, powerFactor: 2.5, color: UIColor.gray, year: "2021")
        let polo: Car = Car(company: "Volskwagan", owner: "Subhra", isFavorite: true, powerFactor: 2.5, color: UIColor.red, year: "2021")
        
        list.add(item: bmw)
        list.add(item: polo)
        
        guard let item: Car = list[0] else { return }
        print("Brand: \(String(describing: item.brandId))")
        print("Speed: \(String(describing: item.speed))")
    }
    
    static func flightAsTransportCommute(){
        var list = ListOfCommute<Flight>()
       
        let indigo: Flight = Flight(company: "Boeing", owner: "Indigo", isFavorite: true, powerFactor: 4.5, color: UIColor.white, canFly: false, year: "2010")
        let airIndia: Flight = Flight(company: "Airbus", owner: "Tata", isFavorite: true, powerFactor: 5.5, color: UIColor.white, canFly: true, year: "2021")
        
        list.add(item: indigo)
        list.add(item: airIndia)
       // list.deleteListRef()
        guard let item: Flight = list[0] else { return }
        print("Brand: \(String(describing: item.brandId))")
        print("Speed: \(String(describing: item.speed))")
    }
}
