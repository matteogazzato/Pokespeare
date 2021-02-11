//
//  PokemonInfoWireframe.swift
//  PokespeareSDK
//
//  Created Matteo Gazzato on 10/02/21.
//  Copyright © 2021 Matteo Gazzato. All rights reserved.
//

import UIKit

class PokemonInfoWireframe {
    private let nibName = "PokemonInfo"
}

extension PokemonInfoWireframe: PokemonInfoWireframeProtocol {
    func module(withDelegate delegate: PokemonInfoDelegate? = nil) -> PokemonInfoViewController {
        let vc = PokemonInfoViewController(nibName: nibName, bundle: nil)

        let interactor = PokemonInfoInteractor()
        let presenter = PokemonInfoPresenter(view: vc, interactor: interactor, wireframe: self, delegate: delegate)
        vc.eventHandler = presenter
        vc.dataProvider = presenter

        interactor.output = presenter
        return vc
    }
    
    // MARK: - PokemonInfoWireframeProtocol
    func dismiss(_ view: PokemonInfoViewProtocol) {
        guard let vc = view as? PokemonInfoViewController else { return }
        vc.navigationController?.dismiss(animated: true, completion: nil)
    }
}
