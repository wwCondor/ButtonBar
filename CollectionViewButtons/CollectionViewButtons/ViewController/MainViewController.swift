//
//  ViewController.swift
//  CollectionViewButtons
//
//  Created by Wouter Willebrands on 21/01/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var buttonBarView: ButtonBar = {
        let buttonBarView = ButtonBar()
        return buttonBarView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        
        setupButtonBar()
    }
    
    private func setupButtonBar() {
        view.addSubview(buttonBarView)
        
        NSLayoutConstraint.activate([
            buttonBarView.heightAnchor.constraint(equalToConstant: 60),
            buttonBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

