//
//  LoaderConfigurationViewController.swift
//  ActivityIndicatorManagerDemo
//
//  Created by Dimitar V. Petrov on 27.11.19.
//  Copyright © 2019 Dimitar V. Petrov. All rights reserved.
//

import UIKit
import ActivityIndicatorManager

class LoaderConfigurationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AIMActivityIndicatorManager.setup(style: UIActivityIndicatorView.Style.whiteLarge,
                                          color: .purple,
                                          backgroundColor: UIColor(red: 0.9, green: 0.4, blue: 0.7, alpha: 0.4),
                                          minimumLoadingTimeType: .enabled(3))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        load()
    }
    
    @IBAction func didTapOnLoadAgainButton(_ sender: Any) {
        load()
    }
    
    func load() {
        AIMActivityIndicatorManager.sharedInstance.shouldShowIndicator()
        AIMActivityIndicatorManager.sharedInstance.shouldHideIndicator()
    }
    
}
