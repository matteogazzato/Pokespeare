//
//  FavouritesPresenter.swift
//  PokespeareSDK
//
//  Created Matteo Gazzato on 10/02/21.
//  Copyright © 2021 Matteo Gazzato. All rights reserved.
//

import Foundation

class FavouritesPresenter: FavouritesDataProvider {

    fileprivate weak var view: FavouritesViewProtocol?
    fileprivate let interactor: FavouritesInteractorProtocol
    fileprivate let wireframe: FavouritesWireframeProtocol
    
    init(view: FavouritesViewProtocol,
         interactor: FavouritesInteractorProtocol,
         wireframe: FavouritesWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    // MARK: - FavouritesDataProvider
    var favs: [Pokemon] = []
    
    // MARK: - Internal Utils
    // All internal methods not defined in any protocol
    
}

// MARK: - FavouritesEventHandler
extension FavouritesPresenter: FavouritesEventHandler {
    func onViewDidLoad() {
        // Add onViewDidLoad implementation
    }
    
    func onViewDidAppear() {
        interactor.retrieveFavs()
    }
    
    func onDismiss() {
        guard let vc = view else { return }
        wireframe.dismiss(vc)
    }
    
    func onFavouriteSelected(atIndex index: Int) {
        let pokemon = favs[index]
        let pokemonInfoVc = PokemonInfoWireframe().module(withDelegate: self)
        pokemonInfoVc.dataProvider?.pokemon = pokemon
        guard let vc = self.view as? FavouritesViewController else { return }
        wireframe.present(pokemonInfoViewController: pokemonInfoVc, fromViewController: vc)
    }
}

// MARK: - FavouritesInteractorOutput
extension FavouritesPresenter: FavouritesInteractorOutput {
    func onFavsRetrieved(_ favs: [Pokemon]) {
        self.favs = favs
        view?.updateUI()
    }
}

// MARK: - PokemonInfoDelegate
extension FavouritesPresenter: PokemonInfoDelegate {
    func onPokemonInfoDismissed() {
        interactor.retrieveFavs()
    }
}
