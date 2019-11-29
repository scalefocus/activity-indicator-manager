//
//  WindowActivityIndicatorManager.swift
//  ActivityIndicatorManager
//
//  Created by Dimitar V. Petrov on 22.11.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import Foundation

/// Activity indicator managing behaviour related to `UIWindiw`.
public protocol WindowActivityIndicatorManager {
    
    /// Checks wether activity indicator is being shown in window.
    var isIndicatorShown: Bool { get }
    
    /// Increments the number of observers and blocks the UI if needed.
    func shouldShowIndicator()
    
    /// Decrements the number of observers and unblocks the UI if needed.
    func shouldHideIndicator()
    
    /// Unconditionally removes all observers and unblocks the UI.
    func forceHideIndicator()
    
}
