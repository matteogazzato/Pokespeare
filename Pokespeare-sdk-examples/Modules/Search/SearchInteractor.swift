//
//  SearchInteractor.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 09/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class SearchInteractor {

	fileprivate let networkManager: SearchNetworkManagerProtocol
    weak var output: SearchInteractorOutput?

    init(networkManager: SearchNetworkManagerProtocol = SearchNetworkManager()){
        self.networkManager = networkManager
    }
}

extension SearchInteractor: SearchInteractorProtocol {
    // Add NextLaunchesInteractorProtocol implementation
}
