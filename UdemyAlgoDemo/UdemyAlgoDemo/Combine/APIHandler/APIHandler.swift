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

class APIHandler {
    static let shared = APIHandler()
    private init(){ }
    
    func fetchRemoteCompanies() -> Future<[String], ServiceError>{
        return Future{ promise in
            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 3) {
                promise(.success(["Apple", "Google", "Mocrosoft", "Facebook"]))
            }
        }
    }
}
