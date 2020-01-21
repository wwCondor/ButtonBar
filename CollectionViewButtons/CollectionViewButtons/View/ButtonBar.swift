//
//  ButtonBar.swift
//  CollectionViewButtons
//
//  Created by Wouter Willebrands on 21/01/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class ButtonBar: UIView {
    let cellId = "buttonCellId"
    
    let imageNames: [UIImage.Name] = [.settingsIcon, .chatIcon, .profileIcon]

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
        setupControlBar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupControlBar()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
    }
    
    private func setupControlBar() {
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    /// Sets up cell content
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ButtonCell
        cell.buttonIconContainer.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysOriginal)
        return cell
    }
    
    /// Sets up size of the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfcells: CGFloat = CGFloat(imageNames.count)
        return CGSize(width: frame.width/numberOfcells, height: frame.height)
    }
    
    /// Sets up spacing between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    /// Sets up what to do when a cell gets tapped
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(imageNames[indexPath.item])
//        switch indexPath.item {
//        case 0: print("0")
//        case 1: print("1")
//        case 2: print("2")
//        default:
//            print(indexPath.item)
//        }
    }
}
