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
        let descriptionExpectation = expectation(description: "Description received")
        Pokespeare().retrieveDescription(ofPokemon: name) { (description, error) in
            XCTAssertNil(error)
            let expectedTranslation = "Spits fire yond is hot enow to melt boulders. Known to cause forest fires unintentionally."
            XCTAssertEqual(description!, expectedTranslation)
            descriptionExpectation.fulfill()
        }
        wait(for: [descriptionExpectation], timeout: 20.0)
    }

}
