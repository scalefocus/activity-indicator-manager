# ActivityIndicatorManager

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

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

``` swift
import ActivityIndicatorManager
```

#### Manually
1. Download and drop ```ActivityIndicatorManager``` folder in your project.  
2. Congratulations!  

## Usage example

#### Setup

```swift
AIMActivityIndicatorManager.setup(withWindow: <#T##UIWindow?#>,
                                  style: <#T##UIActivityIndicatorView.Style#>,
                                  color: <#T##UIColor?#>,
                                  backgroundColor: <#T##UIColor?#>,
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

## Contribute

We would love you for the contribution to **ActivityIndicatorManager**, check the ``LICENSE`` file for more info.

## Meta

Dimitar Petrov – dimitar.petrov@scalefocus.com

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/yourname/github-link](https://github.com/dbader/)

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
