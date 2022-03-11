#
#  Be sure to run `pod spec lint OSKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "OSKit"
  s.version      = "1.0.0"
  s.summary      = "Outside Source OSKit"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = "Outside Source OSKit"

  s.homepage     = "https://github.com/outsidesource/OSKit-iOS.git"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.authors             = { "Outside Source" => "https://www.outsidesource.com", "Brody Robertson" => "bdrobert@outsidesource.com" }
  s.social_media_url   = "https://www.outsidesource.com"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  s.platform     = :ios
  # s.platform     = :ios, "5.0"

  #  When using multiple platforms
  s.ios.deployment_target = "11.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/outsidesource/OSKit-iOS.git", :tag => "#{s.version}" }
  #s.source       = { :git => "https://github.com/outsidesource/OSKit-iOS.git", :branch => "develop" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  # s.source_files  = "OSKit", "OSKit/**/*.{h,m}", "OSKit/**/*.{swift}"
  s.exclude_files = "OSKit/Exclude"
  # s.public_header_files = "Classes/**/*.h"

  s.subspec "Core" do |core|
    core.source_files = "OSKit/{Core,Foundation,Swift}/*.{h,m}", "OSKit/{Core,Foundation,Swift}/*.{swift}"
    core.framework = "Foundation"
  end
  
  s.subspec "Alamofire" do |alamofire|
    alamofire.source_files = "OSKit/Alamofire/*.{h,m}", "OSKit/Alamofire/*.{swift}"
    alamofire.dependency "OSKit/Core"
    alamofire.dependency "Alamofire", "~> 4.9.1"
  end
  
  s.subspec "RxAlamofire" do |rxalamofire|
    rxalamofire.source_files = "OSKit/RxAlamofire/*.{h,m}", "OSKit/RxAlamofire/*.{swift}"
    rxalamofire.dependency "OSKit/Alamofire"
    rxalamofire.dependency "RxAlamofire", "~> 5.1.0"
  end
  
  s.subspec "AVFoundation" do |avfoundation|
    avfoundation.source_files = "OSKit/AVFoundation/*.{h,m}", "OSKit/AVFoundation/*.{swift}"
    avfoundation.dependency "OSKit/Core"
    avfoundation.framework  = "AVFoundation"
  end
  
  s.subspec "CoreGraphics" do |coregraphics|
    coregraphics.source_files = "OSKit/CoreGraphics/*.{h,m}", "OSKit/CoreGraphics/*.{swift}"
    coregraphics.dependency "OSKit/Core"
    coregraphics.framework  = "CoreGraphics"
  end
  
  s.subspec "CoreLocation" do |corelocation|
    corelocation.source_files = "OSKit/CoreLocation/*.{h,m}", "OSKit/CoreLocation/*.{swift}"
    corelocation.dependency "OSKit/Core"
    corelocation.framework  = "CoreLocation"
  end
  
  s.subspec "Build" do |build|
    build.source_files = "OSKit/OSBuild/*.{h,m}", "OSKit/OSBuild/*.{swift}"
    build.dependency "OSKit/Core"
  end
  
  s.subspec "Log" do |log|
    log.source_files = "OSKit/OSLog/*.{h,m}", "OSKit/OSLog/*.{swift}"
    log.dependency "OSKit/Core"
  end
  
  s.subspec "Log+Rx" do |rxlog|
    rxlog.source_files = "OSKit/RxOSLog/*.{h,m}", "OSKit/RxOSLog/*.{swift}"
    rxlog.dependency "OSKit/Log"
    rxlog.dependency "RxSwift", "~> 5.1.1"
    rxlog.dependency "RxCocoa", "~> 5.1.1"
  end
  
  s.subspec "Build+Resolver" do |resolver|
    resolver.source_files = "OSKit/Resolver/*.{h,m}", "OSKit/Resolver/*.{swift}"
    resolver.dependency "OSKit/Build"
    resolver.dependency "Resolver", "~> 1.4.0"
  end
  
  s.subspec "RxBluetoothKit" do |rxbluetoothkit|
    rxbluetoothkit.source_files = "OSKit/RxBluetoothKit/*.{h,m}", "OSKit/RxBluetoothKit/*.{swift}"
    rxbluetoothkit.dependency "OSKit/Core"
    rxbluetoothkit.dependency "RxBluetoothKit", "~> 6.0.0"
  end
  
  s.subspec "RxSwift" do |rxswift|
    rxswift.source_files = "OSKit/RxSwift/*.{h,m}", "OSKit/RxSwift/*.{swift}"
    rxswift.dependency "OSKit/Core"
    rxswift.dependency "RxSwift", "~> 5.1.1"
  end
  
  s.subspec "UIKit" do |uikit|
    uikit.source_files = "OSKit/UIKit/*.{h,m}", "OSKit/UIKit/*.{swift}"
    uikit.resources = "OSKit/UIKit/*.xib"
    uikit.dependency "OSKit/CoreGraphics"
    uikit.framework  = "UIKit"
  end
  
  s.subspec "RxUIKit" do |rxuikit|
    rxuikit.source_files = "OSKit/RxUIKit/*.{h,m}", "OSKit/RxUIKit/*.{swift}"
    rxuikit.dependency "OSKit/UIKit"
    rxuikit.dependency "RxSwift", "~> 5.1.1"
    rxuikit.dependency "RxSwiftExt", "~> 5.2.0"
  end
  
