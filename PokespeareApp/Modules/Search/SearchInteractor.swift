//
//  SearchInteractor.swift
//  PokespeareSDK
//
//  Created Matteo Gazzato on 09/02/21.
//  Copyright © 2021 Matteo Gazzato. All rights reserved.
//

import Foundation

class SearchInteractor {
    
    fileprivate let networkManager: SearchNetworkManagerProtocol
    weak var output: SearchInteractorOutput?
    
    private var pokemonSearchResult = Pokemon()
    
    init(networkManager: SearchNetworkManagerProtocol = SearchNetworkManager()){
        self.networkManager = networkManager
    }
}

extension SearchInteractor: SearchInteractorProtocol {
    func search(pokemonWithName name: String) {
        pokemonSearchResult.name = name
        networkManager.fetchDescription(forPokemonWithName: pokemonSearchResult.name) { [weak self] (description, error) in
            guard let self = self else { return }
            if let error = error {
                NSLog(error.localizedDescription)
                self.output?.handle(searchError: error)
            } else {
                guard let description = description else {
                    self.output?.handle(searchError: SearchError(.noDescription))
                    return
                }
                self.pokemonSearchResult.description = description
                self.fetchSprite()
            }
        }
    }
}

// MARK: - Internal Utils
extension SearchInteractor {
    private func fetchSprite() {
        networkManager.fetchSprite(forPokemonWithName: pokemonSearchResult.name) { [weak self] (sprite, error) in
            guard let self = self else { return }
            if let error = error {
                self.output?.handle(searchError: error)
            } else {
                guard let sprite = sprite else {
                    self.output?.handle(searchError: SearchError(.noSprite))
                    return
                }
                self.pokemonSearchResult.sprite = sprite
                self.output?.handle(searchResult: self.pokemonSearchResult)
            }
        }
    }
}

