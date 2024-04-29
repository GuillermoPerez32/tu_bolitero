import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';

class CruzSuerteScreen extends StatelessWidget {
  const CruzSuerteScreen({
    super.key,
    required this.result,
  });

  final LotteryResult result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cruz de la Suerte'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text(
                result.fecha.toString().split(' ')[0],
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 50),
              CustomPaint(
                size: const Size(400, 400),
                painter: CircleWithDiagonalsPainter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleWithDiagonalsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    Paint linePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    Paint textPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    double linePadding = 40;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(size.width / 2, size.height / 2) - 50;

    canvas.drawCircle(Offset(centerX, centerY), radius, circlePaint);

    canvas.drawLine(
      Offset(linePadding, linePadding),
      Offset(size.width - linePadding, size.height - linePadding),
      linePaint,
    );
    canvas.drawLine(
      Offset(size.width - linePadding, linePadding),
      Offset(linePadding, size.height - linePadding),
      linePaint,
    );

    final numbers = ['1', '2', '3', '4', '5', '6', '7', '8'];
    final offsets = [
      Offset(0, 0),
      Offset(size.width - 30, 0),
      Offset(size.width - 30, size.height - 30),
      Offset(0, size.height - 30),
      Offset(centerX - (centerX / 2), centerY - 12),
      Offset(centerX + (centerX / 2) - 15, centerY - 12),
      Offset(centerX - 10, centerY - (centerY / 2)),
      Offset(centerX - 10, centerY + (centerY / 2) - 30),
    ];

    for (var i = 0; i < offsets.length; i++) {
      TextSpan textSpan = TextSpan(
        text: numbers[i],
        style: const TextStyle(
          fontSize: 32,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Merienda',
        ),
      );
      TextPainter textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, offsets[i]);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
