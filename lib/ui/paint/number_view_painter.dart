import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:clock_of_clocks/models/tiny_clock.dart';

class ClockViewPainter extends CustomPainter {
  TinyClock tinyClock;

  ClockViewPainter({required this.tinyClock});

  final mPaint = Paint()
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..color = Colors.black.withOpacity(0.2)
    ..maskFilter = MaskFilter.blur(BlurStyle.inner, 0.2)
    ..strokeWidth = 0.5;

  final handlePaint = Paint()
    ..color = Colors.black
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 1.5;

  late Offset circleOffset;
  late double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final firstHandle = tinyClock.hour * ((360 / 180) * math.pi / 12) + math.pi;
    final secondHandle =
        tinyClock.minutes * ((360 / 180) * math.pi / 12) + math.pi;
    circleOffset = Offset(size.height / 2, size.width / 2);
    radius = size.width / 2;
    canvas.drawCircle(circleOffset, radius, mPaint);
    drawHandle(canvas, firstHandle, size);
    drawHandle(canvas, secondHandle, size);
  }

  @override
  bool shouldRepaint(covariant ClockViewPainter oldDelegate) {
    return oldDelegate.tinyClock.minutes != tinyClock.minutes ||
        oldDelegate.tinyClock.hour != oldDelegate.tinyClock.hour;
  }

  void drawHandle(Canvas canvas, double handle, Size size) {
    canvas.save();
    canvas.translate(circleOffset.dx, circleOffset.dy);
    canvas.rotate(handle);
    canvas.drawLine(const Offset(0, 0), Offset(0, radius), handlePaint);
    canvas.restore();
  }
}
