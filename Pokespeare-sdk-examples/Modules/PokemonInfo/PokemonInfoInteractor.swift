//
//  PokemonInfoInteractor.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 10/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
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
    // Add NextLaunchesInteractorProtocol implementation
}
