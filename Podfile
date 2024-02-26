# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def reactive
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxDataSources'
end

def dependancy_injection
  pod 'Swinject'
end

def navigation
  pod 'RxFlow'
end

def networking
  pod 'Alamofire'
  pod 'AlamofireImage', '~> 4.3'
end

def autoGeneration
  pod 'SwiftGen', '~> 6.0'
end

target 'rewe' do
  use_frameworks!
  reactive
  dependancy_injection
  navigation
  networking
  autoGeneration
end
