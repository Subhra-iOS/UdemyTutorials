//
//  ViewController.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 22/08/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    public private(set) var person: ThreadSafePerson = ThreadSafePerson(_firstname: "Subhra", _lastname: "Roy")
    public  let workerQueue: DispatchQueue = DispatchQueue(label: "com.demo.workerQueue", attributes: .concurrent)
    public  let workerGroup: DispatchGroup = DispatchGroup()
    
    public  let atmQueue: DispatchQueue = DispatchQueue(label: "com.demo.atmQueue", attributes: .concurrent)
    
    private  var liskovDelegate: LiskovProtocol?
    
    
    @IBAction func didMoveToMVVMSection(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let mvvmModuleVC: LoginViewController = storyBoard.instantiateViewController(identifier: "mvvmModuleIdentifier")
            as? LoginViewController {
            self.navigationController?.pushViewController(mvvmModuleVC, animated: true)
        }
        
    }
    
    
    @IBAction func didTapOnCombine(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let combineVC: ListViewController = storyBoard.instantiateViewController(identifier: "combineVCIdentifier")
            as? ListViewController {
            self.navigationController?.pushViewController(combineVC, animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.constantTimeComplexity()
      //  self.linerTimeComplexity()
      //  self.calculateOddEven()
       // self.resursionCheck()
        let item: Int = 10
        let result = self.checkFactorialOf(number: item)
        print("Factorial value of \(item) is \(result)")
        
        let sum = self.findSumOfElementUpto(element: item)
         print("Sum value of \(item) is \(sum)")
        
        let pairIndex = self.matchPairFor(target: 4, array: [1, 2, 2, 3, 4])
        
        print("\(pairIndex)")
        
        let outputArray = self.equilibriumIndexFor(array: [-3, 2, -2, 1, -2])
        print("Equilibrium index: \(String(describing: outputArray))")
        
        let intPair: Pair = Pair<Int, Int>(firstObj: 5, secondObj: 10)
        let strPair: Pair = Pair<String, String>(firstObj: "Subhra", secondObj: "Roy")
        let comPair: Pair = Pair<Int, String>(firstObj: 10, secondObj: "Test")
        
        print("\(intPair) || \(strPair) || \(comPair)")
        
        let set = Set<SimpleStruct>()
        print("\(set)")
        
        let dictionary: Dictionary<AnyHashable, Any> = Dictionary<AnyHashable, Any>() // a heterogeneous dictionary, where key value is conform  to Hashable protocol
        print("\(dictionary)")
        
        print("Selection Sort: \(self.selectionSortOn(array: [1, 4, 3, 2]))")
        print("Insertion Sort: \(self.selectionSortOn(array: [1, 4, 3, 2]))")
        print("Bubble Sort: \(self.bubbleSortOn(array: [1, 4, 3, 2]))")
        print("Merge Sort: \(self.mergeSortOn(array: [0,9,6,3,2,1,3]))")
         print("Quick Sort: \(self.quickSortOn(array: [0,9,6,3,2,1,3]))")
        
        let payload: Payload = Payload(payloadStr: Base64Encode(newValue: "Test your code"))
        print("\(payload.payloadStr)")
        
        
        var  stack: ArrayStack = ArrayStack<Int>()
        
        for i in 0 ..< 10 {
            stack.push(element: i)
        }
        
        print("Pop : \(String(describing: stack.pop()))")
        print("Peek : \(String(describing: stack.peek()))")
        print("isEmpty : \(stack.isEmpty())")
        print("Count : \(stack.count())")
        
        var intArr = [Int]()
        for i in 1 ... 100 {
            intArr.append(i)
       }
        
        print("Fizz-Buzz out put: \(self.findFizzBuzzOn(array: intArr))")
        /**Fizz-Buzz out put: 1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "Fizz", 16, 17, "Fizz", 19, "Buzz", "Fizz", 22, 23, "Fizz", "Buzz", 26, "Fizz", 28, 29, "Fizz", 31, 32, "Fizz", 34, "Buzz", "Fizz", 37, 38, "Fizz", "Buzz", 41, "Fizz", 43, 44, "Fizz", 46, 47, "Fizz", 49, "Buzz", "Fizz", 52, 53, "Fizz", "Buzz", 56, "Fizz", 58, 59, "Fizz", 61, 62, "Fizz", 64, "Buzz", "Fizz", 67, 68, "Fizz", "Buzz", 71, "Fizz", 73, 74, "Fizz", 76, 77, "Fizz", 79, "Buzz", "Fizz", 82, 83, "Fizz", "Buzz", 86, "Fizz", 88, 89, "Fizz", 91, 92, "Fizz", 94, "Buzz", "Fizz", 97, 98, "Fizz", "Buzz" */
        
        self.invertStarTriangleOf(number: 10)
        self.starTriangleOf(number: 10)
        
        if self.isPalindrom(value: "121212121") { print("Palindrom")}
        else{ print("Not a Palindrom")}
        
        print("\(String(describing: self.getFibonnaciSeriesOf(number: 10).series))")
        print("\(String(describing: self.getFibonnaciSeriesOf(number: 10).last))")
        
        let oddItem = self.findElementOfOddOccuranceFor(array: [1,4,6,4,1])
        print("Odd occurance : \(String(describing: oddItem))")
        
        let reverseItems = self.reverseInput(array: [0,1,2,3,4,5,6,7])
        print("Reverse Array: \(reverseItems)")
        
        let seriesOfName: [NameModel] = [NameModel(firstname: "Subhra", lastname: "Das"),
                                                 NameModel(firstname: "Subhra", lastname: "Murkerjee"),
                                                 NameModel(firstname: "Subhra", lastname: "Joe"),
                                                 NameModel(firstname: "Subhra", lastname: "Sen"),]
        
        self.threadSafeIterrationWith(names: seriesOfName)
        self.workerGroup.notify(queue: DispatchQueue.global()) {
            print("Person New Name after all task is over: \(self.person.fullName ?? "")")
        }
        
       
          self.createTranscationRaceConditions()
       // self.resolveTranscationRaceConditions()
        
        self.checkPropertyObserver()
        self.checkThreadSafeSingleton()
        let finalResult = self.longestSubStringWithUnique(characterCount: 2, source: "abcbbbbcccbdddadacb")
        print("Maximum unique character length: \(finalResult.maximumLength) and String is \(finalResult.result)")
        
        self.liskovDelegate = NewSubs()
        self.liskovDelegate?.finish()
        
        Transport.carAsTransportCommute()
        Transport.flightAsTransportCommute()
        
        let localCache = LocalCacheHandler()
        let remoteCache = RemoteDataHandler()
        let _viewModel = ViewModel(key: "identifier", cacheDBHandler: localCache, remoteHandler: remoteCache)
        _viewModel.checkForCacheData()
    }
    
    private func resursionCheck(){
        let node3: Node = Node(value: "Node3", node: nil)
        let node2: Node = Node(value: "Node2", node: node3)
        let node1: Node = Node(value: "Node1", node: node2)
        self.findRecursiveElementWith(node: node1)
    }

  

}

struct Pair<T1, T2>{
    var firstObj: T1
    var secondObj: T2
}

//Safe index operator
extension Array{
    
    subscript(safe index: Index) -> Element?{
        return indices.contains(index) ? self[index] : nil
    }
    
}

struct SimpleStruct: Hashable {
    var indentifier: String
    
    public static func ==(lhs: SimpleStruct, rhs: SimpleStruct) -> Bool{
        return lhs.indentifier == rhs.indentifier
    }
}


 //Operator overloading
//    static func + (left: [Int], right: [Int]) -> [Int] { // 1
//         var sum = [Int]() // 2
//         assert(left.count == right.count, "vector of same length only")  // 3
//         for (index , _) in left.enumerated() {
//           sum.append((left[index] + right[index])) // 4
//         }
//         return sum
//     }
