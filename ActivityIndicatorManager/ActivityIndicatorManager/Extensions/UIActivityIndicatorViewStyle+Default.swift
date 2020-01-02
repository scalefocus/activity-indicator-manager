//
//  UIActivityIndicatorViewStyle+Default.swift
//  ActivityIndicatorManager
//
//  Created by Dimitar V. Petrov on 29.11.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView.Style {
    
    /// Provides default value to be used in `ActivityIndicatorManager` SDK.
    /// For iOS 13 and above: `.large`.
    /// For below iOS 13: `.whiteLarge`.
    static var `default`: UIActivityIndicatorView.Style {
        let activityIndicatorStyle: UIActivityIndicatorView.Style
        if #available(iOS 13.0, *) {
            activityIndicatorStyle = .large
        } else {
            activityIndicatorStyle = .whiteLarge
        }
        return activityIndicatorStyle
    }
    
}
