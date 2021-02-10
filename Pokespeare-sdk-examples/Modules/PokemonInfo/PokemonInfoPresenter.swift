//
//  PokemonInfoPresenter.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 10/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class PokemonInfoPresenter: PokemonInfoDataProvider {

    fileprivate weak var view: PokemonInfoViewProtocol?
    fileprivate let interactor: PokemonInfoInteractorProtocol
    fileprivate let wireframe: PokemonInfoWireframeProtocol
        
    init(view: PokemonInfoViewProtocol,
         interactor: PokemonInfoInteractorProtocol,
         wireframe: PokemonInfoWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    // MARK: - PokemonInfoDataProvider
    var pokemon: Pokemon = Pokemon()
    
    // MARK: - Internal Utils
    // All internal methods not defined in any protocol
    
}

// MARK: - PokemonInfoEventHandler
extension PokemonInfoPresenter: PokemonInfoEventHandler {
    func onViewDidLoad() {
        pokemon.favourite = interactor.pokemonIsInFavs(pokemon)
        view?.updateUI()
    }
    
    func onDismiss() {
        guard let vc = view else { return }
        wireframe.dismiss(vc)
    }
    
    func onAddRemoveFromFavs() {
        interactor.pokemon(pokemon, shouldBeInFavs: !pokemon.favourite)
        pokemon.favourite = !pokemon.favourite
        view?.updateUI()
    }
}

// MARK: - PokemonInfoInteractorOutput
extension PokemonInfoPresenter: PokemonInfoInteractorOutput {
    // Add PokemonInfoInteractorOutput implementation
}
