//
//  ButtonBar.swift
//  CollectionViewButtons
//
//  Created by Wouter Willebrands on 21/01/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

/// The reason I use a UIView as a base on which I build the collectionView is because it allows to easily add other objects.
/// For example: a UIImageView for a small logo at the top of the buttonBar.
class ButtonBar: UIView {
    let cellId = "buttonCellId"
    
    let imageNames: [UIImage.Name] = [.settingsIcon, .chatIcon, .profileIcon]
    
    /// Without the extension for UIImage the array above would look like this
//    let images: [UIImage] = [UIImage(named: .settingsIcon), UIImage(named: .chatIcon), UIImage(named: .profileIcon)]

    lazy var buttonBarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let buttonBarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        buttonBarCollectionView.backgroundColor = UIColor.clear
        buttonBarCollectionView.register(ButtonCell.self, forCellWithReuseIdentifier: cellId)
        buttonBarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        buttonBarCollectionView.dataSource = self
        buttonBarCollectionView.delegate = self
        return buttonBarCollectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupButtonBar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupButtonBar()
    }
    
    /// We set the translatesAutoresizingMaskIntoConstraints to false since this is built in code
    /// In storyboard this will be done for you automatically
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
    }
    
    private func setupButtonBar() {
        addSubview(buttonBarCollectionView)
        
        NSLayoutConstraint.activate([
            buttonBarCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonBarCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonBarCollectionView.topAnchor.constraint(equalTo: topAnchor),
            buttonBarCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension ButtonBar: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    /// Sets number buttons (cells) inside the menubar
    /// By using .count all we need to do to add images to the image array (imageNames)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    /// Sets up cell content
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ButtonCell
        cell.buttonIconContainer.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysOriginal)
        
        /// In order to change your prefferably monochrome to a different color, first make sure you have icons with a transparent background
        /// Next switch the renderingMode to .alwaysTemplate - this renders a new color layer on the non-transparent parts of your image
        /// Finally set the tintColor too you favourite color
//        cell.buttonIconContainer.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
//        cell.buttonIconContainer.tintColor = UIColor.systemOrange
        return cell
    }
    
    /// Sets up size of the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfcells: CGFloat = CGFloat(imageNames.count)
        return CGSize(width: frame.width/numberOfcells, height: frame.height)
    }
    
    /// Sets up spacing between cells
    /// Make sure to use this, otherwise some cells will be pushed to another row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    /// Sets up what to do when a cell gets tapped
    /// In here you could trigger all kinds of methods using the indexPath of the cell.
    /// For example handle a slide in menu or navigate to a viewController
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(imageNames[indexPath.item])
        switch indexPath.item {
        case 0: print("0")
        case 1: print("1")
        case 2: print("2")
        default:
            print(indexPath.item)
        }
    }
}
