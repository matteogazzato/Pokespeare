//
//  SearchNetworkManager.swift
//  PokespeareSDK
//
//  Created Matteo Gazzato on 09/02/21.
//  Copyright © 2021 Matteo Gazzato. All rights reserved.
//

import Foundation
import PokespeareSDK

class SearchNetworkManager: SearchNetworkManagerProtocol {
    
    private let pokespeare = PokespeareSDK()
    
    func fetchDescription(forPokemonWithName name: String, completion: @escaping (String?, SearchError?) -> Void) {
        pokespeare.retrieveDescription(ofPokemon: name) { (description, error) in
            var searchError: SearchError? = nil
            if let error = error {
                NSLog(error.localizedDescription)
                switch (error as? APIError) {
                case .tooManyRequests:
                    searchError = SearchError(.tooManyRequests)
                default:
                    searchError = SearchError(.noDescription)
                }
            }
            completion(description, searchError)
        }
    }
    
    func fetchSprite(forPokemonWithName name: String, completion: @escaping (String?, SearchError?) -> Void) {
        pokespeare.retrieveSprite(ofPokemon: name) { (sprite, error) in
            var searchError: SearchError? = nil
            if let error = error {
                NSLog(error.localizedDescription)
                searchError = SearchError(.noSprite)
            }
            completion(sprite, searchError)
        }
    }
}
