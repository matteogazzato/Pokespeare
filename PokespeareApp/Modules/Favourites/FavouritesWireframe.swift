//
//  FavouritesWireframe.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 10/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class FavouritesWireframe {
    private let nibName = "Favourites"
}

extension FavouritesWireframe: FavouritesWireframeProtocol {
    func module() -> FavouritesViewController {
        let vc = FavouritesViewController(nibName: nibName, bundle: nil)

        let interactor = FavouritesInteractor()
        let presenter = FavouritesPresenter(view: vc, interactor: interactor, wireframe: self)
        vc.eventHandler = presenter
        vc.dataProvider = presenter

        interactor.output = presenter
        return vc
    }
    
    // MARK: - FavouritesWireframeProtocol
    func dismiss(_ view: FavouritesViewProtocol) {
        // Add custom implementation to dismiss viewController
    }
    
    func present(pokemonInfoViewController pokemonInfoVc: PokemonInfoViewController, fromViewController vc: UIViewController) {
        let pokemonInfoNVc = UINavigationController(rootViewController: pokemonInfoVc)
        vc.present(pokemonInfoNVc, animated: true, completion: nil)
    }
}
