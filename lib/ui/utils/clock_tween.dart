import 'package:flutter/animation.dart';
import 'package:clock_of_clocks/models/tiny_clock.dart';

class ClockTween extends Tween<TinyClock?> {
  ClockTween({TinyClock? begin, TinyClock? end})
      : super(begin: begin, end: end);

  @override
  TinyClock? lerp(double t) {
    return TinyClock(
      hour: (begin!.hour + (end!.hour - begin!.hour) * t),
      minutes: (begin!.minutes + (end!.minutes - begin!.minutes) * t),
    );
  }
}
