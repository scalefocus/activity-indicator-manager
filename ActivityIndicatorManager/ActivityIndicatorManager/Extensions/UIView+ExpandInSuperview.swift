//
//  UIView+ExpandInSuperview.swift
//  ActivityIndicatorManager
//
//  Created by Dimitar V. Petrov on 21.11.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Centers `self` within `superview` by X and Y, and equalize the `width` and `height` attributes.
    func expand(in superview: UIView) {
        center(in: superview)
        
        heightAnchor.constraint(equalTo: superview.heightAnchor).isActive = true
        widthAnchor.constraint(equalTo: superview.widthAnchor).isActive = true
    }
    
    /// Centers `self` within `superview` by X and Y.
    func center(in superview: UIView) {
        superview.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
    
}
