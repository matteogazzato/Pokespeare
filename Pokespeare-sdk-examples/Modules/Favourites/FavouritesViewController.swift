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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        eventHandler?.onViewDidAppear()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Internal Utils
    fileprivate func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
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
        cell.textLabel?.textColor = .black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        eventHandler?.onFavouriteSelected(atIndex: indexPath.row)
    }
    
}
