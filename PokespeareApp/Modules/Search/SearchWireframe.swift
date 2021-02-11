//
//  SearchWireframe.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 09/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SearchWireframe {
    private let nibName = "Search"
}

extension SearchWireframe: SearchWireframeProtocol {
    func module() -> SearchViewController {
        let vc = SearchViewController(nibName: nibName, bundle: nil)

        let interactor = SearchInteractor()
        let presenter = SearchPresenter(view: vc, interactor: interactor, wireframe: self)
        vc.eventHandler = presenter
        vc.dataProvider = presenter

        interactor.output = presenter
        return vc
    }
    
    // MARK: - SearchWireframeProtocol
    func dismiss(_ view: SearchViewProtocol) {
        // Add custom implementation to dismiss viewController
    }
    
    func present(pokemonInfoViewController pokemonInfoVc: PokemonInfoViewController, fromViewController vc: UIViewController) {
        let pokemonInfoNVc = UINavigationController(rootViewController: pokemonInfoVc)
        vc.present(pokemonInfoNVc, animated: true, completion: nil)
    }
    
    func present(favouritesViewController favouritesVc: FavouritesViewController, fromViewController vc: UIViewController) {
        vc.navigationController?.pushViewController(favouritesVc, animated: true)
    }
}
