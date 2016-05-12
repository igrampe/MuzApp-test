platform :ios, '9.0'
xcodeproj 'MuzAppTest'

inhibit_all_warnings!

def di
    pod 'Typhoon', '~> 3.4.5'
end

def data
    pod 'EasyMapping', '~> 0.15.3'
end

def network
    pod 'AFNetworking', '~> 3.1'
    pod 'SDWebImage', '~> 3.7'
end

def ui
  pod 'PureLayout'
end

target 'MuzAppTest' do
    di
    data
    network
    ui
end
