//
//  CustomWindowLoaderViewController.swift
//  ActivityIndicatorManagerDemo
//
//  Created by Dimitar V. Petrov on 29.11.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import UIKit
import ActivityIndicatorManager

class CustomWindowLoaderViewController: UIViewController {

    let loadingIndicatorWindow = UIWindow(frame: UIScreen.main.bounds)
    var currentWindow: UIWindow! {
        didSet {
            if #available(iOS 13.0, *) {
                loadingIndicatorWindow.windowScene = currentWindow.windowScene
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AIMActivityIndicatorManager.setup(withWindow: loadingIndicatorWindow)
        currentWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
    }

    @IBAction func didTapOnStartLoadingButton(_ sender: Any) {
        AIMActivityIndicatorManager.sharedInstance.shouldShowIndicator()
        loadingIndicatorWindow.makeKeyAndVisible()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            self?.currentWindow.makeKeyAndVisible()
            AIMActivityIndicatorManager.sharedInstance.shouldHideIndicator()
        }
    }
    
}
