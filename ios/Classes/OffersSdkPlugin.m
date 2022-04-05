#import "OffersSdkPlugin.h"
#if __has_include(<offers_sdk/offers_sdk-Swift.h>)
#import <offers_sdk/offers_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "offers_sdk-Swift.h"
#endif

@implementation OffersSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOffersSdkPlugin registerWithRegistrar:registrar];
}
@end
