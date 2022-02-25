// Tests were copied from TrustWalletCore (Swift & Kotlin tests)

import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:trust_wallet_core/trust_wallet_core_ffi.dart';

import 'utils/hex.dart';

// TODO: change to not use TWCoinType add code to /dart_impl and /core
void main() {
  setUp(() {
    FlutterTrustWalletCore.init();
  });

  walletTest() => HDWallet.createWithMnemonic(
      'ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal',
      passphrase: 'TREZOR');

  test('Test - Generate wallet from mnemonic w/ passphrase', () {
    final wallet = walletTest();
    expect(wallet.mnemonic(),
        'ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal');
    expect(Hex.encode(wallet.seed()),
        '7ae6f661157bda6492f6162701e570097fc726b6235011ea5ad09bf04986731ed4d92bc43cbdee047b60ea0dd1b1fa4274377c9bf5bd14ab1982c272d8076f29');
  });

  test('Test - Generate wallet from mnemonic w/o passphrase', () {
    final mnemonic =
        'ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal';
    final wallet = HDWallet.createWithMnemonic(mnemonic);
    expect(wallet.mnemonic(), mnemonic);
    expect(Hex.encode(wallet.seed()),
        '354c22aedb9a37407adc61f657a6f00d10ed125efa360215f36c6919abd94d6dbc193a5f9c495e21ee74118661e327e84a5f5f11fa373ec33b80897d4697557d');
  });

  test('Test - Generate wallet from invalid mnemonic', () {
    final mnemonic = 'INVALID SEED PHRASE';
    expect(() => HDWallet.createWithMnemonic(mnemonic, passphrase: ''),
        throwsException);
  });

  test('Test - Generate wallet', () {
    final wallet = HDWallet(strength: 128, passphrase: '');
    expect(Mnemonic.isValid(wallet.mnemonic()), true);
  });

  test('Test - Generate wallet from entropy', () {
    final bytes = Uint8List.fromList(
        Hex.decode('ba5821e8c356c05ba5f025d9532fe0f21f65d594'));
    final wallet = HDWallet.createWithData(bytes, passphrase: 'TREZOR');
    expect(wallet.mnemonic(),
        'ripple scissors kick mammal hire column oak again sun offer wealth tomorrow wagon turn fatal');
  });

  test('Test - Master Key', () {
    final mnemonic =
        'tiny escape drive pupil flavor endless love walk gadget match filter luxury';
    final wallet = HDWallet.createWithMnemonic(mnemonic, passphrase: '');
    final masterKey = wallet.getMaterKey(TWCurve.TWCurveSECP256k1).data();
    expect(Hex.encode(masterKey),
        'e120fc1ef9d193a851926ebd937c3985dc2c4e642fb3d0832317884d5f18f3b3');
    expect(Hex.encode(wallet.seed()),
        'd430216f5b506dfd281d6ff6e92150d205868923df00774bc301e5ffdc2f4d1ad38a602017ddea6fc7d6315345d8b9cadbd8213ed2ffce5dfc550fa918665eb8');
  });

  test('Test - Derive', () {
    final wallet = walletTest();

    final eth = TWCoinType.TWCoinTypeEthereum;
    final key0 = wallet.getDerivedKey(eth, 0, 0, 0);
    final key1 = wallet.getDerivedKey(eth, 0, 0, 1);

    expect(
        AnyAddress.createWithPublicKey(key0.getPublicKeySecp256k1(false), eth)
            .description(),
        '0x27Ef5cDBe01777D62438AfFeb695e33fC2335979');
    expect(
        AnyAddress.createWithPublicKey(key1.getPublicKeySecp256k1(false), eth)
            .description(),
        '0x98f5438cDE3F0Ff6E11aE47236e93481899d1C47');
  });

  test('Test - Wanchain', () {
    final wanChain = TWCoinType.TWCoinTypeWanchain;
    final wallet = walletTest();

    final key = wallet.getKeyForCoin(wanChain);
    final address =
        '0x4DDa26870B4b3fa3FbA32222159359038f588318'; //key.deriveAddress(key); //TODO: first need to implement cointype

    expect(Hex.encode(key.data()), '');
    expect(address, '0x4DDa26870B4b3fa3FbA32222159359038f588318');
  });
}
