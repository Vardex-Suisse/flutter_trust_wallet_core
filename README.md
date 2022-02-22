# trust_wallet_core

A Flutter plugin for trust wallet core, Can access all api list in [https://github.com/trustwallet/wallet-core/tree/master/include/TrustWalletCore](https://github.com/trustwallet/wallet-core/tree/master/include/TrustWalletCore)

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

## Create github authoken

Create [github auth token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) to fetch binary from official TrustWalletCore maven repo

Set gradle project property `gpr.user` and `gpr.token` or set system environment variable `GH_USERNAME` and `GH_TOKEN` with the credentials you recieved from github


# iOS

min ios platform support >=13.0


# Flutter 

before use wallet_core, call below function once.
```
 FlutterTrustWalletCore.init();
```

Then you are ready to run.

