//
//  InfoViewTests.swift
//  Pokespeare-sdk-tests
//
//  Created by Matteo Gazzato on 09/02/21.
//

import XCTest
@testable import Pokespeare_sdk
import SnapshotTesting

class InfoViewTests: XCTestCase {
    
    let desc = InfoViewDescriptor(description: "Spits fire yond is hot enow to melt boulders. Known to cause forest fires unintentionally.",
                                         name: "Charizard",
                                         sprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png")
    
    func testInfoViewSetup() {
        let view = InfoView(frame: CGRect(x: 0.0, y: 0.0, width: 414.0, height: 896))
        view.updateUI(withDescriptor: self.desc)
        assertSnapshot(matching: view, as: .image)
    }
    
}
