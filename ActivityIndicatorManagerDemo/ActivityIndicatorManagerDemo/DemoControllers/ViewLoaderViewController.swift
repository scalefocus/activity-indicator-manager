//
//  ViewLoaderViewController.swift
//  ActivityIndicatorManagerDemo
//
//  Created by Dimitar V. Petrov on 27.11.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import UIKit
import ActivityIndicatorManager

class ViewLoaderViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        AIMActivityIndicatorManager.setup()
    }

    @IBAction func didTapOnStartLoadingWithColorButton(_ sender: Any) {
        AIMActivityIndicatorManager.sharedInstance.stopActivityIndicator(in: containerView)
        AIMActivityIndicatorManager.sharedInstance.startActivityIndicator(in: containerView)
    }
    @IBAction func didTapOnStartLoadingWithoutColorButton(_ sender: Any) {
        AIMActivityIndicatorManager.sharedInstance.stopActivityIndicator(in: containerView)
        AIMActivityIndicatorManager.sharedInstance.startActivityIndicator(.whiteLarge, in: containerView, backgroundColor: .clear)
    }
    
    @IBAction func didTapOnStopLoadingButton(_ sender: Any) {
        AIMActivityIndicatorManager.sharedInstance.stopActivityIndicator(in: containerView)
    }
    
}
