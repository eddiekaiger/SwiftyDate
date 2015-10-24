
Pod::Spec.new do |s|

  s.name         = "SwiftyDate"
  s.version      = "1.0"
  s.summary      = "The easiest way to generate relative dates in Swift."

  s.description  = <<-DESC
                   DESC

  s.homepage     = "http://github.com/eddiekaiger/SwiftyDate"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Eddie Kaiger" => "eddiekaiger@gmail.com" }

  s.source       = { :git => "http://github.com/eddiekaiger/SwiftyDate.git", :tag => "1.0" }

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

end
