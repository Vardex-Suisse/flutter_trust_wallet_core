# flutter_trust_wallet_core

A Flutter plugin for trust wallet core. It can access all api list in [https://github.com/trustwallet/wallet-core/tree/master/include/TrustWalletCore](https://github.com/trustwallet/wallet-core/tree/master/include/TrustWalletCore) (from trust_wallet_core version 2.6.20)

This project was originally copied from [weishirongzhen](https://github.com/weishirongzhen/flutter_trust_wallet_core)

# Android

minSdk require >=23

Add 

```
class MainActivity: FlutterActivity() {
    init {
        System.loadLibrary("TrustWalletCore")
    }
}
 ```
in your android project MainActivity.kt file

## Create github authoken (currently not required as pre-compiled .aar is used)

Create a [github auth token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) to fetch binary from official TrustWalletCore maven repo

Set gradle project property `gpr.user` and `gpr.token` or set system environment variable `GH_USERNAME` and `GH_TOKEN` with the credentials you recieved from github

## Compiling TrustWalletCore .aar (use this until lookup error solved)

1. Pull official trustwallet core repo
2. Change `set(CMAKE_CXX_VISIBILITY_PRESET hidden)` to  `set(CMAKE_CXX_VISIBILITY_PRESET default)` in CmakeLists.txt (Line 14)
3. Build project `./bootstrap.sh`
4. Compile for android run `./tools/android-build`
5. Copy trustwalletcore.aar in /build to android/libs in this project 

# iOS

min ios platform support >=13.0


# Flutter 

Before using this package, you need to initialise it:

```
 FlutterTrustWalletCore.init();
```


