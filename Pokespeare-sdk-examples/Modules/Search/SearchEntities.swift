//
//  SearchEntities.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 09/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

struct SearchError: Error {
    var message: String
    init(_ errorType: SearchErrorType) {
        var errorMessage: String
        switch errorType {
        case .emptySearch:
            errorMessage = "Empty search, please type a Pokemon name"
        
        }
        message = errorMessage
    }
}

enum SearchErrorType {
    case emptySearch
}

