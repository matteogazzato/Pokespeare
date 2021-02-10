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
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissVc))
    }
    
    @objc
    private func dismissVc() {
        eventHandler?.onDismiss()
    }
    
    @objc
    private func addRemoveFromFavs() {
        eventHandler?.onAddRemoveFromFavs()
    }

    // MARK: - Actions
    // Place here possible IBActions
}

extension PokemonInfoViewController: PokemonInfoViewProtocol {
    func updateUI() {
        guard let pokemon = dataProvider?.pokemon else { return }
        let image = pokemon.favourite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(addRemoveFromFavs))
        if containerView.subviews.isEmpty {
            let infoDesc = InfoViewDescriptor(description: pokemon.description, name: pokemon.name, sprite: pokemon.sprite)
            let infoView = InfoView(frame: containerView.frame)
            infoView.updateUI(withDescriptor: infoDesc)
            containerView.addSubview(infoView)
        }
    }
}
