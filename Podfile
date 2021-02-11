platform :ios, '13.0'
use_frameworks!

target 'PokespeareSDK' do
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5.1.1'
  pod 'Alamofire', '~> 5.3.0'
  pod 'Kingfisher', '~> 6.0'
end

target 'PokespeareSDK_Tests' do
  pod 'SnapshotTesting', '~> 1.8.1'
end

target 'PokespeareApp' do
  pod 'PokespeareSDK', :path => '.'
  pod 'JGProgressHUD', '~> 2.2'
end

target 'PokespeareApp_Tests' do
  pod 'SnapshotTesting', '~> 1.8.1'
end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
  end
 end
end