#  s.subspec "SwiftUI" do |swiftui|
#    swiftui.source_files = "OSKit/SwiftUI/*.{h,m}", "OSKit/SwiftUI/*.{swift}"
#    swiftui.framework  = "SwiftUI"
#  end
  
  s.subspec "UserNotifications" do |usernotifications|
    usernotifications.source_files = "OSKit/UserNotifications/*.{h,m}", "OSKit/UserNotifications/*.{swift}"
    usernotifications.dependency "OSKit/Core"
    usernotifications.dependency "OSKit/UIKit"
    usernotifications.framework = "UserNotifications"
  end
  
  s.subspec "VISCS" do |viscs|
    viscs.source_files = "OSKit/VISCS/**/*.{h,m}", "OSKit/VISCS/**/*.{swift}"
    viscs.dependency "OSKit/Core"
    viscs.dependency "OSKit/UIKit"
  end
  
  s.subspec "VISCS+Rx" do |viscs_rx|
    viscs_rx.source_files = "OSKit/VISCS+Rx/*.{h,m}", "OSKit/VISCS+Rx/*.{swift}"
    viscs_rx.dependency "OSKit/VISCS"
    viscs_rx.dependency "OSKit/RxSwift"
    viscs_rx.dependency "RxSwiftExt", "~> 5.2.0"
    viscs_rx.dependency "RxCocoa", "~> 5.1.1"
    viscs_rx.dependency "RxDataSources", "~> 4.0.1"
  end
  
#  s.subspec "RxVISER-RxReSwift" do |rxreswift|
#    rxreswift.source_files = "OSKit/RxReSwift/*.{h,m}", "OSKit/RxReSwift/*.{swift}"
#    rxreswift.dependency "OSKit/VISER-ReSwift"
#    rxreswift.dependency "OSKit/RxVISER"
#  end
#
#  s.subspec "VISER-ReSwift-Combine" do |viserreswiftcombine|
#    viserreswiftcombine.source_files = "OSKit/ReSwift-Combine/*.{h,m}", "OSKit/ReSwift-Combine/*.{swift}"
#    viserreswiftcombine.dependency "OSKit/VISER-ReSwift"
#    viserreswiftcombine.dependency "OSKit/VISER-Combine"
#  end
#
#  s.subspec "RxVISER-RxXCoordinator" do |xcoordinator|
#    xcoordinator.source_files = "OSKit/RxXCoordinator/*.{h,m}", "OSKit/RxXCoordinator/*.{swift}"
#    xcoordinator.dependency "OSKit/RxVISER"
#    xcoordinator.dependency "XCoordinator", "~> 2.0.7"
#    xcoordinator.dependency "XCoordinator/RxSwift", "~> 2.0.7"
#  end
  
  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "OSKit/UIKit/*.xib"
  # s.resource_bundles = { "OSKit" => ["OSKit/UIKit/*.xib"] }

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "Foundation"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  
  s.swift_version = "5.0"

end
