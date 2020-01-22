//
//  ViewController.swift
//  CollectionViewButtons
//
//  Created by Wouter Willebrands on 21/01/2020.
//  Copyright © 2020 Studio Willebrands. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    /// Here we use a subclass of UIView as a background for the buttons.
    private lazy var buttonBarView: ButtonBar = {
        let buttonBarView = ButtonBar()
        return buttonBarView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemGreen
        
        setupButtonBar()
    }
    
    /// Here we set up the constraints for the button bar
    private func setupButtonBar() {
        view.addSubview(buttonBarView)
        
        NSLayoutConstraint.activate([
            buttonBarView.heightAnchor.constraint(equalToConstant: Configuration.buttonBarHeight),
            buttonBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
