Pod::Spec.new do |s|
  s.name             = "MITMObject"
  s.version          = "1.0.0"
  s.summary          = "Delegate calls interceptor based on Man-In-The-Middle attack principles, useful for subclassing Foundation classes."
  s.homepage         = "https://github.com/NRGRepo/MITMObject"
  s.license          = { :type => "Apache", :file => "LICENSE" }
  s.author           = { "Georgiy Malyukov" => "" }
  s.source           = { :git => "https://github.com/NRGRepo/MITMObject.git", :tag => s.version.to_s }
  s.social_media_url = 'http://deadlineru.livejournal.com'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'test' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end