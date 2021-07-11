//
//  JobOperation.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 12/07/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation

private enum OperationState : Int {
    /**
     The `Operation`'s conditions have all been satisfied, and it is ready
     to execute.
     */
    case ready
    /// The `Operation` is executing.
    case executing
    /// The `Operation` has finished executing.
    case finished
    /// The `Operation` has cancelled.
    case cancelled
}

enum OperationStatus: Int{
    case inprogress
    case end
}

class  JobOperation: Operation{
    private(set) var jobIdentifier: String!
    private(set) var groupIdentifier: String!
    private(set) var operationDelegate: OperationQueueConfigueProtocol?
    var priority: QueuePriority = .normal
    var progressStatus: OperationStatus = .inprogress
    
    private let operationStateQueue = DispatchQueue(label: "com.operations.state", attributes: .concurrent)
    private var opState = OperationState.ready
    
    convenience init(jobId: String,
                     groupId: String,
                     opPriority: QueuePriority,
                     inProgress: OperationStatus,
                     delegate: OperationQueueConfigueProtocol) {
        self.init()
        self.jobIdentifier = jobId
        self.groupIdentifier = groupId
        self.priority = opPriority
        self.progressStatus = inProgress
        self.operationDelegate = delegate
    }
    
    private override init() {
        
    }
    
    override open var isAsynchronous: Bool {
        return true
    }
    
    var _isFinished: Bool = false
    
    override open var isFinished: Bool {
        set {
            willChangeValue(forKey: "isFinished")
            _isFinished = newValue
            didChangeValue(forKey: "isFinished")
        }
        
        get {
            return _isFinished
        }
    }
    
    var _isExecuting: Bool = false
    
    override open var isExecuting: Bool {
        set {
            willChangeValue(forKey: "isExecuting")
            _isExecuting = newValue
            didChangeValue(forKey: "isExecuting")
        }
        
        get {
            return _isExecuting
        }
    }
    
    open func execute() {
        print("override in subclass")
    }
    
    override final func start() {
        if isCancelled {
            finish()
            return
        }
        isExecuting = true
        isFinished = false
        execute()
    }
    
    override final func cancel() {
        self.isFinished = true
        self.isExecuting = false
    }
    
    open func finish() {
        self.cancel()
    }
    
    deinit {
        print("deinit JobOperation: \(self.name ?? "")")
    }
    
}
