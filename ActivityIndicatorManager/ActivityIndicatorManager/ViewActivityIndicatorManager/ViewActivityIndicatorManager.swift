//
//  ViewActivityIndicatorManager.swift
//  ActivityIndicatorManager
//
//  Created by Dimitar V. Petrov on 22.11.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import UIKit

/// Activity indicator managing behaviour related to `UIView`.
public protocol ViewActivityIndicatorManager {
    
    /// Creates activity indicator in view and start animating it.
    /// - Parameters:
    ///   - activityIndicatorStyle: The visual style of the progress indicator.
    ///   - view: Parent view that will hold the activity indicator.
    ///   - backgroundColor: The dim background color. Default is transparent dark color.
    func startActivityIndicator(_ activityIndicatorStyle: UIActivityIndicatorView.Style,
                                in view: UIView,
                                backgroundColor: UIColor)
    
    /// Removes activity indicator from view.
    /// - Parameter view: The parent view of the activity indicator.
    func stopActivityIndicator(in view: UIView)
    
}
