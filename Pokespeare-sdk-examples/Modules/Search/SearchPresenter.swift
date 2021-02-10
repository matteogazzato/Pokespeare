//
//  SearchPresenter.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 09/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class SearchPresenter: SearchDataProvider {

    fileprivate weak var view: SearchViewProtocol?
    fileprivate let interactor: SearchInteractorProtocol
    fileprivate let wireframe: SearchWireframeProtocol
    
    init(view: SearchViewProtocol,
         interactor: SearchInteractorProtocol,
         wireframe: SearchWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    // MARK: - SearchDataProvider
    // All data provider properties defined
    
    // MARK: - Internal Utils
    // All internal methods not defined in any protocol
    
}

// MARK: - SearchEventHandler
extension SearchPresenter: SearchEventHandler {
    func onSearch(_ name: String?) {
        guard let name = name,
              !name.isEmpty else {
            view?.showError(withMessage: SearchError(.emptySearch).message)
            return
        }
        interactor.search(pokemonWithName: name)
    }
    
    func onViewDidLoad() {
        // Add onViewDidLoad implementation
    }
    
    func onDismiss() {
        guard let vc = view else { return }
        wireframe.dismiss(vc)
    }
    
    func onShowFavourites() {
        let favsVc = FavouritesWireframe().module()
        guard let vc = self.view as? SearchViewController else { return }
        wireframe.present(favouritesViewController: favsVc, fromViewController: vc)
    }
}

// MARK: - SearchInteractorOutput
extension SearchPresenter: SearchInteractorOutput {
    func handle(searchError error: SearchError) {
        view?.showError(withMessage: error.message)
    }
    
    func handle(searchResult result: Pokemon) {
        let pokemonInfoVc = PokemonInfoWireframe().module()
        pokemonInfoVc.dataProvider?.pokemon = result
        guard let vc = self.view as? SearchViewController else { return }
        wireframe.present(pokemonInfoViewController: pokemonInfoVc, fromViewController: vc)
    }
}
