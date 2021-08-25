import 'package:flutter/material.dart';
import 'package:clock_of_clocks/models/tiny_clock.dart';
import 'package:clock_of_clocks/ui/paint/clock_view_painter.dart';
import 'package:clock_of_clocks/ui/utils/clock_tween.dart';

class NumberClock extends StatefulWidget {
  TinyClock tinyClock;

  NumberClock({Key? key, required this.tinyClock}) : super(key: key);

  @override
  State<NumberClock> createState() => _NumberClockState();
}

class _NumberClockState extends State<NumberClock> {
  TinyClock? lastClock;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<TinyClock?>(
      tween: ClockTween(begin: lastClock, end: widget.tinyClock),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return CustomPaint(
          painter: ClockViewPainter(tinyClock: value!),
          child: SizedBox.square(
            dimension: MediaQuery.of(context).size.width / 30,
          ),
        );
      },
    );
  }
}
