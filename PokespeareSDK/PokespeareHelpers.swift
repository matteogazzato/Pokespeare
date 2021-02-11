//
//  PokespeareHelpers.swift
//  PokespeareSDK
//
//  Created by Matteo Gazzato on 04/02/21.
//

import Foundation

class PokespeareHelpers {
    static func filter(flavorTextEntries entries: [FlavorTextEntry], forVersion version: PokemonVersion) -> String? {
        let flavor = entries.first { $0.version.name == version.rawValue }
        return flavor?.flavorText
    }
}
