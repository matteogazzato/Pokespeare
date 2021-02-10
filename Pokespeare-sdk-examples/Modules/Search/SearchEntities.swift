//
//  SearchEntities.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 09/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Search Error
struct SearchError: Error {
    var message: String
    init(_ errorType: SearchErrorType) {
        var errorMessage: String
        switch errorType {
        case .emptySearch:
            errorMessage = "Empty search, please type a Pokemon name"
        case .noDescription:
            errorMessage = "Unable to retrieve description"
        case .noSprite:
            errorMessage = "Unable to retrieve sprite"
        }
        message = errorMessage
    }
}

enum SearchErrorType {
    case emptySearch
    case noDescription
    case noSprite
}

// MARK: - Search Result
struct SearchResult {
    var name: String = ""
    var description: String = ""
    var sprite: String = ""
}

