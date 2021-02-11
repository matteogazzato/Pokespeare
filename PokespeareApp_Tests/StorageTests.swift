//
//  StorageTests.swift
//  Pokespeare-sdk-examples-tests
//
//  Created by Matteo Gazzato on 10/02/21.
//

import XCTest
@testable import PokespeareApp

class StorageTests: XCTestCase {

    override func setUpWithError() throws {
        Storage.initialize()
    }
    
    override func tearDown() {
        Storage.initialize()
    }

    func testAddPokemonToFavs() throws {
        let pokemon = Pokemon(name: "PokemonName", description: "PokemonDescription", sprite: "PokemonSprite")
        XCTAssertTrue(Storage.addToFavourites(pokemon))
    }
    
    func testRemovePokemonFromFavs() throws {
        let pokemon = Pokemon(name: "PokemonName", description: "PokemonDescription", sprite: "PokemonSprite")
        _ = Storage.addToFavourites(pokemon)
        XCTAssertTrue(Storage.removeFromFavourites(pokemon))
    }
    
    func testGetAllPokemonFavs() throws {
        let pokemon = Pokemon(name: "PokemonName", description: "PokemonDescription", sprite: "PokemonSprite")
        _ = Storage.addToFavourites(pokemon)
        XCTAssertEqual(Storage.getAllFavourites().count, 1)
    }
    
    func testChecIfInFavs() throws {
        let pokemon = Pokemon(name: "PokemonName", description: "PokemonDescription", sprite: "PokemonSprite")
        _ = Storage.addToFavourites(pokemon)
        XCTAssertTrue(Storage.checkIfInFavourites(pokemon))
    }
}
