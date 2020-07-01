# ActivityIndicatorManager

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/ActivityIndicatorManager)](https://img.shields.io/cocoapods/v/ActivityIndicatorManager)  
[![Platform](https://img.shields.io/cocoapods/p/ActivityIndicatorManager)](http://cocoapods.org/pods/ActivityIndicatorManager)

AIM provides convenience methods for starting/stopping activity indicators inside of UIViews/UIWindow.

Table of contents
=================  
  
* [Features](#features)   
* [Requirements](#requirements)
* [Installation](#installation)
* [Usage example](#usage-example)
    
## Features

- [x] **Configurable** - setup with your desired loading behaviour and layout.
- [x] **Window Loader** - start and stop loading indicator over full window with one line of code. 
- [x] **Multi-blocker** - window loader supports multi-blocker behaviour with number of observers(the loading will not disappear unless all observers have unsubscribed).
- [x] **Minimum Loading Time** - window loader supports minimum loading time behaviour with minimum `TimeInterval`(the loading will not disappear unless the minimum time interval has elapsed).
- [x] **View Loader** - start and stop loading indicator within `UIView`s easily.

## Requirements

- iOS 11.0+
- Swift 5

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `ActivityIndicatorManager` by adding it to your `Podfile`:

```ruby
platform :ios, '11.0'
use_frameworks!
pod 'ActivityIndicatorManager'
```

To get the full benefits import `ActivityIndicatorManager` at the start of the source file:

```swift
import ActivityIndicatorManager
```

#### Manually
1. Download and drop ```ActivityIndicatorManager``` folder in your project.  
2. Congratulations!  

## Usage example

#### Setup with native activity indicator

```swift
let nativeActivityIndicatorSetup = AIMNativeTypeModel(style: <#T##UIActivityIndicatorView.Style#>,
                                                      color: <#T##UIColor?#>,
                                                      backgroundColor: <#T##UIColor?#>)

AIMActivityIndicatorManager.setup(withWindow: <#T##UIWindow?#>,
                                  indicatorType: .native(model: nativeActivityIndicatorSetup),
                                  minimumLoadingTimeType: <#T##AIMMinimumLoadingTimeType#>)
```

#### Setup with custom activity indicator

To setup with custom activity indicator a custom view with all the logic should be provided. Note that your custom view should conform to `AIMActivityIndicatorProtocol`

```swift
class CustomActivityIndicatorView: UIView, AIMActivityIndicatorProtocol {
    
    // MARK: - ActivityIndicatorProtocol
    func startAnimating() {
        // start custom animation
    }
    
    func stopAnimating() {
        // stop custom animation
    }
}
```

```swift
AIMActivityIndicatorManager.setup(withWindow: <#T##UIWindow?#>,
                                  indicatorType: .custom(customView: CustomActivityIndicatorView()),
                                  minimumLoadingTimeType: <#T##AIMMinimumLoadingTimeType#>)
```

#### Window Loader

To start activity indicator in window use:
```swift
AIMActivityIndicatorManager.sharedInstance.shouldShowIndicator()
```

and to stop it, use:
```swift
AIMActivityIndicatorManager.sharedInstance.shouldHideIndicator()
```

If you want to unconditionally stop activity indicator in window, you can:
```swift
AIMActivityIndicatorManager.sharedInstance.forceHideIndicator()
```

#### View Loader

To start activity indicator in `view: UIView` use:
```swift
AIMActivityIndicatorManager.sharedInstance.startActivityIndicator(in: view)
```

and to stop it, use:
```swift
AIMActivityIndicatorManager.sharedInstance.stopActivityIndicator(in: view)
```

## Meta

Dimitar Petrov – dimitar.petrov@scalefocus.com

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/scalefocus/activity-indicator-manager](https://github.com/scalefocus/activity-indicator-manager)

[swift-image]:https://img.shields.io/badge/swift-5-green.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: https://github.com/scalefocus/activity-indicator-manager/blob/master/LICENSE
[travis-image]: https://travis-ci.com/scalefocus/activity-indicator-manager.svg?branch=master
[travis-url]: https://travis-ci.com/scalefocus/activity-indicator-manager
