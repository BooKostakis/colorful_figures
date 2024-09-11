import 'dart:math';
import 'package:flutter/material.dart';

Color randomColor() {
  final random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1,
  );
}

class StarPainter extends CustomPainter {
  final int starPoints;
  final Color color;

  StarPainter({required this.starPoints, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final outerRadius = min(centerX, centerY) * 1.1;
    final innerRadius =
        outerRadius * 0.75; // Отношение радиусов для 5-конечной звезды

    final path = Path();
    final angle = 2 * pi / starPoints;

    for (var i = 0; i < starPoints; i++) {
      final x = centerX + outerRadius * cos(angle * i);
      final y = centerY + outerRadius * sin(angle * i);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      final innerX = centerX + innerRadius * cos(angle * (i + 0.5));
      final innerY = centerY + innerRadius * sin(angle * (i + 0.5));

      path.lineTo(innerX, innerY);
    }

    path.close();

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class RainbowStarStack extends StatelessWidget {
  final double maxWidth;
  final double maxHeigth;
  final double maxBorderRadius;
  final int colorsQuantity;
  ClipPath? clipPath;

  RainbowStarStack({
    super.key,
    required this.maxWidth,
    required this.maxHeigth,
    required this.maxBorderRadius,
    required this.colorsQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: List.generate(
        colorsQuantity,
        (index) => CustomPaint(
          size: Size(maxWidth - index * (maxWidth / colorsQuantity),
              maxHeigth - index * (maxHeigth / colorsQuantity)),
          painter: StarPainter(
            starPoints: 12, // Изменяем количество точек для звезды
            color: randomColor(),
          ),
        ),
      ),
    );
  }
}
