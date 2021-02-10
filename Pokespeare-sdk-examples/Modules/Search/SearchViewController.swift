//
//  SearchViewController.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 09/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    var eventHandler: SearchEventHandler?
    var dataProvider: SearchDataProvider?

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
    @IBAction func search(_ sender: Any) {
        eventHandler?.onSearch(searchTextField.text)
    }
}

extension SearchViewController: SearchViewProtocol {
    func updateUI() {
        // update UI elements here
    }
    
    func showError(withMessage message: String) {
        let alert = UIAlertController(title: "Warning",
                                      message: message,
                                      preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
}
