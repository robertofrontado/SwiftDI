Pod::Spec.new do |spec|

  spec.name         = "SwiftDI"
  spec.version      = "0.0.1"
  spec.summary      = "Lightweight dependency injection framework"

#  spec.license     = { :type => "MIT", :file => "LICENSE" }
  spec.homepage     = "http://EXAMPLE/SwiftDI"
  spec.author       = { "Roberto Frontado" => "robertofrontado@gmail.com" }

  spec.platform              = :ios
  spec.ios.deployment_target = "11.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source       = { :git => "https://github.com/robertofrontado/SwiftDI.git", :tag => "#{spec.version}" }
  spec.source_files = "SwiftDI/Sources/*.swift"

end
