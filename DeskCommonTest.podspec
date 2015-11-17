Pod::Spec.new do |s|
  s.name         = "DeskCommonTest"
  s.version      = "1.0.1"
  s.summary      = "Common test code shared by Salesforce Desk Cocoa projects"
  s.license      = { :type => 'BSD 3-Clause', :file => 'LICENSE.txt' }
  s.homepage     = "https://github.com/forcedotcom/DeskCommonTest-Cocoa"
  s.author       = { "Salesforce, Inc." => "mobile@desk.com" }
  s.source       = { :git => "https://github.com/forcedotcom/DeskCommonTest-Cocoa.git", :tag => "1.0.1" }
  s.platform     = :ios, '6.0'
  s.source_files = 'DeskCommonTest/DeskCommonTest/*.{h,m}', 'DeskCommonTest/DeskCommonTest/**/*.{h,m}'
  s.requires_arc = true
  s.dependency 'OHHTTPStubs', '4.6.0'
end
