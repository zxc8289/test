import 'package:balanstate_test02/const/const.dart';
import 'package:flutter/material.dart';

class DownTrianglePainter extends CustomPainter {
  final Paint trianglePaint;

  DownTrianglePainter() : trianglePaint = Paint()..color = PRIMARY_COLOR;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height) // start at bottom left corner
      ..lineTo(size.width, size.height) // draw line to bottom right corner
      ..lineTo(size.width / 2, 0) // draw line to top center
      ..close(); // close the path

    canvas.drawPath(path, trianglePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
