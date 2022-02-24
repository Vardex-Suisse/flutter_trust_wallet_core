import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:trust_wallet_core/trust_wallet_core_ffi.dart';
import 'package:trust_wallet_core_example/base_example.dart';

class EthereumExample extends BaseExample {
  final HDWallet wallet;

  const EthereumExample(this.wallet, {Key? key}) : super('Ethereum', key: key);

  @override
  _EthereumExampleState createState() => _EthereumExampleState();
}

class _EthereumExampleState extends BaseExampleState<EthereumExample> {
  @override
  void initState() {
    super.initState();
    logger.d("mnemonic: ${widget.wallet.mnemonic()}");
    logger.d(
        "address: ${widget.wallet.getAddressForCoin(TWCoinType.TWCoinTypeEthereum)}");
    final publicKey = widget.wallet
        .getKeyForCoin(TWCoinType.TWCoinTypeEthereum)
        .getPublicKeySecp256k1(false);
    AnyAddress anyAddress = AnyAddress.createWithPublicKey(
        publicKey, TWCoinType.TWCoinTypeEthereum);
    logger.d("address from any address: ${anyAddress.description()}");
    print(widget.wallet.mnemonic());
    String privateKeyhex = hex.encode(
        widget.wallet.getKeyForCoin(TWCoinType.TWCoinTypeEthereum).data());
    logger.d("privateKeyhex: $privateKeyhex");
    logger.d("seed = ${hex.encode(widget.wallet.seed())}");
    final keystore = StoredKey.importPrivateKey(
        widget.wallet.getKeyForCoin(TWCoinType.TWCoinTypeEthereum).data(),
        "name",
        "password",
        TWCoinType.TWCoinTypeEthereum);
    logger.d("keystore: ${keystore?.exportJson()}");
  }
}
