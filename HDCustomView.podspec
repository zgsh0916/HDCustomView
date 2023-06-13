Pod::Spec.new do |s|

  s.name         = "HDCustomView"  #存储库名称
  s.version      = "1.0.0"          #版本号，与tag值一致
  s.summary      = "自定义view" #简介
  s.description  = "自己用的自定义view集合"   #描述
  s.homepage     = "https://github.com/zgsh0916/HDCustomView" #项目主页，不是git地址 不要加.git
  s.license      = { :type => "MIT", :file => "LICENSE" }  #开源协议
  s.author       = { "wangmeng" => "wangmeng@hundunyun.com.cn" } #作者
  s.platform     = :ios, "12.0"  #支持的平台和版本号
  s.source       = { :git => "https://github.com/zgsh0916/HDCustomView.git", :tag => "1.0.0" } #存储库的git地址，以及tag值
  s.source_files  = "*.{h,m}"
  s.requires_arc = true #是否支持ARC
  s.public_header_files = "*.h" #工程需要暴露出来的头文件
  s.dependency "Masonry" #不加等号
  s.ios.deployment_target = "11.0" #依赖最低版本
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
end

