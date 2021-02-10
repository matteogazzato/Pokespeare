//
//  PokemonInfoWireframe.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 10/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PokemonInfoWireframe {
    private let nibName = "PokemonInfo"
}

extension PokemonInfoWireframe: PokemonInfoWireframeProtocol {
    func module() -> PokemonInfoViewController {
        let vc = PokemonInfoViewController(nibName: nibName, bundle: nil)

        let interactor = PokemonInfoInteractor()
        let presenter = PokemonInfoPresenter(view: vc, interactor: interactor, wireframe: self)
        vc.eventHandler = presenter
        vc.dataProvider = presenter

        interactor.output = presenter
        return vc
    }
    
    // MARK: - PokemonInfoWireframeProtocol
    func dismiss(_ view: PokemonInfoViewProtocol) {
        // Add custom implementation to dismiss viewController
    }
}
