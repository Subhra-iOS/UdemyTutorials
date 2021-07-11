//
//  OperartionQueue.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 11/07/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation

enum OperationResult<T> {
    case success(T)
    case fail
}

protocol OperationQueueConfigueProtocol {
    var totalOperations: [Operation]? { get }
    func cancel(operation: Operation, error: OperationResult<Operation>) -> Void
    func start(operation: Operation) -> Void
    func finish(operation: Operation) -> Void
    func resume(operation: Operation) -> Void
}

struct JobModel {
    
}

final class OperartionQueueManager {
    private var operationQueue: OperationQueue!
    
    private let localOperationQueue: (QualityOfService) -> OperationQueue = { qualityOfService  in
       let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = OperationQueue.defaultMaxConcurrentOperationCount
        operationQueue.name = "Background_Job_Queue"
        operationQueue.qualityOfService = qualityOfService
        return operationQueue
    }
    
    convenience init(qualityService: QualityOfService = .background){
        self.init()
        self.operationQueue = localOperationQueue(qualityService)
    }
    
    private init(){
        
    }
    
    func add(job: JobModel) -> Void{
        let operation: JobOperation = JobOperation(jobId: UUID().uuidString, groupId: UUID().uuidString, opPriority: .high, inProgress: .inprogress, delegate: self)
        self.operationQueue.addOperation(operation)
    }
    
}

extension OperartionQueueManager: OperationQueueConfigueProtocol{
    var totalOperations: [Operation]? {
        return self.operationQueue.operations
    }
    
    func cancel(operation: Operation, error: OperationResult<Operation>) {
        
    }
    
    func start(operation: Operation) {
        
    }
    
    func finish(operation: Operation) {
        
    }
    
    func resume(operation: Operation) {
        
    }
    
}
