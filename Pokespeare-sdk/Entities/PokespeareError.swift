//
//  PokespeareError.swift
//  Pokespeare-sdk
//
//  Created by Matteo Gazzato on 04/02/21.
//

struct PokespeareError: Error {
    var message: String
    init(_ errorType: PokespeareErrorType) {
        var errorMessage: String
        switch errorType {
        case .missingDescription(let name, let version):
            errorMessage = "Unable to retrieve description for Pokemon: \(name) in version: \(version)"
        }
        message = errorMessage
    }
}

enum PokespeareErrorType {
    case missingDescription(_ name: String, _ version: String)
}

