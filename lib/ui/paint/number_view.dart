import 'package:clock_of_clocks/ui/utils/clock_tween.dart';
import 'package:flutter/material.dart';
import 'package:clock_of_clocks/models/tiny_clock.dart';
import 'package:clock_of_clocks/ui/paint/number_view_painter.dart';
import 'package:flutter/widgets.dart';

class NumberView extends StatelessWidget {
  List<TinyClock> clocks;

  NumberView({Key? key, required this.clocks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < clocks.length / 7; i++)
          Row(
            children: [
              for (int j = i * 6; j < (i * 6) + 6; j++)
                _buildNumber(context, clocks[j])
            ],
          )
      ],
    );
  }

  _buildNumber(BuildContext context, TinyClock tinyClock) {
    return TweenAnimationBuilder<TinyClock?>(
      tween: ClockTween(begin: null, end: tinyClock),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return  CustomPaint(
          painter: ClockViewPainter(tinyClock: value!),
          child: SizedBox(
            width: MediaQuery.of(context).size.width/30,
            height: MediaQuery.of(context).size.width/30,
          ),
        );
      },
    );
  }
}
