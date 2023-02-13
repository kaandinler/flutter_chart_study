import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class MyBarChart extends StatelessWidget {
  final List<double> data;
  final List<String> labels;
  final double maxY;

  MyBarChart({required this.data, required this.labels, required this.maxY});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: BarChartPainter(data, labels, maxY),
    );
  }
}

class BarChartPainter extends CustomPainter {
  final List<double> data;
  final List<String> labels;
  final double maxY;

  BarChartPainter(this.data, this.labels, this.maxY);

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = size.width / (data.length * 2);
    final barPaint = Paint()..color = Colors.blue;
    final axisPaint = Paint()..color = Colors.red;

    // Draw X axis labels and ticks
    // final xLabelStyle = ui.TextStyle(color: Colors.white, fontSize: 10) as TextStyle?;
    final xLabelMargin = 5;
    final xTickSize = 3;
    for (int i = 0; i < data.length; i++) {
      final x = i * barWidth * 2 + barWidth;
      final label = labels[i];
      final textSpan = TextSpan(text: label, style: TextStyle(color: Colors.white, fontSize: 10));
      final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
      textPainter.layout();
      final textX = x - textPainter.width / 2;
      final textY = size.height - textPainter.height - xLabelMargin;
      textPainter.paint(canvas, Offset(textX, textY));
      canvas.drawLine(Offset(x, size.height), Offset(x, size.height - xTickSize), barPaint);
    }

    // Draw Y axis labels and ticks
    // final yLabelStyle = ui.TextStyle(color: Colors.black, fontSize: 10) as TextStyle?;
    final yLabelMargin = 5;
    final yTickSize = 3;
    final yTickCount = 5;
    final yTickInterval = maxY / yTickCount;
    for (int i = 0; i <= yTickCount; i++) {
      final y = size.height - (i / yTickCount) * size.height;
      final label = (yTickCount - i) * yTickInterval;
      final textSpan = TextSpan(text: label.toString(), style: TextStyle(color: Colors.white, fontSize: 10));
      final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
      textPainter.layout();
      final textX = yLabelMargin;
      final textY = y - textPainter.height / 2;
      textPainter.paint(canvas, Offset(textX.toDouble(), textY));

      canvas.drawLine(Offset(0, y), Offset(yTickSize.toDouble(), y), axisPaint);
    }

    // Draw bars
    final barMargin = barWidth;
    for (int i = 0; i < data.length; i++) {
      final x = i * barWidth * 2 + barWidth;
      final y = size.height * (1 - data[i] / maxY);
      final rect = Rect.fromLTWH(x - barWidth / 2 + barMargin, y, barWidth - barMargin * 2, size.height - y);
      canvas.drawRect(rect, barPaint);
    }
  }

  @override
  bool shouldRepaint(BarChartPainter oldDelegate) {
    return data != oldDelegate.data || labels != oldDelegate.labels || maxY != oldDelegate.maxY;
  }
}
