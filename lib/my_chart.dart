import 'package:flutter/material.dart';

class VerticalBarChart extends StatelessWidget {
  final List<int> data;
  final List<String> categories;

  VerticalBarChart({required this.data, required this.categories});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BarChartPainter(categories, data),
    );
  }
}

class BarChartPainter extends CustomPainter {
  final List<int> data;
  final List<String> categories;

  BarChartPainter(this.categories, this.data);

  @override
  void paint(Canvas canvas, Size size) {
    // Define the chart area
    final chartWidth = size.width * 0.9;
    final chartHeight = size.height * 0.6;
    final chartRect = Rect.fromLTWH((size.width - chartWidth) / 2, (size.height - chartHeight) / 2, chartWidth, chartHeight);

    // Define the paint
    final paint = Paint()..color = Color(0xFF2D2D33);
    final paintBackground = Paint()..color = Color(0xFF222225);
    final paintXy = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    // Determine the maximum value in the data
    final maxValue = data.reduce((value, element) => value > element ? value : element);
    // Define the bar width and spacing
    final barWidth = chartWidth / data.length / 1.2;
    final barSpacing = 18.42;

    //Draw Boundaries
    canvas.drawLine(Offset(0, chartRect.bottom), Offset(size.width + 10, chartRect.bottom), paintXy);
    canvas.drawLine(Offset(0, chartRect.bottom), Offset(0, chartRect.top), paintXy);

    double max = 0;

    for (int i = 0; i < data.length; i++) {
      max += data[i];
    }

    // Draw the bars and labels
    for (int i = 0; i < categories.length; i++) {
      //

      final barHeightFactor = max / chartHeight;
      final barHeight = data[i] / barHeightFactor;
      //
      // final barHeight = data[i] / maxValue * chartHeight;
      final x = chartRect.left + i * (barWidth + barSpacing) - 5;
      final y = chartRect.bottom - barHeight;
      //To fit on X axis we need to subtract 1 from barHeight
      final barRect = Rect.fromLTWH(x, y, barWidth, barHeight - 2);
      final fullBarRect = Rect.fromLTWH(x, chartRect.top, barWidth, chartHeight - 2);
      final border = Radius.circular(3);
      final barRRect = RRect.fromRectAndRadius(barRect, border);
      canvas.drawRect(fullBarRect, paintBackground);
      canvas.drawRRect(barRRect, paint);

      //Draw the labels
      final label = categories[i];
      final textPainter = TextPainter(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: label,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              letterSpacing: 0.1,
            )),
        textDirection: TextDirection.ltr,
        maxLines: 2,
      );
      textPainter.layout(minWidth: 0, maxWidth: barWidth + (barSpacing * 2));

      // final textX = x - textPainter.width / data.length ;
      final textX = x + barWidth / 2 - textPainter.width / 2;
      final textY = barRect.bottom + 10;
      textPainter.paint(canvas, Offset(textX, textY));
      // textPainter.paint(canvas, Offset(textX, chartRect.bottom + 10));

      //Draw the values

      final value = data[i].toString();
      final valuePainter = TextPainter(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: value,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            )),
        textDirection: TextDirection.ltr,
        maxLines: 2,
      );
      valuePainter.layout(minWidth: 0, maxWidth: barWidth + barSpacing);

      final valueX = x + barWidth / 2 - valuePainter.width / 2;
      //Write the value on middle of the bar
      final valueY = barRect.bottom - barHeight / 2 - valuePainter.height / 2;

      valuePainter.paint(canvas, Offset(valueX, valueY));

// canvas.drawLine(Offset(0, barHeightFactor), Offset(0, barHeight), new Paint()..color = Colors.red);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
