//
//  SearchInteractor.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 09/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class SearchInteractor {

	fileprivate let networkManager: SearchNetworkManagerProtocol
    weak var output: SearchInteractorOutput?
    
    private var searchResult = SearchResult()

    init(networkManager: SearchNetworkManagerProtocol = SearchNetworkManager()){
        self.networkManager = networkManager
    }
}

extension SearchInteractor: SearchInteractorProtocol {
    func search(pokemonWithName name: String) {
        searchResult.name = name
        networkManager.fetchDescription(forPokemonWithName: searchResult.name) { [weak self] (description, error) in
            guard let self = self else { return }
            if let error = error {
                NSLog(error.localizedDescription)
                self.output?.handle(searchError: SearchError(.noDescription))
            } else {
                guard let description = description else {
                    self.output?.handle(searchError: SearchError(.noDescription))
                    return
                }
                self.searchResult.description = description
                self.fetchSprite()
            }
        }
        
    }
}

// MARK: - Internal Utils
extension SearchInteractor {
    private func fetchSprite() {
        networkManager.fetchSprite(forPokemonWithName: searchResult.name) { [weak self] (sprite, error) in
            guard let self = self else { return }
            if let error = error {
                NSLog(error.localizedDescription)
                self.output?.handle(searchError: SearchError(.noSprite))
            } else {
                guard let sprite = sprite else {
                    self.output?.handle(searchError: SearchError(.noSprite))
                    return
                }
                self.searchResult.sprite = sprite
                self.output?.handle(searchResult: self.searchResult)
            }
        }
    }
}

