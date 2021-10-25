# trust_wallet_core

A Flutter plugin for trust wallet core, Can access all api list in [https://github.com/trustwallet/wallet-core/tree/master/include/TrustWalletCore](https://github.com/trustwallet/wallet-core/tree/master/include/TrustWalletCore)

# Android
Add 
```
class MainActivity: FlutterActivity() {
    init {
        System.loadLibrary("TrustWalletCore")
    }
}
 ```
in your android project MainActivity.ky file 

# iOS

Nothing need to do.


# dart part
before use wallet_core, call below function once.
```
 FlutterTrustWalletCore.init();
```

Then you are ready to run.

