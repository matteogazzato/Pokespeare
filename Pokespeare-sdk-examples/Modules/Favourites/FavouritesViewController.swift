//
//  FavouritesViewController.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 10/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var eventHandler: FavouritesEventHandler?
    var dataProvider: FavouritesDataProvider?
    
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
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Actions
    // Place here possible IBActions
}

extension FavouritesViewController: FavouritesViewProtocol {
    func updateUI() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate UITableViewDataSource
extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider?.favs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pokemon = dataProvider?.favs[indexPath.row] else {
            return UITableViewCell()
        }
        let cell = UITableViewCell()
        cell.textLabel?.text = pokemon.name
        return UITableViewCell()
    }
    
}
