import 'dart:math';
import 'package:flutter/material.dart';
import '../models/pattern_models.dart';

class GarmentPreviewPainter extends CustomPainter {
  final Measurements measurements;
  final StyleSelections styleSelections;

  GarmentPreviewPainter({
    required this.measurements,
    required this.styleSelections,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1f2937)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fillPaint = Paint()
      ..color = const Color(0xFFFFFBF5)
      ..style = PaintingStyle.fill;

    final gridPaint = Paint()
      ..color = const Color(0xFFE5E7EB)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    // Draw background grid for pattern paper effect
    _drawPatternGrid(canvas, size, gridPaint);

    // Calculate proportions
    final scale = min(size.width, size.height) / 300;
    final bustWidth = (measurements.bust / 4) * scale;
    final waistWidth = (measurements.waist / 4) * scale;
    final hipWidth = (measurements.hip / 4) * scale;
    final shoulderWidth = (measurements.shoulder / 2) * scale;

    // Draw title
    _drawTitle(canvas, size);

    // Draw front bodice pattern piece
    _drawFrontBodice(canvas, size, paint, fillPaint, scale,
        shoulderWidth, bustWidth, waistWidth);

    // Draw front skirt pattern piece
    _drawFrontSkirt(canvas, size, paint, fillPaint, scale,
        waistWidth, hipWidth);

    // Draw measurement annotations
    _drawMeasurementAnnotations(canvas, size, scale);
  }

  void _drawPatternGrid(Canvas canvas, Size size, Paint gridPaint) {
    const gridSize = 20.0;

    // Draw vertical lines
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  void _drawTitle(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    textPainter.text = TextSpan(
      text: '${measurements.name} - PATTERN PIECES',
      style: const TextStyle(
        color: Color(0xFF374151),
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width / 2 - textPainter.width / 2, 20));
  }

  void _drawFrontBodice(Canvas canvas, Size size, Paint paint, Paint fillPaint,
      double scale, double shoulderWidth, double bustWidth, double waistWidth) {

    final bodiceX = size.width * 0.25;
    final bodiceY = size.height * 0.15;

    final armholeDepth = measurements.armhole * scale;
    final backLength = measurements.backLength * scale;

    final path = Path();

    // Start at center front neck
    path.moveTo(bodiceX, bodiceY);

    // Draw neckline based on style
    _drawPatternNeckline(path, bodiceX, bodiceY, shoulderWidth);

    // Shoulder line
    path.lineTo(bodiceX + shoulderWidth, bodiceY - 10);

    // Draw armhole
    if (styleSelections.sleeve == 'Sleeveless') {
      path.quadraticBezierTo(
        bodiceX + shoulderWidth + 5,
        bodiceY + armholeDepth / 2,
        bodiceX + bustWidth,
        bodiceY + armholeDepth,
      );
    } else {
      path.quadraticBezierTo(
        bodiceX + shoulderWidth + 10,
        bodiceY + armholeDepth / 2,
        bodiceX + bustWidth,
        bodiceY + armholeDepth,
      );
    }

    // Side seam to waist
    path.lineTo(bodiceX + waistWidth, bodiceY + backLength);

    // Waist line
    path.lineTo(bodiceX, bodiceY + backLength);

    // Center front line
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);

    // Draw center fold line
    _drawFoldLine(canvas, bodiceX, bodiceY, bodiceX, bodiceY + backLength);

    // Draw grain line
    _drawGrainLine(canvas, bodiceX + shoulderWidth / 2, bodiceY + 40,
        bodiceX + shoulderWidth / 2, bodiceY + backLength - 20);

    // Draw darts if applicable
    if (styleSelections.bodice == 'Dart Front' || styleSelections.bodice == 'Basic Fitted') {
      _drawDart(canvas, bodiceX + bustWidth * 0.6, bodiceY + armholeDepth + 10,
          bodiceX + waistWidth * 0.8, bodiceY + backLength - 5);
    }

    // Label
    _drawPatternLabel(canvas, 'BODICE DEPAN\n(Potong 1x atas Lipat)',
        bodiceX + shoulderWidth / 2, bodiceY + backLength / 2);
  }

