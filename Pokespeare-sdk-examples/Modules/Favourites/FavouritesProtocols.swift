//
//  FavouritesProtocols.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 10/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

protocol FavouritesViewProtocol: AnyObject {
	func updateUI()
}

protocol FavouritesInteractorProtocol: AnyObject {
    func retrieveFavs()
}

protocol FavouritesWireframeProtocol: AnyObject {
	func module() -> FavouritesViewController
    func dismiss(_ vc: FavouritesViewProtocol)
    func present(pokemonInfoViewController pokemonInfoVc: PokemonInfoViewController, fromViewController vc: UIViewController)
}

protocol FavouritesEventHandler: AnyObject {
    func onViewDidLoad()
    func onViewDidAppear()
    func onDismiss()
    func onFavouriteSelected(atIndex index: Int)
}

protocol FavouritesDataProvider: AnyObject {
    var favs: [Pokemon] { get set }
}

protocol FavouritesInteractorOutput: AnyObject {
    func onFavsRetrieved(_ favs: [Pokemon])
}

protocol FavouritesDelegate: AnyObject {
    // Add FavouritesDelegate definition
}

protocol FavouritesNetworkManagerProtocol: AnyObject {
    // Add FavouritesNetworkManagerProtocol definition
}
