//
//  ViewController.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 22/08/20.
//  Copyright © 2020 Subhra Roy. All rights reserved.
//

import UIKit
import Combine
import LeetCodeRepo
import SubArrayRepo

class NewPerson {
    var name: String
    init(name _name: String) {
        name = _name
    }
}


class ViewController: UIViewController {
    
    public private(set) var person: ThreadSafePerson = ThreadSafePerson(_firstname: "Subhra", _lastname: "Roy")
    public  let workerQueue: DispatchQueue = DispatchQueue(label: "com.demo.workerQueue", attributes: .concurrent)
    public  let workerGroup: DispatchGroup = DispatchGroup()
    private var cancellable = Set<AnyCancellable>()
    
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
        
        let car = PoloGT()
        car.$kwInBettery.sink { (value) in
            print("Battery status: \(value)")
        }.store(in: &cancellable)
        car.drive(kilometer: 100)
        car.drive(kilometer: 50)
        
        let observed = MyObjectToObserve()
        let observer = MyObserver(object: observed)
        observed.updateDate()
        //Key-Value Coding
        let demoClass = DemoClass(first: "Subhra", last: "Roy")
        print("\( String(describing: demoClass.value(forKey: "firstName")))")
        print("\( String(describing: demoClass.value(forKey: "lastName")))")
        demoClass.setValue("Nibedita", forKey: "firstName")
        print("\( String(describing: demoClass.value(forKey: "firstName")))")
        //Swift5 new features
        Event.getResultResponseType()
        Event.flattenNestedOpionalItem()
        Event.dynamicallyCallable()
        Event.buildRawString()
        Event.stringInterpolarion()
        Event.getMultiplier(of: 10, dividend: 5)
        Event.getValidEmpDict()
        
        let pool = Pool()
        let items : [Item] = pool.getAllObjectsInPool()
        print("\(items)")
        
       // var p1, p2: NewPerson?
        var p1: NewPerson?
        p1 = NewPerson(name: "First")
        let p2 = p1
       // p1?.name = "Second"
        p1 = nil //while edit a new copy is generated which is going to nil
       // print(p1?.name)
        print(p2?.name) //ownership still there for p2
        /**Shallow copies are faster to create because sharing the reference only. The created copies does not entirely create new instance in memory instead only address/reference is copied.*/
        
        let emp = Employee(_name: "Subhra", _empId: 377)
        DebugLog.log(message: emp.description)
        
        let opManager = OperartionQueueManager(qualityService: .background)
        opManager.addBlock(jobs: [JobModel(), JobModel(), JobModel(), JobModel(), JobModel()])
        
       let resultArr = self.moveAllZeroUpfrontFor(array: [1,8,6,4,3,0,0,0])
        print("\(resultArr)")
        
        self.checkLeetCodePackage()
    }
    
    private func resursionCheck(){
        let node3: Node = Node(value: "Node3", node: nil)
        let node2: Node = Node(value: "Node2", node: node3)
        let node1: Node = Node(value: "Node1", node: node2)
        self.findRecursiveElementWith(node: node1)
    }
    
    private func checkLeetCodePackage(){
        let repo = CodeRepo()
        let result = repo.twoSum([2,7,11,15], 9)
        print(result)
        
        let stock = StocksRepo()
        let stockResult = stock.maxProfit([7,1,5,3,6,4])
        print("\(stockResult)")
        
        let arrayRepo = ArrayRepo()
        let subArrSum = arrayRepo.maxSubArray([5,4,-1,7,8])
        print("\(subArrSum)")
        
        let subArrayRepo = SubArrayRepo()
        let maxSubArrayProd = subArrayRepo.maxProduct([2,3,-2,4])
        print("\(maxSubArrayProd)")
    }
    

    deinit {
        print("ViewController deinit")
        cancellable.removeAll()
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
