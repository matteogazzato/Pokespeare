platform :ios, '14.0'
use_frameworks!

target 'PokespeareSDK' do
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Alamofire'
  pod 'Kingfisher', '~> 6.0'
end

target 'PokespeareSDK_Tests' do
  pod 'SnapshotTesting', '~> 1.8.1'
end

target 'PokespeareApp' do
  pod 'PokespeareSDK', :path => '.'
  pod 'JGProgressHUD'
end

target 'PokespeareApp_Tests' do
  pod 'SnapshotTesting', '~> 1.8.1'
end

