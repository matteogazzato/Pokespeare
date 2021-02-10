//
//  PokemonInfoViewController.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 10/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Pokespeare_sdk

class PokemonInfoViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView!

    var eventHandler: PokemonInfoEventHandler?
    var dataProvider: PokemonInfoDataProvider?
    
    // MARK: - UI Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.eventHandler?.onViewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Internal Utils
    fileprivate func setupUI() {
        // setup UI elements here
        
    }

    // MARK: - Actions
    // Place here possible IBActions
}

extension PokemonInfoViewController: PokemonInfoViewProtocol {
    func updateUI() {
        guard let desc = dataProvider?.pokemon else { return }
        let infoDesc = InfoViewDescriptor(description: desc.description, name: desc.name, sprite: desc.sprite)
        let infoView = InfoView(frame: containerView.frame)
        infoView.updateUI(withDescriptor: infoDesc)
        containerView.addSubview(infoView)
    }
}
