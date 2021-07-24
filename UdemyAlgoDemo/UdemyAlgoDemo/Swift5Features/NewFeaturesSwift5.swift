//
//  NewFeaturesSwift5.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 24/07/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation

/**
 - A standard Result type
 - Flattening nested optionals resulting from try?
 - Raw strings
 - Dynamically callable types
 - Checking for integer multiples
 - Improved string interpolation
 - Transforming and unwrapping dictionary values with compactMapValues()
 - Handling future enum cases
 */

//1.# Result Type inclusion in stander library to handle response and error over network
//  # It's a enum type having two cases 1. success( let data) 2. failure(let error)
enum NetworkError: Error {
    case badUrl
}

struct NetworkConnect {
    func fetchrequest(urlStr: String, response: @escaping (Result<Int, NetworkError>) -> Void){
        guard urlStr.count > 0/*, let _ = URL(string: urlStr)*/ else {
            response(.failure(.badUrl))
            return
        }
        response(.success(200))
    }
}

//2. # Flattening to regular optional item from nested optional from try?, modify the way the conditional try works
// # i.e (output?)? becomes output?, it matches the optional chaining
struct User {
    private var id: Int
    init?(id: Int){
        guard id > 0 else{
            return nil
        }
        self.id = id
    }
    
    func getMessage() throws -> String{
        return "Test message"
    }
}

//3. #Raw String construction
struct RawString {
    static let rain = #"The "rain" in "Spain" falls mainly on the spaniards."#
    private static let value = 90
    static let answer = #"The correct answer is \#(value)."#
}

//4. # @dynamicCallable: Use any one function, it's another extension to dynamic dispatch
// # use it in struct, enum, class and protocol. can implement to primary defination of type not on extensions.
@dynamicCallable
struct RandomNumberGenerator {
    
    func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String, Int>) -> Double{
        let numberOfZeros = Double(args.first?.value ?? 0)
        let maximum = pow(10, numberOfZeros)
        return Double.random(in: 0...maximum)
    }
    
    func dynamicallyCall(withArguments args: [Int]) -> Double{
        let numberOfZeros = Double(args[0])
        let maximum = pow(10, numberOfZeros)
        return Double.random(in: 0...maximum)
    }
}

//5. # checking for integer multiples
extension Int {
    func isMultiplier(of number: Int) -> Bool{
        return self.isMultiple(of: number)
    }
}

//6. # Improve string interpolation
//  # use to debug with all attributes for an object and easily print

struct DebugUser {
    let name: String
    let age: Int
}
//# No difference with custom String convertible protocol
extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: DebugUser){
        appendInterpolation("My Name is \(value.name) and I am \(value.age) years old")
    }
    
    mutating func appendInterpolation(_ number: Int, style: NumberFormatter.Style){
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        if let result = formatter.string(from: number as NSNumber){
            appendInterpolation(result)
        }
    }
    
    mutating func appendInterpolation(repeat str: String, count: Int){
        for _ in 0..<count{
            appendInterpolation("\(str)")
        }
    }
    
    mutating func appendInterpolation(_ array: [String], empty defaultValue: @autoclosure () -> String){
        guard array.count > 0 else {
            appendInterpolation(defaultValue())
            return
        }
        appendInterpolation(array.joined(separator: ", "))
    }
    
}

//# String convertible protocol
extension DebugUser: CustomStringConvertible{
    public var description: String {
        return "User name is \(name) and age is \(age)"
    }
}

//7. #Compact Map Values to the dictionaries
// # Give you a dictionary with all non nil values
struct CompactMapValues {
    let employee = ["Allen" : 30,
                    "John": 33,
                    "Lisa": nil]
    func validEmployees() -> [String: Int]{
        return employee.compactMapValues({$0})
    }
}
//8. # Non-exhaustive enums: Ability to check which enum is fixed and which one might change in future
// # According to switch security feature all switch statement to be exhausted.

struct CheckSwitchCases {
    enum PasswordError: Error {
        case short
        case obvious
        case simple
      //case old //add in future
    }
    func checkSwitch(for type: PasswordError){
        switch type {
            case .short: print("Your password is too short")
            case .obvious: print("Your password is too obvious")
            case .simple: print("Your password is too simple")
            @unknown default: print("Your password is unkown type")
        }
    }
}

//All feature examples
struct Event {
    static func getResultResponseType(){
        NetworkConnect().fetchrequest(urlStr: "") { (result) in
            switch  result{
                case .success(let code): print("\(code)")
                case .failure(let error): print("\(error.localizedDescription)")
            }
        }
    }
    
    static func flattenNestedOpionalItem(){
        let user = User(id: 100)
        let message = try? user?.getMessage()
        print("\(message ?? "")")
    }
    
    static func buildRawString(){
        print("\(RawString.rain)")
        print("\(RawString.answer)")
    }
    
    static func dynamicallyCallable(){
        let random = RandomNumberGenerator()
        let result1 = random(numberOfZeros: 0)
        print("\(result1)")
        let result2 = random(0)
        print("\(result2)")
    }
    
    static  func getMultiplier(of num1: Int, dividend: Int){
        let state = num1.isMultiplier(of: dividend)
        print("\(state)")
    }
    
    static func stringInterpolarion(){
        let user = DebugUser(name: "Subhra Roy", age: 36)
        print("User details: \(user)")
        let randomNumber = Int.random(in: 0...100)
        let luckyNumber = "This week lucky number is \(randomNumber, style: .spellOut)"
        print("\(luckyNumber)")
        
        let message = "Baby puppy bark \(repeat: "boo", count: 5)"
        print("\(message)")
        
        let friends = ["Joy", "Allen", "Devid"]
        let listOfFriends = "List of friends \(friends, empty: "No One")"
        print("\(listOfFriends)")
    }
    
    static func getValidEmpDict(){
       let emp = CompactMapValues().validEmployees()
        print("\(emp)")
    }

}
