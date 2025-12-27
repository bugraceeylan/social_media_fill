import 'dart:ui';

import 'package:flutter/material.dart';

class SquareBorderPainter extends CustomPainter {
  final double progress;
  SquareBorderPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final Paint progressPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    final RRect roundedRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(10),
    );

    final Path borderPath = Path()..addRRect(roundedRect);

    // **Arka plan çerçevesi**
    canvas.drawPath(borderPath, backgroundPaint);

    // **İlerleme çerçevesi**: Animasyon ilerledikçe yeşil renk ile çizilecek
    PathMetric pathMetric = borderPath.computeMetrics().first;
    Path progressPath =
        pathMetric.extractPath(0.0, pathMetric.length * progress);

    canvas.drawPath(progressPath, progressPaint);
  }

  @override
  bool shouldRepaint(covariant SquareBorderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
