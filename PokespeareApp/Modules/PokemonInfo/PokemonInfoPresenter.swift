//
//  PokemonInfoPresenter.swift
//  PokespeareSDK
//
//  Created Matteo Gazzato on 10/02/21.
//  Copyright © 2021 Matteo Gazzato. All rights reserved.
//

import Foundation

class PokemonInfoPresenter: PokemonInfoDataProvider {

    fileprivate weak var view: PokemonInfoViewProtocol?
    fileprivate let interactor: PokemonInfoInteractorProtocol
    fileprivate let wireframe: PokemonInfoWireframeProtocol
    fileprivate weak var delegate: PokemonInfoDelegate?
        
    init(view: PokemonInfoViewProtocol,
         interactor: PokemonInfoInteractorProtocol,
         wireframe: PokemonInfoWireframeProtocol,
         delegate: PokemonInfoDelegate?) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.delegate = delegate
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
        delegate?.onPokemonInfoDismissed()
        wireframe.dismiss(vc)
    }
    
    func onViewWillDisappear() {
        delegate?.onPokemonInfoDismissed()
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
