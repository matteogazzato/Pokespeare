//
//  ShakespeareAPIClientTests.swift
//  PokespeareSDK_Tests
//
//  Created by Matteo Gazzato on 04/02/21.
//

import XCTest
@testable import PokespeareSDK
import RxSwift
import RxCocoa


class ShakespeareAPIClientTests: XCTestCase {

    let disposeBag = DisposeBag()
    
    func testShakespeareanDescription() {
        let desc = ShakespeareAPIDescriptor(textToTranslate: "When the bulb on its back grows large, it appears\\fto lose the ability to stand on its hind legs")
        let expectedTranslation = "At which hour the bulb on its back grows large,  \'t appears\\fto loseth the ability to standeth on its hind forks"
        let descriptionExpectation = expectation(description: "Shakespearean translation received")
        ShakespeareAPIClient.shakespeareanDescription(fromDesc: desc)
            .subscribe { response in
                XCTAssertEqual(response.contents.sourceText, desc.textToTranslate)
                XCTAssertEqual(response.contents.translated, expectedTranslation)
                descriptionExpectation.fulfill()
            } onError: { _ in
                XCTFail()
            }
            .disposed(by: disposeBag)
        wait(for: [descriptionExpectation], timeout: 10.0)
    }
}
