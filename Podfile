# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!

target 'TextCapture' do

  # Pods for TextCapture
  pod 'Alamofire', '~> 4.4'
  pod "PCLBlurEffectAlert"
  pod 'SwiftyJSON'
  pod 'SwiftCarousel'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            if config.name == 'Debug'
                config.build_settings['ENABLE_TESTABILITY'] = 'YES'
                config.build_settings['SWIFT_VERSION'] = '3.0'
            end
        end
    end
end