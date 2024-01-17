import 'dart:math';

extension RoundDouble on double {
  double roundDouble(int places) {
    double mod = pow(10.0, places) as double;
    return ((this * mod).round().toDouble() / mod);
  }
}