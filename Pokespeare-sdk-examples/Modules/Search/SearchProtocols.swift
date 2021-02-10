//
//  SearchProtocols.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 09/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewProtocol: AnyObject {
	func updateUI()
    func showError(withMessage message: String)
}

protocol SearchInteractorProtocol: AnyObject {
    func search(pokemonWithName name: String)
}

protocol SearchWireframeProtocol: AnyObject {
	func module() -> SearchViewController
    func dismiss(_ vc: SearchViewProtocol)
    func present(pokemonInfoViewController pokemonInfoVc: PokemonInfoViewController, fromViewController vc: UIViewController)
}

protocol SearchEventHandler: AnyObject {
    func onViewDidLoad()
    func onDismiss()
    
    func onSearch(_ name: String?)
}

protocol SearchDataProvider: AnyObject {
    // Add SearchDataProvider definition
}

protocol SearchInteractorOutput: AnyObject {
    func handle(searchError error: SearchError)
    func handle(searchResult result: Pokemon)
}

protocol SearchDelegate: AnyObject {
    // Add SearchDelegate definition
}

protocol SearchNetworkManagerProtocol: AnyObject {
    func fetchDescription(forPokemonWithName name: String, completion: @escaping (_ description: String?, _ error: SearchError?) -> Void)
    func fetchSprite(forPokemonWithName name: String, completion: @escaping (_ description: String?, _ error: SearchError?) -> Void)
}
