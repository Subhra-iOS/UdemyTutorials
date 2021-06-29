//
//  APIHandler.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 28/06/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation
import Combine

enum ServiceError: Error{
    case invalid
    case none
}

enum RemoteResponse<T, ServiceError>{
    case output(T)
    case fail(ServiceError)
}

class APIHandler {
    static let shared = APIHandler()
    private init(){ }
    
    func fetchRemoteCompanies() -> Future<[String], ServiceError>{
        return Future{ promise in
            ServiceManager.fetchDataFromBackendOn { (result) in
                switch result{
                    case .output(let list): promise(.success(list ?? []))
                    case .fail(let error): promise(.failure(error))
                }
            }
        }
    }
}

struct ServiceManager {
    static func fetchDataFromBackendOn(complete: @escaping (RemoteResponse<[String]?, ServiceError>) -> Void){
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 3){
            complete(.output(["Apple", "Google", "Mocrosoft", "Facebook"]))
            //complete(.fail(.none))
        }
    }
}
