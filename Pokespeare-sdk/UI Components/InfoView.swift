//
//  InfoView.swift
//  Pokespeare-sdk
//
//  Created by Matteo Gazzato on 09/02/21.
//

import UIKit

class InfoView: CustomView {

    @IBOutlet weak var spriteImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
}

// MARK: - External Utils
extension InfoView {
    public func updateUI(withDescriptor desc: InfoViewDescriptor) {
        nameLabel?.text = desc.name
        descriptionTextView?.text = desc.description
    }
}
