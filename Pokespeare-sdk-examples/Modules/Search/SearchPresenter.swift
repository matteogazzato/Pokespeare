//
//  SearchPresenter.swift
//  Pokespeare-sdk
//
//  Created Matteo Gazzato on 09/02/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class SearchPresenter: SearchDataProvider {

    fileprivate weak var view: SearchViewProtocol?
    fileprivate let interactor: SearchInteractorProtocol
    fileprivate let wireframe: SearchWireframeProtocol
    
    init(view: SearchViewProtocol,
         interactor: SearchInteractorProtocol,
         wireframe: SearchWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    // MARK: - SearchDataProvider
    // All data provider properties defined
    
    // MARK: - Internal Utils
    // All internal methods not defined in any protocol
    
}

// MARK: - SearchEventHandler
extension SearchPresenter: SearchEventHandler {
    func onSearch(_ name: String?) {
        guard let name = name else {
            view?.showError(withMessage: SearchError(.emptySearch).message)
            return
        }
        // TODO: handle search
    }
    
    func onViewDidLoad() {
        // Add onViewDidLoad implementation
    }
    
    func onDismiss() {
        guard let vc = view else { return }
        wireframe.dismiss(vc)
    }
}

// MARK: - SearchInteractorOutput
extension SearchPresenter: SearchInteractorOutput {
    // Add SearchInteractorOutput implementation
}
