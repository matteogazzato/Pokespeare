//
//  SearchViewController.swift
//  PokespeareSDK
//
//  Created Matteo Gazzato on 09/02/21.
//  Copyright © 2021 Matteo Gazzato. All rights reserved.
//

import UIKit
import JGProgressHUD

class SearchViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var searchButton: UIButton!
    
    var eventHandler: SearchEventHandler?
    var dataProvider: SearchDataProvider?
    
    private let hud = JGProgressHUD()

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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showFavourites))
    }
    
    @objc
    private func showFavourites() {
        hud.dismiss()
        eventHandler?.onShowFavourites()
    }

    // MARK: - Actions
    @IBAction func search(_ sender: Any) {
        hud.show(in: self.view)
        eventHandler?.onSearch(searchTextField.text)
    }
}

extension SearchViewController: SearchViewProtocol {
    func updateUI() {
        // update UI elements here
        hud.dismiss()
    }
    
    func showError(withMessage message: String) {
        hud.dismiss()
        let alert = UIAlertController(title: "Warning",
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
