//
//  ButtonCell.swift
//  CollectionViewButtons
//
//  Created by Wouter Willebrands on 21/01/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class ButtonCell: CollectionViewCell {
    
    let buttonIconContainer: UIImageView = {
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
            buttonIconContainer.heightAnchor.constraint(equalToConstant: 30),
            buttonIconContainer.widthAnchor.constraint(equalToConstant: 30),
            buttonIconContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonIconContainer.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

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
