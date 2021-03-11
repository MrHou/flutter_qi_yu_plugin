#import "FlutterQyPlugin.h"
#if __has_include(<flutter_qy_plugin/flutter_qy_plugin-Swift.h>)
#import <flutter_qy_plugin/flutter_qy_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_qy_plugin-Swift.h"
#endif

@implementation FlutterQyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterQyPlugin registerWithRegistrar:registrar];
}
@end
