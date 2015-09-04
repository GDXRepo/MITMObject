Pod::Spec.new do |s|
  s.name             = "MITMObject"
  s.version          = "1.0.1"
  s.summary          = "Delegate calls interceptor based on Man-In-The-Middle attack principles, useful for subclassing Foundation classes."
  s.homepage         = "https://github.com/GDXRepo/MITMObject"
  s.license          = { :type => "Apache", :file => "LICENSE" }
  s.author           = { "Georgiy Malyukov" => "" }
  s.source           = { :git => "https://github.com/GDXRepo/MITMObject.git", :tag => s.version.to_s }
  s.social_media_url = 'http://deadlineru.livejournal.com'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'test' => ['Pod/Assets/*.png']
  }
end
