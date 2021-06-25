//
//  GenericCacheRemoteWorkFlow.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 25/06/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation

enum ErrorType: Error{
    case none
    case invalidJson
    case badRequest
}
@frozen enum Result<T, ErrorType>{
    case success(T)
    case failure(ErrorType)
}

struct JsonModel: Codable {
    
}

protocol CacheStorage {
    associatedtype CacheObject
    func find(identifier: String, onComplete: @escaping (Result<CacheObject, ErrorType>) -> Void)
}
protocol RemoteStorage {
    associatedtype RemoteObject: Decodable
    func find(identifier: String, onComplete: @escaping (Result<RemoteObject, ErrorType>) -> Void)
}

struct  LocalCacheHandler: CacheStorage {
    typealias CacheObject = JsonModel
    
    func find(identifier: String, onComplete: @escaping (Result<CacheObject, ErrorType>) -> Void){
        print("Call the cache function to get stored data")
        onComplete(.failure(.none))
    }
   
}

struct  RemoteDataHandler: RemoteStorage {
    typealias RemoteObject = JsonModel
    func find(identifier: String, onComplete: @escaping (Result<RemoteObject, ErrorType>) -> Void){
        print("Call the cache function to get remote data")
        onComplete(.success(JsonModel()))
    }
    
}

struct CacheBackedDataSource<Local: CacheStorage, Remote: RemoteStorage>  where Local.CacheObject == Remote.RemoteObject {
     private let cacheObject: Local
     private let remoteObject: Remote
    
    init(cache: Local, remote: Remote) {
        self.cacheObject = cache
        self.remoteObject = remote
    }
    
    func find(keyIdentifier: String, completionHadler: @escaping (Result<Local.CacheObject, ErrorType>) -> Void) {
        
        cacheObject.find(identifier: keyIdentifier) { cacheResult in
            switch cacheResult {
                case .success(let cache):
                    completionHadler(.success(cache))
                case .failure(let error):
                    print("No data found in cache and error is: \(error)")
                    remoteObject.find(identifier: keyIdentifier) { remoteResult in
                        switch remoteResult{
                            case .success(let remoteData): completionHadler(.success(remoteData))
                            case .failure(let error): completionHadler(.failure(error))
                        }
                    }
            }
        }
    }
}

struct ViewModel {
    private let localStore: LocalCacheHandler
    private let remoteStore: RemoteDataHandler
    private let keyIdentifier: String
    
    init(key: String , cacheDBHandler: LocalCacheHandler, remoteHandler: RemoteDataHandler) {
        self.keyIdentifier = key
        self.localStore = cacheDBHandler
        self.remoteStore =  remoteHandler
    }
    
    func  checkForCacheData(){
        let dataStore = CacheBackedDataSource(cache: self.localStore, remote: self.remoteStore)
        dataStore.find(keyIdentifier: self.keyIdentifier) { response in
            switch response {
                case .success(let result):
                    print("\(result)")
                case .failure(let error):
                    print("\(error.localizedDescription)")
            }
        }
    }
}
