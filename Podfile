# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'
def rx_swift
  pod 'RxSwift', '~> 4.0'
end

def rx_cocoa
  pod 'RxCocoa', '~> 4.0'
end

def test_pods
  pod 'RxTest', '~> 4.0'
  pod 'RxBlocking', '~> 4.0'
end
target 'iOS-Challenge' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  rx_cocoa
  rx_swift
  pod 'RxDataSources', '~> 3.0'
  # Pods for iOS-Challenge

  target 'iOS-ChallengeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'iOS-ChallengeUITests' do
    # Pods for testing
  end

end

target 'Domain' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  rx_swift
  pod 'RxAlamofire', '~> 4.4.1'
  pod 'ReachabilitySwift'
  target 'DomainTests' do
    inherit! :search_paths
    test_pods
  end
  
end

target 'NetworkPlatform' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  rx_swift
  pod 'Alamofire', '~> 4.9.1'
  pod 'RxAlamofire', '~> 4.4.1'
  
  target 'NetworkPlatformTests' do
    inherit! :search_paths
    test_pods
  end
  
end
