#import "TrustWalletCorePlugin.h"
#if __has_include(<trust_wallet_core/trust_wallet_core-Swift.h>)
#import <trust_wallet_core/trust_wallet_core-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "trust_wallet_core-Swift.h"
#endif

@implementation TrustWalletCorePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTrustWalletCorePlugin registerWithRegistrar:registrar];
}
@end
