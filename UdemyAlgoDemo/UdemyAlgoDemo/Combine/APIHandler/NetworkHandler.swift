//
//  NetworkHandler.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 01/07/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation
import Combine

protocol NetworkProtocol {
    typealias Headers = [String: String]
    func fetch<T>(type: T.Type,
                     url: String,
                     headers: Headers) -> AnyPublisher<T, Error> where T : Decodable
}

struct Networker: NetworkProtocol{
        
    func fetch<T>(type: T.Type,
                  url: String,
                  headers: Headers) -> AnyPublisher<T, Error> where T : Decodable{
        
        var urlRequest = URLRequest(url: URL(string: url)!)
        
        headers.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}

final class NetworkManager {
    
    private let network: NetworkProtocol
    private var cancelable: Set<AnyCancellable>
    
    init(network: NetworkProtocol = Networker(), cancelable: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.network = network
        self.cancelable = cancelable
    }
    
    func fetchDataFromBackendOn() -> Future<[String], ServiceError>{
        return Future { [weak self] promise in
            guard let weakSelf = self else {
                promise(.failure(.none))
                return
            }
            weakSelf.network.fetch(type: JsonModel.self, url: "demo_url", headers: [:])
                .sink { (completion) in
                    switch completion{
                        case .finished: print("End of service call")
                        case .failure(let error): print("Error occurs: \(error.localizedDescription)")
                    }
                } receiveValue: { (models) in
                    promise(.success(["Apple", "Google", "Mocrosoft", "Facebook"]))
                }.store(in: &weakSelf.cancelable)
        }
    }
    
    deinit {
        self.cancelable.removeAll()
        print("NetworkManager deinit")
    }
}
