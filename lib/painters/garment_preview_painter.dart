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
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fillPaint = Paint()
      ..color = const Color(0xFFFFFBF5)
      ..style = PaintingStyle.fill;

    final accentPaint = Paint()
      ..color = const Color(0xFFe9d5ff)
      ..style = PaintingStyle.fill;

    // Calculate center and scale
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final scale = min(size.width, size.height) / 400;

    // Calculate garment proportions
    final shoulderWidth = measurements.shoulder * scale * 0.4;
    final bustWidth = measurements.bust / 4 * scale * 0.8;
    final waistWidth = measurements.waist / 4 * scale * 0.8;
    final hipWidth = measurements.hip / 4 * scale * 0.8;
    
    // Draw title
    _drawTitle(canvas, size);

    // Draw complete garment from top to bottom
    canvas.save();
    canvas.translate(centerX, centerY - size.height * 0.15);

    // 1. Draw sleeves first (behind bodice)
    _drawCompleteSleeves(canvas, paint, fillPaint, shoulderWidth, scale);

    // 2. Draw bodice
    _drawCompleteBodice(canvas, paint, fillPaint, accentPaint, shoulderWidth, bustWidth, waistWidth, scale);

    // 3. Draw collar (on top of bodice)
    _drawCompleteCollar(canvas, paint, fillPaint, accentPaint, shoulderWidth, scale);

    // 4. Draw skirt
    _drawCompleteSkirt(canvas, paint, fillPaint, waistWidth, hipWidth, scale);

    canvas.restore();

    // Draw style summary
    _drawStyleSummary(canvas, size);
  }

  void _drawTitle(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    textPainter.text = TextSpan(
      text: '${measurements.name.isNotEmpty ? measurements.name : "Preview"} - GARMENT DESIGN',
      style: const TextStyle(
        color: Color(0xFF374151),
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width / 2 - textPainter.width / 2, 15));
  }

  void _drawCompleteSleeves(Canvas canvas, Paint paint, Paint fillPaint, double shoulderWidth, double scale) {
    final sleeveLength = measurements.sleeveLength * scale * 0.6;
    final armholeDepth = measurements.armhole * scale * 0.8;
    
    switch (styleSelections.sleeve) {
      case 'Sleeveless':
        // No sleeves, just draw armhole
        break;
        
      case 'Short':
        // Left sleeve
        final leftSleevePath = Path();
        leftSleevePath.moveTo(-shoulderWidth - 5, 10);
        leftSleevePath.quadraticBezierTo(
          -shoulderWidth - 25,
          20,
          -shoulderWidth - 20,
          50,
        );
        leftSleevePath.lineTo(-shoulderWidth - 15, 50);
        leftSleevePath.quadraticBezierTo(
          -shoulderWidth - 20,
          25,
          -shoulderWidth, 
          armholeDepth + 10,
        );
        leftSleevePath.close();
        canvas.drawPath(leftSleevePath, fillPaint);
        canvas.drawPath(leftSleevePath, paint);

        // Right sleeve
        final rightSleevePath = Path();
        rightSleevePath.moveTo(shoulderWidth + 5, 10);
        rightSleevePath.quadraticBezierTo(
          shoulderWidth + 25,
          20,
          shoulderWidth + 20,
          50,
        );
        rightSleevePath.lineTo(shoulderWidth + 15, 50);
        rightSleevePath.quadraticBezierTo(
          shoulderWidth + 20,
          25,
          shoulderWidth,
          armholeDepth + 10,
        );
        rightSleevePath.close();
        canvas.drawPath(rightSleevePath, fillPaint);
        canvas.drawPath(rightSleevePath, paint);
        break;
        
      case 'Long':
        // Left long sleeve
        final leftLongPath = Path();
        leftLongPath.moveTo(-shoulderWidth - 5, 10);
        leftLongPath.quadraticBezierTo(
          -shoulderWidth - 25,
          20,
          -shoulderWidth - 22,
          sleeveLength + 30,
        );
        leftLongPath.lineTo(-shoulderWidth - 17, sleeveLength + 30);
        leftLongPath.quadraticBezierTo(
          -shoulderWidth - 20,
          sleeveLength / 2,
          -shoulderWidth,
          armholeDepth + 10,
        );
        leftLongPath.close();
        canvas.drawPath(leftLongPath, fillPaint);
        canvas.drawPath(leftLongPath, paint);

        // Right long sleeve
        final rightLongPath = Path();
        rightLongPath.moveTo(shoulderWidth + 5, 10);
        rightLongPath.quadraticBezierTo(
          shoulderWidth + 25,
          20,
          shoulderWidth + 22,
          sleeveLength + 30,
        );
        rightLongPath.lineTo(shoulderWidth + 17, sleeveLength + 30);
        rightLongPath.quadraticBezierTo(
          shoulderWidth + 20,
          sleeveLength / 2,
          shoulderWidth,
          armholeDepth + 10,
        );
        rightLongPath.close();
        canvas.drawPath(rightLongPath, fillPaint);
        canvas.drawPath(rightLongPath, paint);
        break;
        
      case 'Puff':
        // Left puff sleeve
        final leftPuffPath = Path();
        leftPuffPath.moveTo(-shoulderWidth - 5, 10);
        leftPuffPath.quadraticBezierTo(
          -shoulderWidth - 40,
          15,
          -shoulderWidth - 35,
          40,
        );
        leftPuffPath.lineTo(-shoulderWidth - 15, 45);
        leftPuffPath.quadraticBezierTo(
          -shoulderWidth - 15,
          25,
          -shoulderWidth,
          armholeDepth + 10,
        );
        leftPuffPath.close();
        canvas.drawPath(leftPuffPath, fillPaint);
        canvas.drawPath(leftPuffPath, paint);

        // Right puff sleeve
        final rightPuffPath = Path();
        rightPuffPath.moveTo(shoulderWidth + 5, 10);
        rightPuffPath.quadraticBezierTo(
          shoulderWidth + 40,
          15,
          shoulderWidth + 35,
          40,
        );
        rightPuffPath.lineTo(shoulderWidth + 15, 45);
        rightPuffPath.quadraticBezierTo(
          shoulderWidth + 15,
          25,
          shoulderWidth,
          armholeDepth + 10,
        );
        rightPuffPath.close();
        canvas.drawPath(rightPuffPath, fillPaint);
        canvas.drawPath(rightPuffPath, paint);

        // Draw gathering lines
        final gatherPaint = Paint()
          ..color = const Color(0xFF9ca3af)
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke;
        for (int i = 0; i < 5; i++) {
          canvas.drawLine(
            Offset(-shoulderWidth - 30 + i * 3, 40),
            Offset(-shoulderWidth - 30 + i * 3, 45),
            gatherPaint,
          );
          canvas.drawLine(
            Offset(shoulderWidth + 20 + i * 3, 40),
            Offset(shoulderWidth + 20 + i * 3, 45),
            gatherPaint,
          );
        }
        break;
        
      case 'Bell':
        // Left bell sleeve
        final leftBellPath = Path();
        leftBellPath.moveTo(-shoulderWidth - 5, 10);
        leftBellPath.lineTo(-shoulderWidth - 20, 60);
        leftBellPath.lineTo(-shoulderWidth - 40, 100);
        leftBellPath.lineTo(-shoulderWidth - 30, 100);
        leftBellPath.lineTo(-shoulderWidth - 12, 65);
        leftBellPath.quadraticBezierTo(
          -shoulderWidth - 10,
          35,
          -shoulderWidth,
          armholeDepth + 10,
        );
        leftBellPath.close();
        canvas.drawPath(leftBellPath, fillPaint);
        canvas.drawPath(leftBellPath, paint);

        // Right bell sleeve
        final rightBellPath = Path();
        rightBellPath.moveTo(shoulderWidth + 5, 10);
        rightBellPath.lineTo(shoulderWidth + 20, 60);
        rightBellPath.lineTo(shoulderWidth + 40, 100);
        rightBellPath.lineTo(shoulderWidth + 30, 100);
        rightBellPath.lineTo(shoulderWidth + 12, 65);
        rightBellPath.quadraticBezierTo(
          shoulderWidth + 10,
          35,
          shoulderWidth,
          armholeDepth + 10,
        );
        rightBellPath.close();
        canvas.drawPath(rightBellPath, fillPaint);
        canvas.drawPath(rightBellPath, paint);
        break;
        
      case 'Cap':
        // Left cap sleeve
        final leftCapPath = Path();
        leftCapPath.moveTo(-shoulderWidth - 5, 10);
        leftCapPath.quadraticBezierTo(
          -shoulderWidth - 20,
          12,
          -shoulderWidth - 18,
          25,
        );
        leftCapPath.lineTo(-shoulderWidth - 10, 25);
        leftCapPath.quadraticBezierTo(
          -shoulderWidth - 12,
          15,
          -shoulderWidth,
          armholeDepth + 10,
        );
        leftCapPath.close();
        canvas.drawPath(leftCapPath, fillPaint);
        canvas.drawPath(leftCapPath, paint);

        // Right cap sleeve
        final rightCapPath = Path();
        rightCapPath.moveTo(shoulderWidth + 5, 10);
        rightCapPath.quadraticBezierTo(
          shoulderWidth + 20,
          12,
          shoulderWidth + 18,
          25,
        );
        rightCapPath.lineTo(shoulderWidth + 10, 25);
        rightCapPath.quadraticBezierTo(
          shoulderWidth + 12,
          15,
          shoulderWidth,
          armholeDepth + 10,
        );
        rightCapPath.close();
        canvas.drawPath(rightCapPath, fillPaint);
        canvas.drawPath(rightCapPath, paint);
        break;
    }
  }

  void _drawCompleteBodice(Canvas canvas, Paint paint, Paint fillPaint, Paint accentPaint, 
      double shoulderWidth, double bustWidth, double waistWidth, double scale) {
    
    final armholeDepth = measurements.armhole * scale * 0.8;
    final backLength = measurements.backLength * scale * 0.6;
    final neckDepth = 25.0;

    final bodicePath = Path();

    // Start from left shoulder
    bodicePath.moveTo(-shoulderWidth - 5, 10);

    // Draw neckline based on selection
    _drawNeckline(bodicePath, shoulderWidth, neckDepth);

    // Right shoulder line
    bodicePath.lineTo(shoulderWidth + 5, 10);

    // Right armhole
    if (styleSelections.sleeve == 'Sleeveless') {
      bodicePath.quadraticBezierTo(
        shoulderWidth + 15,
        armholeDepth / 2,
        bustWidth + 5,
        armholeDepth,
      );
    } else {
      bodicePath.lineTo(shoulderWidth, armholeDepth + 10);
    }

    // Apply bodice style variations
    switch (styleSelections.bodice) {
      case 'Princess Line':
        _drawPrincessLineBodice(canvas, paint, fillPaint, bodicePath, 
            shoulderWidth, bustWidth, waistWidth, armholeDepth, backLength);
        return;
        
      case 'Wrap Style':
        _drawWrapStyleBodice(canvas, paint, fillPaint, 
            shoulderWidth, bustWidth, waistWidth, armholeDepth, backLength);
        return;
        
      case 'Peplum':
        // Draw basic bodice first
        bodicePath.lineTo(waistWidth + 5, backLength - 10);
        bodicePath.lineTo(-waistWidth - 5, backLength - 10);
        
        if (styleSelections.sleeve == 'Sleeveless') {
          bodicePath.quadraticBezierTo(
            -bustWidth - 5,
            armholeDepth,
            -shoulderWidth - 15,
            armholeDepth / 2,
          );
        } else {
          bodicePath.lineTo(-shoulderWidth, armholeDepth + 10);
        }
        bodicePath.close();
        
        canvas.drawPath(bodicePath, fillPaint);
        canvas.drawPath(bodicePath, paint);
        
        // Draw peplum
        _drawPeplum(canvas, paint, accentPaint, waistWidth, backLength);
        return;
        
      default:
        // Basic fitted or dart front
        bodicePath.lineTo(waistWidth + 5, backLength - 10);
        bodicePath.lineTo(-waistWidth - 5, backLength - 10);
        
        if (styleSelections.sleeve == 'Sleeveless') {
          bodicePath.quadraticBezierTo(
            -bustWidth - 5,
            armholeDepth,
            -shoulderWidth - 15,
            armholeDepth / 2,
          );
        } else {
          bodicePath.lineTo(-shoulderWidth, armholeDepth + 10);
        }
        bodicePath.close();
        
        canvas.drawPath(bodicePath, fillPaint);
        canvas.drawPath(bodicePath, paint);
        
        // Draw darts if applicable
        if (styleSelections.bodice == 'Dart Front') {
          _drawBustDarts(canvas, paint, bustWidth, waistWidth, armholeDepth, backLength);
        }
    }
  }

  void _drawNeckline(Path path, double shoulderWidth, double neckDepth) {
    switch (styleSelections.neckline) {
      case 'Round':
        path.quadraticBezierTo(
          -shoulderWidth / 2, 
          -5,
          0, 
          0,
        );
        path.quadraticBezierTo(
          shoulderWidth / 2,
          -5,
          shoulderWidth + 5,
          10,
        );
        break;
        
      case 'V-Neck':
        path.lineTo(-shoulderWidth / 3, 5);
        path.lineTo(0, neckDepth + 10);
        path.lineTo(shoulderWidth / 3, 5);
        break;
        
      case 'Square':
        path.lineTo(-shoulderWidth / 2, 10);
        path.lineTo(-shoulderWidth / 2, neckDepth);
        path.lineTo(shoulderWidth / 2, neckDepth);
        path.lineTo(shoulderWidth / 2, 10);
        break;
        
      case 'Sweetheart':
        path.quadraticBezierTo(
          -shoulderWidth / 2,
          5,
          -shoulderWidth / 4,
          neckDepth - 5,
        );
        path.quadraticBezierTo(
          -10,
          neckDepth + 5,
          0,
          neckDepth - 8,
        );
        path.quadraticBezierTo(
          10,
          neckDepth + 5,
          shoulderWidth / 4,
          neckDepth - 5,
        );
        path.quadraticBezierTo(
          shoulderWidth / 2,
          5,
          shoulderWidth + 5,
          10,
        );
        break;
        
      case 'Boat':
        path.lineTo(0, 5);
        break;
        
      case 'Scoop':
        path.quadraticBezierTo(
          -shoulderWidth / 2,
          10,
          0,
          neckDepth + 15,
        );
        path.quadraticBezierTo(
          shoulderWidth / 2,
          10,
          shoulderWidth + 5,
          10,
        );
        break;
        
      default:
        path.quadraticBezierTo(
          0,
          -5,
          shoulderWidth + 5,
          10,
        );
    }
  }

  void _drawCompleteCollar(Canvas canvas, Paint paint, Paint fillPaint, Paint accentPaint, 
      double shoulderWidth, double scale) {
    
    switch (styleSelections.collar) {
      case 'No Collar':
        // No collar to draw
        break;
        
      case 'Shirt Collar':
        final collarPath = Path();
        collarPath.moveTo(-shoulderWidth, -5);
        collarPath.lineTo(-shoulderWidth - 10, 15);
        collarPath.lineTo(-15, 15);
        collarPath.lineTo(-10, 5);
        collarPath.lineTo(10, 5);
        collarPath.lineTo(15, 15);
        collarPath.lineTo(shoulderWidth + 10, 15);
        collarPath.lineTo(shoulderWidth, -5);
        collarPath.lineTo(shoulderWidth / 2, -10);
        collarPath.lineTo(-shoulderWidth / 2, -10);
        collarPath.close();
        
        canvas.drawPath(collarPath, accentPaint);
        canvas.drawPath(collarPath, paint);
        
        // Draw collar fold line
        final foldPaint = Paint()
          ..color = const Color(0xFF6b7280)
          ..strokeWidth = 1.5
          ..style = PaintingStyle.stroke;
        canvas.drawLine(Offset(-shoulderWidth, 5), Offset(shoulderWidth, 5), foldPaint);
        break;
        
      case 'Peter Pan':
        final leftCollar = Path();
        leftCollar.moveTo(-10, 10);
        leftCollar.quadraticBezierTo(
          -shoulderWidth / 2,
          -5,
          -shoulderWidth - 5,
          10,
        );
        leftCollar.quadraticBezierTo(
          -shoulderWidth,
          25,
          -shoulderWidth / 2,
          30,
        );
        leftCollar.lineTo(-15, 20);
        leftCollar.close();
        
        final rightCollar = Path();
        rightCollar.moveTo(10, 10);
        rightCollar.quadraticBezierTo(
          shoulderWidth / 2,
          -5,
          shoulderWidth + 5,
          10,
        );
        rightCollar.quadraticBezierTo(
          shoulderWidth,
          25,
          shoulderWidth / 2,
          30,
        );
        rightCollar.lineTo(15, 20);
        rightCollar.close();
        
        canvas.drawPath(leftCollar, accentPaint);
        canvas.drawPath(leftCollar, paint);
        canvas.drawPath(rightCollar, accentPaint);
        canvas.drawPath(rightCollar, paint);
        break;
        
      case 'Mandarin':
        final mandarinPath = Path();
        mandarinPath.moveTo(-shoulderWidth / 2, -5);
        mandarinPath.lineTo(-shoulderWidth, 5);
        mandarinPath.lineTo(-shoulderWidth, 15);
        mandarinPath.lineTo(shoulderWidth, 15);
        mandarinPath.lineTo(shoulderWidth, 5);
        mandarinPath.lineTo(shoulderWidth / 2, -5);
        mandarinPath.close();
        
        canvas.drawPath(mandarinPath, accentPaint);
        canvas.drawPath(mandarinPath, paint);
        break;
        
      case 'Shawl':
        final shawlPath = Path();
        shawlPath.moveTo(0, -10);
        shawlPath.quadraticBezierTo(
          -shoulderWidth / 2,
          -5,
          -shoulderWidth - 10,
          20,
        );
        shawlPath.quadraticBezierTo(
          -shoulderWidth - 5,
          35,
          -shoulderWidth / 2,
          45,
        );
        shawlPath.lineTo(-20, 35);
        shawlPath.lineTo(-15, 15);
        shawlPath.lineTo(-10, 10);
        shawlPath.lineTo(10, 10);
        shawlPath.lineTo(15, 15);
        shawlPath.lineTo(20, 35);
        shawlPath.lineTo(shoulderWidth / 2, 45);
        shawlPath.quadraticBezierTo(
          shoulderWidth + 5,
          35,
          shoulderWidth + 10,
          20,
        );
        shawlPath.quadraticBezierTo(
          shoulderWidth / 2,
          -5,
          0,
          -10,
        );
        shawlPath.close();
        
        canvas.drawPath(shawlPath, accentPaint);
        canvas.drawPath(shawlPath, paint);
        break;
    }
  }

  void _drawCompleteSkirt(Canvas canvas, Paint paint, Paint fillPaint, 
      double waistWidth, double hipWidth, double scale) {
    
    final backLength = measurements.backLength * scale * 0.6;
    final skirtLength = 140.0 * scale;
    final hipDepth = 40.0 * scale;
    
    final skirtPath = Path();
    
    switch (styleSelections.skirt) {
      case 'Straight':
        skirtPath.moveTo(-waistWidth - 5, backLength - 10);
        skirtPath.lineTo(-hipWidth - 5, backLength - 10 + hipDepth);
        skirtPath.lineTo(-hipWidth - 5, backLength - 10 + skirtLength);
        skirtPath.lineTo(hipWidth + 5, backLength - 10 + skirtLength);
        skirtPath.lineTo(hipWidth + 5, backLength - 10 + hipDepth);
        skirtPath.lineTo(waistWidth + 5, backLength - 10);
        skirtPath.close();
        break;
        
      case 'A-Line':
        skirtPath.moveTo(-waistWidth - 5, backLength - 10);
        skirtPath.lineTo(-hipWidth - 5, backLength - 10 + hipDepth);
        skirtPath.lineTo(-hipWidth - 25, backLength - 10 + skirtLength);
        skirtPath.lineTo(hipWidth + 25, backLength - 10 + skirtLength);
        skirtPath.lineTo(hipWidth + 5, backLength - 10 + hipDepth);
        skirtPath.lineTo(waistWidth + 5, backLength - 10);
        skirtPath.close();
        break;
        
      case 'Flared':
        skirtPath.moveTo(-waistWidth - 5, backLength - 10);
        skirtPath.lineTo(-hipWidth - 5, backLength - 10 + hipDepth);
        skirtPath.quadraticBezierTo(
          -hipWidth - 30,
          backLength - 10 + hipDepth + 40,
          -hipWidth - 50,
          backLength - 10 + skirtLength,
        );
        skirtPath.lineTo(hipWidth + 50, backLength - 10 + skirtLength);
        skirtPath.quadraticBezierTo(
          hipWidth + 30,
          backLength - 10 + hipDepth + 40,
          hipWidth + 5,
          backLength - 10 + hipDepth,
        );
        skirtPath.lineTo(waistWidth + 5, backLength - 10);
        skirtPath.close();
        break;
        
      case 'Pleated':
        skirtPath.moveTo(-waistWidth - 5, backLength - 10);
        skirtPath.lineTo(-hipWidth - 5, backLength - 10 + hipDepth);
        skirtPath.lineTo(-hipWidth - 5, backLength - 10 + skirtLength);
        skirtPath.lineTo(hipWidth + 5, backLength - 10 + skirtLength);
        skirtPath.lineTo(hipWidth + 5, backLength - 10 + hipDepth);
        skirtPath.lineTo(waistWidth + 5, backLength - 10);
        skirtPath.close();
        
        canvas.drawPath(skirtPath, fillPaint);
        canvas.drawPath(skirtPath, paint);
        
        // Draw pleat lines
        final pleatPaint = Paint()
          ..color = const Color(0xFF9ca3af)
          ..strokeWidth = 1.5
          ..style = PaintingStyle.stroke;
        
        for (int i = 1; i < 6; i++) {
          final x = -waistWidth + (i * waistWidth * 2 / 6);
          canvas.drawLine(
            Offset(x, backLength - 10),
            Offset(x, backLength - 10 + skirtLength),
            pleatPaint,
          );
        }
        return;
        
      case 'Gathered':
        skirtPath.moveTo(-waistWidth - 5, backLength - 10);
        skirtPath.lineTo(-hipWidth - 15, backLength - 10 + hipDepth);
        skirtPath.lineTo(-hipWidth - 15, backLength - 10 + skirtLength);
        skirtPath.lineTo(hipWidth + 15, backLength - 10 + skirtLength);
        skirtPath.lineTo(hipWidth + 15, backLength - 10 + hipDepth);
        skirtPath.lineTo(waistWidth + 5, backLength - 10);
        skirtPath.close();
        
        canvas.drawPath(skirtPath, fillPaint);
        canvas.drawPath(skirtPath, paint);
        
        // Draw gathering marks at waist
        final gatherPaint = Paint()
          ..color = const Color(0xFF9ca3af)
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke;
        
        for (int i = 0; i < 15; i++) {
          final x = -waistWidth + (i * waistWidth * 2 / 15);
          canvas.drawLine(
            Offset(x, backLength - 15),
            Offset(x, backLength - 5),
            gatherPaint,
          );
        }
        return;
        
      case 'Pencil':
        skirtPath.moveTo(-waistWidth - 5, backLength - 10);
        skirtPath.lineTo(-hipWidth - 5, backLength - 10 + hipDepth);
        skirtPath.lineTo(-hipWidth + 5, backLength - 10 + skirtLength);
        skirtPath.lineTo(hipWidth - 5, backLength - 10 + skirtLength);
        skirtPath.lineTo(hipWidth + 5, backLength - 10 + hipDepth);
        skirtPath.lineTo(waistWidth + 5, backLength - 10);
        skirtPath.close();
        break;
        
      default:
        skirtPath.moveTo(-waistWidth - 5, backLength - 10);
        skirtPath.lineTo(-hipWidth - 5, backLength - 10 + skirtLength);
        skirtPath.lineTo(hipWidth + 5, backLength - 10 + skirtLength);
        skirtPath.lineTo(waistWidth + 5, backLength - 10);
        skirtPath.close();
    }
    
    canvas.drawPath(skirtPath, fillPaint);
    canvas.drawPath(skirtPath, paint);
  }

  void _drawPrincessLineBodice(Canvas canvas, Paint paint, Paint fillPaint, Path path,
      double shoulderWidth, double bustWidth, double waistWidth, double armholeDepth, double backLength) {
    
    // Center panel
    final centerPath = Path();
    centerPath.moveTo(-shoulderWidth / 2, 10);
    centerPath.lineTo(-bustWidth / 2, armholeDepth + 10);
    centerPath.lineTo(-waistWidth / 3, backLength - 10);
    centerPath.lineTo(waistWidth / 3, backLength - 10);
    centerPath.lineTo(bustWidth / 2, armholeDepth + 10);
    centerPath.lineTo(shoulderWidth / 2, 10);
    centerPath.close();
    
    canvas.drawPath(centerPath, fillPaint);
    canvas.drawPath(centerPath, paint);
    
    // Left side panel
    final leftPath = Path();
    leftPath.moveTo(-shoulderWidth - 5, 10);
    leftPath.lineTo(-shoulderWidth, armholeDepth + 10);
    leftPath.lineTo(-waistWidth - 5, backLength - 10);
    leftPath.lineTo(-waistWidth / 3, backLength - 10);
    leftPath.lineTo(-bustWidth / 2, armholeDepth + 10);
    leftPath.lineTo(-shoulderWidth / 2, 10);
    leftPath.close();
    
    canvas.drawPath(leftPath, fillPaint);
    canvas.drawPath(leftPath, paint);
    
    // Right side panel
    final rightPath = Path();
    rightPath.moveTo(shoulderWidth + 5, 10);
    rightPath.lineTo(shoulderWidth, armholeDepth + 10);
    rightPath.lineTo(waistWidth + 5, backLength - 10);
    rightPath.lineTo(waistWidth / 3, backLength - 10);
    rightPath.lineTo(bustWidth / 2, armholeDepth + 10);
    rightPath.lineTo(shoulderWidth / 2, 10);
    rightPath.close();
    
    canvas.drawPath(rightPath, fillPaint);
    canvas.drawPath(rightPath, paint);
  }

  void _drawWrapStyleBodice(Canvas canvas, Paint paint, Paint fillPaint,
      double shoulderWidth, double bustWidth, double waistWidth, double armholeDepth, double backLength) {
    
    final wrapPath = Path();
    wrapPath.moveTo(-shoulderWidth - 5, 10);
    wrapPath.lineTo(-shoulderWidth, armholeDepth + 10);
    wrapPath.lineTo(-waistWidth - 5, backLength - 10);
    wrapPath.lineTo(waistWidth + 15, backLength - 10);
    wrapPath.lineTo(waistWidth + 15, backLength / 2);
    wrapPath.lineTo(-waistWidth / 3, backLength / 2 + 10);
    wrapPath.lineTo(-10, 15);
    wrapPath.lineTo(10, 15);
    wrapPath.lineTo(waistWidth / 3, backLength / 2 + 10);
    wrapPath.lineTo(shoulderWidth, armholeDepth + 10);
    wrapPath.lineTo(shoulderWidth + 5, 10);
    wrapPath.quadraticBezierTo(0, -5, -shoulderWidth - 5, 10);
    wrapPath.close();
    
    canvas.drawPath(wrapPath, fillPaint);
    canvas.drawPath(wrapPath, paint);
    
    // Draw wrap lines
    final wrapLinePaint = Paint()
      ..color = const Color(0xFF6b7280)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    
    canvas.drawLine(
      Offset(-waistWidth / 3, backLength / 2 + 10),
      Offset(-10, 15),
      wrapLinePaint,
    );
    canvas.drawLine(
      Offset(waistWidth / 3, backLength / 2 + 10),
      Offset(10, 15),
      wrapLinePaint,
    );
  }

  void _drawPeplum(Canvas canvas, Paint paint, Paint accentPaint, 
      double waistWidth, double backLength) {
    
    final peplumPath = Path();
    peplumPath.moveTo(-waistWidth - 5, backLength - 10);
    peplumPath.quadraticBezierTo(
      -waistWidth - 25,
      backLength,
      -waistWidth - 30,
      backLength + 25,
    );
    peplumPath.lineTo(waistWidth + 30, backLength + 25);
    peplumPath.quadraticBezierTo(
      waistWidth + 25,
      backLength,
      waistWidth + 5,
      backLength - 10,
    );
    peplumPath.close();
    
    canvas.drawPath(peplumPath, accentPaint);
    canvas.drawPath(peplumPath, paint);
  }

  void _drawBustDarts(Canvas canvas, Paint paint, double bustWidth, double waistWidth, 
      double armholeDepth, double backLength) {
    
    final dartPaint = Paint()
      ..color = const Color(0xFF6b7280)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    
    // Left dart
    final leftDartPath = Path();
    leftDartPath.moveTo(-bustWidth / 2 - 8, armholeDepth + 15);
    leftDartPath.lineTo(-waistWidth / 2, backLength - 15);
    leftDartPath.lineTo(-bustWidth / 2 + 8, armholeDepth + 15);
    canvas.drawPath(leftDartPath, dartPaint);
    
    // Right dart
    final rightDartPath = Path();
    rightDartPath.moveTo(bustWidth / 2 - 8, armholeDepth + 15);
    rightDartPath.lineTo(waistWidth / 2, backLength - 15);
    rightDartPath.lineTo(bustWidth / 2 + 8, armholeDepth + 15);
    canvas.drawPath(rightDartPath, dartPaint);
  }

  void _drawStyleSummary(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    );

    final summaryItems = [
      'Neckline: ${styleSelections.neckline}',
      'Collar: ${styleSelections.collar}',
      'Bodice: ${styleSelections.bodice}',
      'Sleeve: ${styleSelections.sleeve}',
      'Skirt: ${styleSelections.skirt}',
    ];

    double yOffset = size.height - 110;
    for (final item in summaryItems) {
      textPainter.text = TextSpan(
        text: item,
        style: const TextStyle(
          color: Color(0xFF374151),
          fontSize: 11,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(15, yOffset));
      yOffset += 18;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}