
Pod::Spec.new do |s|

  s.name         = "SwiftyDate"
  s.version      = "1.0"
  s.summary      = "The easiest way to generate relative dates in Swift."

  s.description  = <<-DESC

  SwiftyDate allows you to easily create relative NSDates in Swift using a readable syntax.

  DESC

  s.homepage     = "https://github.com/eddiekaiger/SwiftyDate"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Eddie Kaiger" => "eddiekaiger@gmail.com" }
  s.source       = { :git => "https://github.com/eddiekaiger/SwiftyDate.git", :tag => "1.0" }
  s.platform     = :ios, '8.0'
  s.source_files  = "SwiftyDate.swift"

end
