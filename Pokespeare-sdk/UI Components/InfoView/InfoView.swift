//
//  InfoView.swift
//  Pokespeare-sdk
//
//  Created by Matteo Gazzato on 09/02/21.
//

import UIKit
import Kingfisher

/// Exposed built-in UIView useful to display Shakespearean pokemon description and sprite
public class InfoView: CustomView {

    @IBOutlet weak var spriteImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    override public func setupUI() {
        self.descriptionTextView.textColor = .black
        self.backgroundColor = .red
    }
}

// MARK: - External Utils
extension InfoView {
    /// Exposed method to correctly update view with descriptor information
    /// - Parameter desc: InfoViewDescriptor with all necessary properties used to
    /// populate view
    public func updateUI(withDescriptor desc: InfoViewDescriptor) {
        nameLabel?.text = desc.name
        descriptionTextView?.text = desc.description
        spriteImageView.kf.setImage(with: URL(string: desc.sprite))
    }
}
