//
//  SearchNetworkManager.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 09/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Pokespeare_sdk

class SearchNetworkManager: SearchNetworkManagerProtocol {
    
    private let pokespeare = Pokespeare()
    
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
