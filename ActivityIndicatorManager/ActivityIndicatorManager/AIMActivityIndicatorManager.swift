//
//  AIMActivityIndicatorManager.swift
//  ActivityIndicatorManager
//
//  Created by Dimitar V. Petrov on 20.11.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import UIKit

/// Single class handling logic with activity indicator management in `UIView`s and `UIWindow`s.
open class AIMActivityIndicatorManager {
    
    // MARK: - Setup
    
    /// Setups the blocking behaviour to be related to specific window.
    /// Application's `keyWindow` will be used if no window is provided.
    /// Also setups the activity indicator layout.
    /// - Parameter window: `UIWindow` to be used for activity indicator display.
    /// - Parameter style: The basic appearance of the activity indicator.
    /// - Parameter color: The color of the activity indicator.
    /// - Parameter backgroundColor: The background color of the activity indicator.
    /// - Parameter minimumLoadingTimeType: The minimum loading time behaviour type - enabled/disabled with minimum loading time interval specified.
    open class func setup(withWindow window: UIWindow? = nil,
                          style: UIActivityIndicatorView.Style = AIMConstants.activityIndicatorStyle,
                          color: UIColor? = nil,
                          backgroundColor: UIColor? = AIMConstants.backgroundColor,
                          minimumLoadingTimeType: AIMMinimumLoadingTimeType = .enabled(AIMConstants.minimumLoadingTime)) {
        sharedInstance.window = window
        sharedInstance.style = style
        sharedInstance.color = color
        sharedInstance.backgroundColor = backgroundColor
        sharedInstance.minimumLoadingTimeType = minimumLoadingTimeType
    }
    
    /// Parent window for the blocking activity indicator behaviour.
    open var parentWindow: UIWindow? {
        set {
            window = newValue
        }
        get {
            return window ?? UIWindow.keyWindow
        }
    }
    
    /// The basic appearance of the activity indicator.
    open var style: UIActivityIndicatorView.Style {
        set {
            activityIndicator.style = newValue
        }
        get {
            return activityIndicator.style
        }
    }
    
    /// The color of the activity indicator.
    open var color: UIColor! {
        set {
            activityIndicator.color = newValue
        }
        get {
            return activityIndicator.color
        }
    }
    
    /// The background color of the activity indicator.
    open var backgroundColor: UIColor? {
        set {
            activityIndicator.backgroundColor = newValue
        }
        get {
            return activityIndicator.backgroundColor
        }
    }
    
    /// The minimum loading time behaviour type - enabled/disabled with minimum loading time interval specified.
    /// If `.enabled` value is provided with invalid time interval(less or equal to 0), the value by default is being used.
    /// Changing this value resets the minimum time elapsed flag.
    open var minimumLoadingTimeType: AIMMinimumLoadingTimeType = .enabled(AIMConstants.minimumLoadingTime) {
        didSet {
            isMinimumTimeElapsed = true
        }
    }
    
    /// Convenience `Bool` property indicating wether minimum loading time behaviour is enabled.
    /// Depends on `minimumLoadingTimeType`.
    open var isMinimumLoadingTimeEnabled: Bool {
        switch minimumLoadingTimeType {
        case .enabled(_):
            return true
        case .disabled:
            return false
        }
    }
    
    /// Convenience property providing the minimum loading time interval if minimum loading time behaviour is enabled,
    /// or `nil` if it is disabled.
    /// Depends on `minimumLoadingTimeType`.
    open var minimumLoadingTime: TimeInterval? {
        switch minimumLoadingTimeType {
        case .enabled(let minimumLoadingTime) where minimumLoadingTime > 0:
            return minimumLoadingTime
        case .disabled:
            return nil
        default:
            return AIMConstants.minimumLoadingTime
        }
    }
    
    // MARK: - Activity Indicator
    
    /// Keeps a weak reference to the provided window, parent of the activity indicator.
    /// Application's keyWindow will be used, if this property gets nullified.
    weak var window: UIWindow?
    
    /// Field holding the number of observers. Starts with `0` - no observers.
    /// Should not go below 0. Reaching 0 means that there should be no activity indicator.
    var numberOfObservers: Int = 0
    
    /// Flag checking wether the minimum loading time is elapsed.
    /// Recheck wether the loading indicator should be stopped after this is set to true.
    var isMinimumTimeElapsed = true {
        didSet {
            guard isMinimumLoadingTimeEnabled, isMinimumTimeElapsed else { return }
            hideIndicator()
        }
    }
    
    /// The default whole screen blocking UI activity indicator.
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: AIMConstants.activityIndicatorStyle)
        activityIndicator.backgroundColor = AIMConstants.backgroundColor
        return activityIndicator
    }()
    
    /// Blocks the UI and starts activity indicator, if needed.
    func showIndicator() {
        //do nothing if the UI has already been blocked
        guard let parentWindow = parentWindow,
            !parentWindow.subviews.contains(activityIndicator) else { return }
        
        //start activity indicator and add it to the `parentWindow`
        activityIndicator.startAnimating()
        activityIndicator.expand(in: parentWindow)
        
        startMinimumLoadingTimeIfNeeded()
    }
    
    /// Updates the `isMinimumTimeElapsed` flag if this behaviour is enabled for the manager.
    func startMinimumLoadingTimeIfNeeded() {
        guard isMinimumLoadingTimeEnabled,
            let minimumLoadingTime = minimumLoadingTime else { return }
        
        isMinimumTimeElapsed = false
        Timer.scheduledTimer(withTimeInterval: minimumLoadingTime,
                             repeats: false) { [unowned self] _ in
                                self.isMinimumTimeElapsed = true
        }
    }
    
    /// Unblocks the UI and stops the activity indicator, if needed.
    func hideIndicator() {
        //check if there are no more UI blockers
        guard !isIndicatorShown && isMinimumTimeElapsed else { return }

        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    
    // MARK: - Singleton
    public static let sharedInstance = AIMActivityIndicatorManager()
    private init() {}
    
}
