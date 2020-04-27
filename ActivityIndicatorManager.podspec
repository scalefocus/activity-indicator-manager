 Pod::Spec.new do |spec|

  spec.name         = 'ActivityIndicatorManager'
  spec.version      = '1.0.5'
  spec.summary      = 'AIM provides convenience methods for starting/stopping activity indicators inside of UIViews/UIWindows.'

  spec.description  = <<-DESC
  					Small framework exposing convenience methods for controlling activity indicator behaviour in your application.
					Easy start/stop functionality for the loading indicator, both in specific views, and over full window.
                   DESC

  spec.homepage     = "https://github.com/scalefocus/activity-indicator-manager"

  spec.license      = 'MIT'

  spec.author       = { "scalefocus" => "dimitar.petrov@scalefocus.com" }
  
  spec.platform     = :ios, "11.0"
  spec.swift_version = '5.0'

  spec.source       = { :git => "https://github.com/scalefocus/activity-indicator-manager.git", :tag => spec.version.to_s }
  
  spec.source_files = "ActivityIndicatorManager/ActivityIndicatorManager/**/*.{h,m,swift}"

end
