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
    
    func fetchDescription(forPokemonWithName name: String, completion: @escaping (String?, Error?) -> Void) {
        pokespeare.retrieveDescription(ofPokemon: name) { (description, error) in
            completion(description, error)
        }
    }
    
    func fetchSprite(forPokemonWithName name: String, completion: @escaping (String?, Error?) -> Void) {
        pokespeare.retrieveSprite(ofPokemon: name) { (sprite, error) in
            completion(sprite, error)
        }
    }
}
