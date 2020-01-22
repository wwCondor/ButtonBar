//
//  ButtonCell.swift
//  CollectionViewButtons
//
//  Created by Wouter Willebrands on 21/01/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class ButtonCell: CollectionViewCell {
    
    lazy var buttonIconContainer: UIImageView = {
        let buttonIconContainer = UIImageView()
        buttonIconContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonIconContainer.contentMode = .scaleAspectFit
        return buttonIconContainer
    }()
    
    override func setupView() {
        super.setupView()
        backgroundColor = UIColor.darkGray
        
        addSubview(buttonIconContainer)

        NSLayoutConstraint.activate([
            buttonIconContainer.heightAnchor.constraint(equalToConstant: Configuration.buttonIconContainerSize),
            buttonIconContainer.widthAnchor.constraint(equalToConstant: Configuration.buttonIconContainerSize),
            buttonIconContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonIconContainer.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

/// We create this subclass to ensure the DRY principle for if we would create multiple customised cells
/// Everything that is shared between all collectionViewCells can be put in here
class CollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() { }
}
