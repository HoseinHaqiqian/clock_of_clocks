import 'package:flutter/material.dart';
import 'package:clock_of_clocks/models/tiny_clock.dart';
import 'package:clock_of_clocks/ui/paint/clock_view_painter.dart';
import 'package:clock_of_clocks/ui/widgets/small_clock.dart';

class ClockView extends StatelessWidget {
  List<TinyClock> clocks;

  ClockView({Key? key, required this.clocks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < clocks.length / 7; i++)
          Row(
            children: [
              for (int j = i * 6; j < (i * 6) + 6; j++)
                NumberClock(tinyClock: clocks[j])
            ],
          )
      ],
    );
  }
}
