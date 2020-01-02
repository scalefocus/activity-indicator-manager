//
//  WindowLoaderViewController.swift
//  ActivityIndicatorManagerDemo
//
//  Created by Dimitar V. Petrov on 25.11.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import UIKit
import ActivityIndicatorManager

class WindowLoaderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AIMActivityIndicatorManager.setup(minimumLoadingTimeType: .enabled(0.5))
    }

    @IBAction func didTapOnSlowLoadButton(_ sender: Any) {
        AIMActivityIndicatorManager.sharedInstance.shouldShowIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            AIMActivityIndicatorManager.sharedInstance.shouldHideIndicator()
        }
    }
    
    @IBAction func didTapOnFastLoadButton(_ sender: Any) {
        AIMActivityIndicatorManager.sharedInstance.shouldShowIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            AIMActivityIndicatorManager.sharedInstance.shouldHideIndicator()
        }
    }
    
}
