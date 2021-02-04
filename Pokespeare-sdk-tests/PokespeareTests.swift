//
//  PokespeareTests.swift
//  Pokespeare-sdk-tests
//
//  Created by Matteo Gazzato on 05/02/21.
//

import XCTest
@testable import Pokespeare_sdk

class PokespeareTests: XCTestCase {

    func testRetrieveDescription() throws {
        let name = "charizard"
        Pokespeare().retrieveDescription(ofPokemon: name) { (description, error) in
            XCTAssertNil(error)
            let expectedTranslation = "At which hour the bulb on its back grows large,  \'t appears\\fto loseth the ability to standeth on its hind forks"
            XCTAssertEqual(description!, expectedTranslation)
        }
    }

}
