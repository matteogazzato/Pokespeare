//
//  PokemonInfoAPIClientTests.swift
//  Pokespeare-sdk-tests
//
//  Created by Matteo Gazzato on 03/02/21.
//

import XCTest
@testable import Pokespeare_sdk
import RxSwift
import RxCocoa

class PokemonInfoAPIClientTests: XCTestCase {
    
    let bag = DisposeBag()

    func testPokemonDescriptions() {
        let desc = PokemonInfoAPIDescriptor(name: "charizard")
        let descriptionExpectation = expectation(description: "Description received")
        PokemonInfoAPIClient.pokemonDescriptions(fromDescriptor: desc)
            .subscribe { response in
                XCTAssertFalse(response.flavorTextEntries.isEmpty)
                descriptionExpectation.fulfill()
            } onError: { error in
                XCTFail()
            }
            .disposed(by: bag)
        wait(for: [descriptionExpectation], timeout: 10.0)
    }
    
    func testPokemonSprites() {
        let desc = PokemonInfoAPIDescriptor(name: "mew")
        let spritesExpectation = expectation(description: "Sprites received")
        PokemonInfoAPIClient.pokemonSprites(fromDescriptor: desc)
            .subscribe { response in
                XCTAssertNotNil(response.sprites.frontDefault)
                spritesExpectation.fulfill()
            } onError: { _ in
                XCTFail()
            }
            .disposed(by: bag)
        wait(for: [spritesExpectation], timeout: 10.0)
    }
}
