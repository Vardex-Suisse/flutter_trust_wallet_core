# trust_wallet_core

A Flutter plugin for trust wallet core

download pre_release lib zip from release.
Run example, If crash, make sure follow below step
# Android
create "libs" folder in path ./android then put trustwalletcore into libs folder
Add 
```
class MainActivity: FlutterActivity() {
    init {
        System.loadLibrary("TrustWalletCore")
    }
}
 ```
in android project MainActivity.ky file 


# iOS
create "Frameworks" folder in path ./ios then put  SwiftProtobuf.xcframework and WalletCore.xcframework into Frameworks folder

Add 
```
  # trust wallet core
  s.vendored_frameworks = 'Frameworks/*.xcframework'
```

in podspec 

your project file structs will look like this

<img width="456" alt="截屏2021-09-16 上午10 26 10" src="https://user-images.githubusercontent.com/54241621/133539483-b8019dfd-3b5f-44d5-88a9-62738f5df09f.png">


then you are ready to run.






# If want to use plugin in your own project

Current there is a way will be easy

Just add follow dep in your pubspec.yaml file, flutter_trust_wallet_core_lib_include.git was check binary lib into repo.
```
flutter_trust_wallet_core:
    git:
      url: https://github.com/weishirongzhen/flutter_trust_wallet_core_lib_include.git
      ref: 8e371e1aadcf06f2d1ce44fb3036a36395d1f095
```

make sure ref is newest, then run  flutter pub get

edit you android MainACtivity.kt file
```
class MainActivity: FlutterActivity() {
    init {
        System.loadLibrary("TrustWalletCore")
    }
}

```

ios nothing need todo.

# dart part
before use wallet_core, add 
```
 FlutterTrustWalletCore.init();
```
before call any api of wallet_core

