Pod::Spec.new do |s|
  s.name             = "VMaskTextField"
  s.version          = "1.0.6"
  s.summary          = "VMaskTextField is a library which create an input mask."
  s.description      = <<-DESC
                       An inputmask helps the user with the input by ensuring a predefined format. This can be useful for dates, numerics, phone numbers etc
                       DESC
  s.homepage         = "https://github.com/viniciusmo/VMaskTextField"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "viniciusmo" => "vinicius.moises.oliveira@gmail.com" }
  s.source           = { :git => "https://github.com/viniciusmo/VMaskTextField.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/viniciusmo90'
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'VMaskTextField' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
