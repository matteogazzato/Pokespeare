//
//  PokemonInfoInteractor.swift
//  PokespeareSDK
//
//  Created Matteo Gazzato on 10/02/21.
//  Copyright © 2021 Matteo Gazzato. All rights reserved.
//

import Foundation

class PokemonInfoInteractor {
    
    fileprivate let networkManager: PokemonInfoNetworkManagerProtocol
    weak var output: PokemonInfoInteractorOutput?
    
    init(networkManager: PokemonInfoNetworkManagerProtocol = PokemonInfoNetworkManager()){
        self.networkManager = networkManager
    }
}

extension PokemonInfoInteractor: PokemonInfoInteractorProtocol {
    func pokemonIsInFavs(_ pokemon: Pokemon) -> Bool {
        return Storage.checkIfInFavourites(pokemon)
    }
    
    func pokemon(_ pokemon: Pokemon, shouldBeInFavs value: Bool) {
        if value {
            Storage.addToFavourites(pokemon)
        } else {
            Storage.removeFromFavourites(pokemon)
        }
    }
}
