//
//  AIMActivityIndicatorType.swift
//  ActivityIndicatorManager
//
//  Created by Ivan Georgiev on 1.07.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import Foundation

/// Enum related to the type  of `AIMActivityIndicatorManager`.
public enum AIMActivityIndicatorType {
    
    /// Native loading indicator
    /// - Parameters:
    /// - Parameter model: The model which wraps all the UI changes on the native loading indicator
    case native(model: AIMNativeTypeModel = AIMNativeTypeModel())
    
    /// Custom loading indicator which accepts
    /// - Parameters:
    /// - Parameter customView: The view that is going to be shown when user starts the indicator
    case custom(customView: AIMActivityIndicatorProtocol)
    
}
