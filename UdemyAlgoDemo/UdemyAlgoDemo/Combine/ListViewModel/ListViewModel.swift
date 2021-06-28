//
//  ListViewModel.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 28/06/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import Foundation
import Combine

struct ListCellViewModel {
    let title: String
}

struct ListViewModel {
    private let apiHandler: APIHandler
    init(api: APIHandler) {
        self.apiHandler = api
    }
    
    func fetchServiceData() -> Future<[String], ServiceError>{
       return self.apiHandler.fetchRemoteCompanies()
    }
    
    func convertCellViewModel(_ companies: [String]) -> [ListCellViewModel]{
        return companies.map { (name) -> ListCellViewModel in
            return ListCellViewModel(title: name)
        }
    }
}
