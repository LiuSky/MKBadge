Pod::Spec.new do |s|

  s.name             = 'MKBadge'
  s.version          = '1.3.1'
  s.summary          = '角标组件'

  s.description      = <<-DESC
    角标组件
                       DESC

  s.homepage         = 'https://github.com/LiuSky/MKBadge'
  s.license          = 'MIT'
  s.author           = { 'xiaobin liu'=> '327847390@qq.com' }
  s.source           = { :git => 'https://github.com/LiuSky/MKBadge.git', :tag => s.version.to_s }

  s.swift_version         = '5.0'
  s.requires_arc = true
  s.ios.deployment_target = '9.0'
  s.source_files = 'MKBadge/Classes/*.swift'
end

