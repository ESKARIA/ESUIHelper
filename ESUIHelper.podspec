Pod::Spec.new do |s|
    s.platforms = { :ios => "13.0" }
    s.name = "ESUIHelper"
    s.summary = "ESUIHelper swift 5.2 UI framework for simple development amazing apps."
    s.requires_arc = true
    s.version = "1.0.0"
    s.license = { :type => "MIT", :file => "LICENSE" }
    s.author = { "Emil Karimov" => "emvakar@gmail.com" }
    s.homepage = "https://github.com/ESKARIA/ESUIHelper.git"
    s.source = { :git => "https://github.com/ESKARIA/ESUIHelper.git", :tag => "#{s.version}"}
    s.framework = "UIKit"
    s.source_files = "Sources/ESUIHelper/**/*.{swift}"
    s.swift_version = "5.2"
    
#   s.resources = "Sources/ESUIHelper/**/*.{png,jpeg,jpg,storyboard,xib}"
#####
# Waiting swift 5.3 for use bundle
#####
#    s.resource_bundles = {
#        'DevHelperAssets' => ['Sources/ESUIHelper/**/*.xcassets']
#    }
end
