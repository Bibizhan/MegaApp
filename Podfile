# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MegaApp' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MegaApp

pod 'Alamofire', '~> 4.7'
pod 'SwiftyJSON', '~> 4.1'
pod 'Kingfisher', '~> 4.8'
pod 'GMStepper', '~> 2.1'
pod 'Cosmos', '~> 16.0'
pod 'TextFieldEffects'

end

post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end
