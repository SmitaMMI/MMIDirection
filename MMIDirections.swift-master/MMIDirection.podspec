Pod::Spec.new do |s|
  s.name             = ‘MMIDirection’
  s.version          = '0.1.0'
  s.summary          = ‘Route Direction’
 
  s.description      = <<-DESC
This draw route in map view
                       DESC
 
  s.homepage         = 'https://github.com/SmitaMMI/MMIDirection'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Smita' => 'sushreesmita@mapmyindia.com' }
  s.source           = { :git => 'https://github.com/SmitaMMI/MMIDirection.git', :tag => s.version.to_s }
  s.source_files = 'MapboxDirections'