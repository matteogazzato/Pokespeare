//
//  PokemonInfoProtocols.swift
//  PokespeareSDK
//
//  Created Matteo Gazzato on 10/02/21.
//  Copyright © 2021 Matteo Gazzato. All rights reserved.
//

import Foundation

protocol PokemonInfoViewProtocol: AnyObject {
	func updateUI()
}

protocol PokemonInfoInteractorProtocol: AnyObject {
    func pokemonIsInFavs(_ pokemon: Pokemon) -> Bool
    func pokemon(_ pokemon: Pokemon, shouldBeInFavs value: Bool)
}

protocol PokemonInfoWireframeProtocol: AnyObject {
    func module(withDelegate delegate: PokemonInfoDelegate?) -> PokemonInfoViewController
    func dismiss(_ vc: PokemonInfoViewProtocol)
}

protocol PokemonInfoEventHandler: AnyObject {
    func onViewDidLoad()
    func onViewWillDisappear()
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
    func onPokemonInfoDismissed()
}

protocol PokemonInfoNetworkManagerProtocol: AnyObject {
    // Add PokemonInfoNetworkManagerProtocol definition
}
