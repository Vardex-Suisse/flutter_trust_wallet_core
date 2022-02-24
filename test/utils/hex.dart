import 'package:convert/convert.dart';

class Hex {
  static String encode(List<int> input) {
    return hex.encode(input);
  }

  static List<int> decode(String encoded) {
    return hex.decode(encoded);
  }
}
