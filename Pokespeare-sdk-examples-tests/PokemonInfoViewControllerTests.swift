//
//  PokemonInfoViewControllerTests.swift
//  Pokespeare-sdk-examples-tests
//
//  Created by Matteo Gazzato on 10/02/21.
//

import XCTest
@testable import Pokespeare_sdk_examples
import SnapshotTesting


class PokemonInfoViewControllerTests: XCTestCase {

    func testPokemonInfoNotInFavs() throws {
        let pokemon = Pokemon(name: "Charizard",
                              description: "Charizard description",
                              sprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png",
                              favourite: false)
        let vc = PokemonInfoWireframe().module()
        vc.dataProvider?.pokemon = pokemon
        vc.updateUI()
        assertSnapshot(matching: vc, as: .image)
    }
    
    func testSearch() throws {
        let vc = SearchWireframe().module()
        assertSnapshot(matching: vc, as: .image)
    }
    
    func testFavourites() throws {
        let pokemon = Pokemon(name: "Charizard",
                              description: "Charizard description",
                              sprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png",
                              favourite: false)
        let vc = FavouritesWireframe().module()
        vc.dataProvider?.favs = [pokemon]
        assertSnapshot(matching: vc, as: .image)
    }

}
