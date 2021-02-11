//
//  PokespeareTests.swift
//  PokespeareSDK_Tests
//
//  Created by Matteo Gazzato on 05/02/21.
//

import XCTest
@testable import PokespeareSDK

class PokespeareTests: XCTestCase {
    
    func testRetrieveDescription() throws {
        let name = "charizard"
        let descriptionExpectation = expectation(description: "Description received")
        let pokespeare = Pokespeare()
        pokespeare.retrieveDescription(ofPokemon: name) { (description, error) in
            XCTAssertNil(error)
            let expectedTranslation = "Spits fire yond is hot enow to melt boulders. Known to cause forest fires unintentionally."
            XCTAssertEqual(description!, expectedTranslation)
            descriptionExpectation.fulfill()
        }
        wait(for: [descriptionExpectation], timeout: 20.0)
    }
    
    func testRetrieveSprite() throws {
        let name = "mew"
        let spriteExpectation = expectation(description: "Sprite received")
        let pokespeare = Pokespeare()
        pokespeare.retrieveSprite(ofPokemon: name) { (spriteUrl, error) in
            XCTAssertNil(error)
            let expectedSpriteUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/151.png"
            XCTAssertEqual(spriteUrl!, expectedSpriteUrl)
            spriteExpectation.fulfill()
        }
        wait(for: [spriteExpectation], timeout: 20.0)
    }
    
}
