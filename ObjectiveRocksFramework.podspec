Pod::Spec.new do |s|  
    s.name              = 'ObjectiveRocksFramework'
    s.version           = '0.9.0.2'
    s.summary           = 'An Objective-C wrapper for RocksDB - A Persistent Key-Value Store for Flash and RAM Storage.'
    s.homepage          = 'https://github.com/KeepSafe/ObjectiveRocks/tree/frameworks'
    s.author            = 'iabudiab'
    s.license           = { :type => 'MIT', :file => 'LICENSE' }
    s.source            = { :http => "https://github.com/KeepSafe/ObjectiveRocksFramework/releases/download/v#{s.version.to_s}/ObjectiveRocks.zip" }
    s.requires_arc      = true
    s.ios.deployment_target = '9.0'
    s.ios.vendored_frameworks = 'iOS/ObjectiveRocks.framework'
    s.osx.deployment_target = '10.10'
    s.osx.vendored_frameworks = 'macOS/ObjectiveRocks.framework'
    
    #### CONFIGS

    shared_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'NDEBUG=1 OS_MACOSX=1 ROCKSDB_PLATFORM_POSIX=1 ROCKSDB_LIB_IO_POSIX=1' }
    framework_shared_xconfig = {
      'HEADER_SEARCH_PATHS' => '"${PODS_TARGET_SRCROOT}/rocksdb_src/rocksdb" "${PODS_TARGET_SRCROOT}/rocksdb_src/rocksdb/include"',
      'LIBRARY_SEARCH_PATHS' => '"${PODS_TARGET_SRCROOT}/rocksdb_src/rocksdb"',
      'GCC_INPUT_FILETYPE' => 'sourcecode.cpp.objcpp',
      'GCC_C_LANGUAGE_STANDARD' => 'gnu99',
      'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++11'
    }
    s.pod_target_xcconfig = shared_xcconfig.merge(framework_shared_xconfig)
    s.user_target_xcconfig = shared_xcconfig

    shared_osx_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ROCKSDB_USING_THREAD_STATUS=1' }
    s.osx.pod_target_xcconfig = shared_osx_xcconfig
    s.osx.user_target_xcconfig = shared_osx_xcconfig

    shared_ios_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'ROCKSDB_LITE=1 IOS_CROSS_COMPILE=1 NROCKSDB_THREAD_STATUS=1' }
    s.ios.pod_target_xcconfig = shared_ios_xcconfig
    s.ios.user_target_xcconfig = shared_ios_xcconfig
end  