  void _drawFrontSkirt(Canvas canvas, Size size, Paint paint, Paint fillPaint,
      double scale, double waistWidth, double hipWidth) {

    final skirtX = size.width * 0.6;
    final skirtY = size.height * 0.15;

    final hipDepth = 180.0 * scale;
    final skirtLength = 250.0 * scale;

    final path = Path();

    // Start at center front waist
    path.moveTo(skirtX, skirtY);

    // Waist to side seam
    path.lineTo(skirtX + waistWidth, skirtY);

    // Side seam - varies by skirt style
    switch (styleSelections.skirt) {
      case 'Straight':
        path.lineTo(skirtX + hipWidth, skirtY + hipDepth);
        path.lineTo(skirtX + hipWidth, skirtY + skirtLength);
        path.lineTo(skirtX, skirtY + skirtLength);
        break;
      case 'A-Line':
        path.lineTo(skirtX + hipWidth, skirtY + hipDepth);
        path.lineTo(skirtX + hipWidth + 40, skirtY + skirtLength);
        path.lineTo(skirtX, skirtY + skirtLength);
        break;
      case 'Flared':
        path.lineTo(skirtX + hipWidth, skirtY + hipDepth);
        path.quadraticBezierTo(
          skirtX + hipWidth + 30,
          skirtY + hipDepth + 50,
          skirtX + hipWidth + 80,
          skirtY + skirtLength,
        );
        path.lineTo(skirtX, skirtY + skirtLength);
        break;
      case 'Pencil':
        path.lineTo(skirtX + hipWidth, skirtY + hipDepth);
        path.lineTo(skirtX + hipWidth - 10, skirtY + skirtLength);
        path.lineTo(skirtX, skirtY + skirtLength);
        break;
      case 'Pleated':
      case 'Gathered':
        path.lineTo(skirtX + waistWidth * 1.8, skirtY);
        path.lineTo(skirtX + hipWidth + 40, skirtY + hipDepth);
        path.lineTo(skirtX + hipWidth + 40, skirtY + skirtLength);
        path.lineTo(skirtX, skirtY + skirtLength);
        break;
      default:
        path.lineTo(skirtX + hipWidth, skirtY + hipDepth);
        path.lineTo(skirtX + hipWidth, skirtY + skirtLength);
        path.lineTo(skirtX, skirtY + skirtLength);
    }

    // Center front line
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);

    // Draw center fold line
    _drawFoldLine(canvas, skirtX, skirtY, skirtX, skirtY + skirtLength);

    // Draw grain line
    _drawGrainLine(canvas, skirtX + waistWidth / 2, skirtY + 40,
        skirtX + waistWidth / 2, skirtY + skirtLength - 40);

    // Draw gathering marks for gathered/pleated skirts
    if (styleSelections.skirt == 'Gathered' || styleSelections.skirt == 'Pleated') {
      _drawGatheringMarks(canvas, skirtX, skirtY, skirtX + waistWidth * 1.8, skirtY);
    }

