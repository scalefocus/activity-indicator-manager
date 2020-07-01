//
//  AIMNativeTypeModel.swift
//  ActivityIndicatorManager
//
//  Created by Ivan Georgiev on 1.07.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import UIKit

/// Model that wraps all the functionalities and customisation of the Native Type of activity indicator
public struct AIMNativeTypeModel {
    
    var style: UIActivityIndicatorView.Style = AIMConstants.activityIndicatorStyle
    var color: UIColor? = nil
    var backgroundColor: UIColor? = AIMConstants.backgroundColor
    
    public init(style: UIActivityIndicatorView.Style = AIMConstants.activityIndicatorStyle,
                color: UIColor? = nil,
                backgroundColor: UIColor? = AIMConstants.backgroundColor) {
        self.style = style
        self.color = color
        self.backgroundColor = backgroundColor
    }
    
}
