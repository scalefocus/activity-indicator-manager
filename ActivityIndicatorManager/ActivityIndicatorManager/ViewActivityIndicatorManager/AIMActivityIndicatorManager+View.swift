//
//  AIMActivityIndicatorManager+View.swift
//  ActivityIndicatorManager
//
//  Created by Dimitar V. Petrov on 22.11.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import UIKit

extension AIMActivityIndicatorManager: ViewActivityIndicatorManager {
    
    open func startActivityIndicator(_ activityIndicatorStyle: UIActivityIndicatorView.Style = AIMConstants.activityIndicatorStyle,
                                     in view: UIView,
                                     backgroundColor: UIColor = AIMConstants.backgroundColor) {
        
        //do NOT add second activityIndicator to view that already have subview activityIndicator
        guard !view.subviews.contains(where: { $0 is UIActivityIndicatorView }) else { return }
            
        //creates activity indicator and configure it
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = activityIndicatorStyle
        activityIndicator.backgroundColor = backgroundColor
        activityIndicator.startAnimating()
        
        //add the activity indicator in the view
        activityIndicator.expand(in: view)
    }
    
    open func stopActivityIndicator(in view: UIView) {
        view.subviews.first(where: { $0 is UIActivityIndicatorView })?.removeFromSuperview()
    }
    
}
