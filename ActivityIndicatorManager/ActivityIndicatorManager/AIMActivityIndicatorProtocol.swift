//
//  AIMActivityIndicatorProtocol.swift
//  ActivityIndicatorManager
//
//  Created by Ivan Georgiev on 1.07.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import UIKit

/// Protocol related with the actions of the `AIMActivityIndicator`
public protocol AIMActivityIndicatorProtocol: UIView {
    
    /// Starts the loading indicator
    func startAnimating()
    
    /// Stops the loading indicator
    func stopAnimating()
    
}

extension UIActivityIndicatorView: AIMActivityIndicatorProtocol {}
