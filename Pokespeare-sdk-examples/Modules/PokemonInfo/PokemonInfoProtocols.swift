//
//  PokemonInfoProtocols.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 10/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol PokemonInfoViewProtocol: AnyObject {
	func updateUI()
}

protocol PokemonInfoInteractorProtocol: AnyObject {
    // Add PokemonInfoInteractorProtocol definition
}

protocol PokemonInfoWireframeProtocol: AnyObject {
    func module() -> PokemonInfoViewController
    func dismiss(_ vc: PokemonInfoViewProtocol)
}

protocol PokemonInfoEventHandler: AnyObject {
    func onViewDidLoad()
    func onDismiss()
    func onAddRemoveFromFavs()
}

protocol PokemonInfoDataProvider: AnyObject {
    var pokemon: Pokemon { get set }
}

protocol PokemonInfoInteractorOutput: AnyObject {
    // Add PokemonInfoInteractorOutput definition
}

protocol PokemonInfoDelegate: AnyObject {
    // Add PokemonInfoDelegate definition
}

protocol PokemonInfoNetworkManagerProtocol: AnyObject {
    // Add PokemonInfoNetworkManagerProtocol definition
}
