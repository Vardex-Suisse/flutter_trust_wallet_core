#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint trust_wallet_core.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'trust_wallet_core'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter  plugin for trust wallet core'
  s.description      = <<-DESC
A Flutter  plugin for trust wallet core
                       DESC
  s.homepage         = 'https://github.com/Vardex-Suisse/flutter_trust_wallet_core'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'memtopia' => 'memtopia@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # trust wallet core
  s.dependency 'TrustWalletCore', '~> 2.7.2'
end
