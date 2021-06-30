//
//  GenericJsonDecoder.swift
//  PrintApp
//
//  Created by Subhra Roy on 24/06/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation

enum JsonDecodeError: Error{
    case none
    case parseError
}

struct GenericJsonDecoder{
    static func decode<T>(_ type: T.Type, _ data: Data?) throws -> T where T: Decodable {
        guard let responseData = data else { throw JsonDecodeError.none }
        do{
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .useDefaultKeys
            let response: T  = try jsonDecoder.decode(T.self, from: responseData)
            return response            
        }catch let error{
            print("\(error.localizedDescription)")
            throw JsonDecodeError.parseError
        }
    }
}
