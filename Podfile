# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'OSKit' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for OSKit
  pod 'Resolver', '~> 1.4'
  pod 'RxSwift', '~> 5.1'
  pod 'RxSwiftExt', '~> 5.2'
  pod 'RxCocoa', '~> 5.1'
  pod 'RxDataSources', '~> 4.0'
  pod 'RxBluetoothKit', :git => 'https://github.com/chamira-at/RxBluetoothKit.git', :branch => 'ios-15-support'
  pod 'XCoordinator', '~> 2.0'
  #pod 'XCoordinator/RxSwift', '2.0'
  pod 'RxAlamofire', '5.1'
  # TODO: - 0 add SwiftLint
  
  target 'OSKitTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  
  # Remove warnings for deployment target
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
  
end
