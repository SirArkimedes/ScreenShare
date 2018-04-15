#
# Be sure to run `pod lib lint ScreenShare.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ScreenShare'
  s.version          = '0.1.0'
  s.summary          = 'Share that screenshot!'
  s.description      = <<-DESC
                       📸 Prompt to share the screenshot someone took of your app!
                       DESC

  s.homepage         = 'https://github.com/SirArkimedes/ScreenShare'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SirArkimedes' => 'sirarkimedes@gmail.com' }
  s.source           = { :git => 'https://github.com/SirArkimedes/ScreenShare.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/SirArkimedes'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ScreenShare/Classes/**/*'
end
