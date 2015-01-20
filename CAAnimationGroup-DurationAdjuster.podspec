Pod::Spec.new do |s|
  s.name         = "CAAnimationGroup-DurationAdjuster"
  s.version      = "0.0.1"
  s.summary      = "CAAnimationGroup Category that make animations sequential"
  s.homepage     = "https://github.com/kazu0620/CAAnimationGroup-DurationAdjuster"
  s.license      = "MIT"
  s.author       = { "Kazuhiro Sakamoto" => "kazu620@gmail.com" }
  s.source       = { :git => "https://github.com/kazu0620/CAAnimationGroup-DurationAdjuster.git", :tag => "0.0.1" }
  s.platform     = :ios, '6.0'
  s.source_files = "Classes", "Classes/**/*.{h,m}"
  s.requires_arc = true
end
