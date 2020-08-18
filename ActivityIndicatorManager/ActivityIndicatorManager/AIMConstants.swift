//
//  AIMConstants.swift
//  ActivityIndicatorManager
//
//  Created by Dimitar V. Petrov on 21.11.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import UIKit

/// Struct with constants used in `AIMActivityIndicatorManager`, providing default values for some features.
public struct AIMConstants {
    
    /// The default `TimeInterval` to be used for enabled minimum loading time behaviour.
    public static let minimumLoadingTime: TimeInterval = 0.3
    
    /// The default `activityIndicator.backgroundColor` to be used. Effect is darkening the underneath content.
    public static let backgroundColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    
    /// The default `UIActivityIndicatorView.Style` to be used for creating new `activityIndicator` instance.
    /// For iOS 13 and above: `.large`.
    /// For below iOS 13`: .whiteLarge`.
    public static var activityIndicatorStyle: UIActivityIndicatorView.Style = .default
    
    /// The default `AIMActivityIndicatorType` to be used. Native activity indicator with configured layout.
    public static var defaultIndicatorType: AIMActivityIndicatorType = .native()
    
}
