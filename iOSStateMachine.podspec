#
# Be sure to run `pod lib lint iOSStateMachine.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iOSStateMachine'
  s.version          = '0.1.0'
  s.summary          = 'StateMachine easy to use for iOS Platforms.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
StateMachine easy to use for iOS Platforms. Install library into project, never have to handle states of  complex logics.
                       DESC

  s.homepage         = 'https://github.com/ilyadaberdil/iOSStateMachine'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ilyadaberdil' => 'ilyadaberdil@gmail.com' }
  s.source           = { :git => 'https://github.com/ilyadaberdil/iOSStateMachine.git', :tag => s.version.to_s }
  s.social_media_url = 'https://linkedin.com/in/ilyadaberdil'

  s.ios.deployment_target = '9.0'
  s.swift_versions = '5.0'

  s.source_files = 'iOSStateMachine/Classes/**/*'
  
  # s.resource_bundles = {
  #   'iOSStateMachine' => ['iOSStateMachine/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
