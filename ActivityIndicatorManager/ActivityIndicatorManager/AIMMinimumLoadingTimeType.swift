//
//  AIMMinimumLoadingTimeType.swift
//  ActivityIndicatorManager
//
//  Created by Dimitar V. Petrov on 22.11.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import Foundation

/// Enum related to minimum loading time behaviour of `AIMActivityIndicatorManager`.
public enum AIMMinimumLoadingTimeType {
    
    /// Minimum loading time is enabled with specific `TimeInterval`. (greater than 0)
    case enabled(TimeInterval)
    
    /// Minimum loading time is disabled.
    case disabled
    
}
