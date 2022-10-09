# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'sinan-koyuncu-case' do
  use_frameworks!

  pod 'GoogleMaps', '7.1.0'
  pod 'Alamofire'
  
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end
