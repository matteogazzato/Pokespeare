//
//  CustomView.swift
//  Pokespeare-sdk
//
//  Created by Matteo Gazzato on 09/02/21.
//

import UIKit

/// Loadable UIView subclass (BTCCustomView should be always subclassed)
class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
        setupUI()
    }

    public func setupUI() { }
}

