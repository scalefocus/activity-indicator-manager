//
//  UIWindow+KeyWindow.swift
//  ActivityIndicatorManager
//
//  Created by Dimitar V. Petrov on 29.11.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import UIKit

extension UIWindow {
    
    /// Convenience property providing the application's key window if any.
    static var keyWindow: UIWindow? {
        let keyWindow: UIWindow?
        if #available(iOS 13.0, *) {
            keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        } else {
            keyWindow = UIApplication.shared.keyWindow
        }
        return keyWindow
    }
    
}
