#
# Be sure to run `pod lib lint RxWebSocket.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AnalyticsProvider'
  s.version          = '4.0.1'
  s.summary          = 'Protocol to track Events'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Protocol to track Events...
                       DESC

  s.homepage         = 'https://github.com/mariohahn'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mario Hahn' => 'mh@tailored-apps.com' }
  s.source           = { :git => 'https://github.com/mariohahn/AnalyticsProvider.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = "2.0"
  s.osx.deployment_target = "10.11"

  s.source_files = 'Sources/**/*.swift'
end
