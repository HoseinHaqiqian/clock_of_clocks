import 'package:flutter/material.dart';

class TinyClock {
  static final TinyClock VERTICAL = TinyClock(hour: 0, minutes: 6);
  static final TinyClock HORIZONTAL = TinyClock(hour: 9, minutes: 3);
  static final TinyClock topLeft = TinyClock(hour: 0, minutes: 9);
  static final TinyClock topRight = TinyClock(hour: 0, minutes: 3);
  static final TinyClock NON = TinyClock(hour: 2, minutes: 2);
  static final TinyClock bottomLeft = TinyClock(hour: 6, minutes: 9);
  static final TinyClock bottomRight = TinyClock(hour: 6, minutes: 3);

  int hour;
  int minutes;

  TinyClock({required this.hour, required this.minutes});

  @override
  TinyClock operator *(other) {
    return TinyClock(
        hour: (hour * other).toInt(), minutes: (minutes * other).toInt());
  }

  bool equal(TinyClock tinyClock) {
    return hour == tinyClock.hour || minutes == tinyClock.minutes;
  }
}