    // Label
    _drawPatternLabel(canvas, 'SKIRT DEPAN\n(Potong 1x atas Lipat)',
        skirtX + waistWidth / 2, skirtY + skirtLength / 2);
  }

  void _drawPatternNeckline(Path path, double x, double y, double shoulderWidth) {
    switch (styleSelections.neckline) {
      case 'Round':
        path.quadraticBezierTo(x + 15, y - 5, x + shoulderWidth * 0.4, y - 10);
        break;
      case 'V-Neck':
        path.lineTo(x + 15, y + 40);
        path.lineTo(x + shoulderWidth * 0.4, y - 5);
        break;
      case 'Square':
        path.lineTo(x + 25, y);
        path.lineTo(x + 25, y + 30);
        path.lineTo(x + shoulderWidth * 0.4, y + 30);
        path.lineTo(x + shoulderWidth * 0.4, y - 5);
        break;
      case 'Sweetheart':
        path.quadraticBezierTo(x + 10, y + 10, x + 20, y + 35);
        path.quadraticBezierTo(x + 30, y + 10, x + shoulderWidth * 0.4, y - 5);
        break;
      case 'Boat':
        path.lineTo(x + shoulderWidth * 0.4, y + 5);
        break;
      case 'Scoop':
        path.quadraticBezierTo(x + 15, y + 20, x + 20, y + 50);
        path.quadraticBezierTo(x + 30, y + 20, x + shoulderWidth * 0.4, y - 5);
        break;
      default:
        path.quadraticBezierTo(x + 15, y - 5, x + shoulderWidth * 0.4, y - 10);
    }
  }

  void _drawFoldLine(Canvas canvas, double x1, double y1, double x2, double y2) {
    final foldPaint = Paint()
      ..color = const Color(0xFF6b7280)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    // Draw dash-dot-dash pattern
    final path = Path();
    final totalLength = sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
    final angle = atan2(y2 - y1, x2 - x1);

    double distance = 0;
    while (distance < totalLength) {
      final startX = x1 + cos(angle) * distance;
      final startY = y1 + sin(angle) * distance;

      // Dash
      final dashEnd = min(distance + 10, totalLength);
      path.moveTo(startX, startY);
      path.lineTo(x1 + cos(angle) * dashEnd, y1 + sin(angle) * dashEnd);
      distance = dashEnd + 3;

      if (distance < totalLength) {
        // Dot
        canvas.drawCircle(
          Offset(x1 + cos(angle) * distance, y1 + sin(angle) * distance),
          1.5,
          foldPaint,
        );
        distance += 3;
      }
    }

    canvas.drawPath(path, foldPaint);
  }

  void _drawGrainLine(Canvas canvas, double x1, double y1, double x2, double y2) {
    final grainPaint = Paint()
      ..color = const Color(0xFF374151)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    // Draw arrow line
    canvas.drawLine(Offset(x1, y1), Offset(x2, y2), grainPaint);

    // Draw arrow heads
    final arrowSize = 8.0;
    final angle = atan2(y2 - y1, x2 - x1);

    // Top arrow
    final topArrow = Path();
    topArrow.moveTo(x1, y1);
    topArrow.lineTo(x1 + cos(angle + 2.8) * arrowSize, y1 + sin(angle + 2.8) * arrowSize);
    topArrow.moveTo(x1, y1);
    topArrow.lineTo(x1 + cos(angle - 2.8) * arrowSize, y1 + sin(angle - 2.8) * arrowSize);
    canvas.drawPath(topArrow, grainPaint);

    // Bottom arrow
    final bottomArrow = Path();
    bottomArrow.moveTo(x2, y2);
    bottomArrow.lineTo(x2 - cos(angle + 2.8) * arrowSize, y2 - sin(angle + 2.8) * arrowSize);
    bottomArrow.moveTo(x2, y2);
    bottomArrow.lineTo(x2 - cos(angle - 2.8) * arrowSize, y2 - sin(angle - 2.8) * arrowSize);
    canvas.drawPath(bottomArrow, grainPaint);
  }

  void _drawDart(Canvas canvas, double topX, double topY, double bottomX, double bottomY) {
    final dartPaint = Paint()
      ..color = const Color(0xFF6b7280)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(topX - 8, topY);
    path.lineTo(bottomX, bottomY);
    path.lineTo(topX + 8, topY);

    canvas.drawPath(path, dartPaint);
  }

  void _drawGatheringMarks(Canvas canvas, double x1, double y1, double x2, double y2) {
    final gatherPaint = Paint()
      ..color = const Color(0xFF6b7280)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    const markCount = 8;
    final spacing = (x2 - x1) / markCount;

    for (int i = 0; i <= markCount; i++) {
      final x = x1 + i * spacing;
      canvas.drawLine(Offset(x, y1 - 5), Offset(x, y1 + 5), gatherPaint);
    }
  }

  void _drawPatternLabel(Canvas canvas, String text, double x, double y) {
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    textPainter.text = TextSpan(
      text: text,
      style: const TextStyle(
        color: Color(0xFF6b7280),
        fontSize: 11,
        fontFamily: 'Inter',
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));
  }

  void _drawMeasurementAnnotations(Canvas canvas, Size size, double scale) {
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    );

    final annotations = [
      'Bust: ${measurements.bust.toStringAsFixed(1)} ${measurements.unit}',
      'Waist: ${measurements.waist.toStringAsFixed(1)} ${measurements.unit}',
      'Hip: ${measurements.hip.toStringAsFixed(1)} ${measurements.unit}',
      'Shoulder: ${measurements.shoulder.toStringAsFixed(1)} ${measurements.unit}',
      'Back Length: ${measurements.backLength.toStringAsFixed(1)} ${measurements.unit}',
    ];

    double yOffset = size.height - 120;
    for (final annotation in annotations) {
      textPainter.text = TextSpan(
        text: annotation,
        style: const TextStyle(
          color: Color(0xFF374151),
          fontSize: 10,
          fontFamily: 'Inter',
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(20, yOffset));
      yOffset += 18;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
