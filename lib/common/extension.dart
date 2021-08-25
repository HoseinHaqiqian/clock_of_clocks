
import 'package:clock_of_clocks/models/clock_builder.dart';
import 'package:clock_of_clocks/models/tiny_clock.dart';

extension Converter on int {
  List<TinyClock> getValue() {
    switch (this) {
      case 0:
        return ClockBuilder.ZERO;
      case 1:
        return ClockBuilder.One;
      case 2:
        return ClockBuilder.Two;
      case 3:
        return ClockBuilder.Three;
      case 4:
        return ClockBuilder.Four;
      case 5:
        return ClockBuilder.Five;
      case 6:
        return ClockBuilder.SIX;
      case 7:
        return ClockBuilder.SEVEN;
      case 8:
        return ClockBuilder.EGHIT;
      case 9:
        return ClockBuilder.NINE;
    }
    return ClockBuilder.DIVIDER;
  }

  List<int> splitter() {
    if ((this / 10) >= 1) {
      toString().split("").map((e) => int.parse(e)).toList().forEach((element) {
      });
      return toString().split("").map((e) => int.parse(e)).toList();
    } else {
      return [0,this];
    }
  }
}
