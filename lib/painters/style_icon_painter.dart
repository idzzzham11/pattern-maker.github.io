import 'dart:math';
import 'package:flutter/material.dart';

class StyleIconPainter extends CustomPainter {
  final String styleName;
  final String category;

  StyleIconPainter({
    required this.styleName,
    required this.category,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF374151)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fillPaint = Paint()
      ..color = const Color(0xFF374151)
      ..style = PaintingStyle.fill;

    final cx = size.width / 2;
    final cy = size.height / 2;

    switch (category) {
      case 'neckline':
        _drawNeckline(canvas, size, paint, fillPaint, cx, cy);
        break;
      case 'collar':
        _drawCollar(canvas, size, paint, fillPaint, cx, cy);
        break;
      case 'bodice':
        _drawBodice(canvas, size, paint, fillPaint, cx, cy);
        break;
      case 'sleeve':
        _drawSleeve(canvas, size, paint, fillPaint, cx, cy);
        break;
      case 'skirt':
        _drawSkirt(canvas, size, paint, fillPaint, cx, cy);
        break;
    }
  }

  // Draw realistic mannequin neck
  void _drawMannequinNeck(Canvas canvas, double cx, double cy, double scale) {
    final neckPaint = Paint()
      ..color = const Color(0xFF9ca3af)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2 * scale
      ..strokeCap = StrokeCap.round;
    
    final neckPath = Path();
    // Left side of neck
    neckPath.moveTo(cx - 8 * scale, cy - 32 * scale);
    neckPath.quadraticBezierTo(cx - 9 * scale, cy - 42 * scale, cx - 7 * scale, cy - 50 * scale);
    // Top of neck curve
    neckPath.quadraticBezierTo(cx, cy - 54 * scale, cx + 7 * scale, cy - 50 * scale);
    // Right side of neck
    neckPath.quadraticBezierTo(cx + 9 * scale, cy - 42 * scale, cx + 8 * scale, cy - 32 * scale);
    canvas.drawPath(neckPath, neckPaint);
  }

  // Draw arm outlines
  void _drawArms(Canvas canvas, double cx, double cy, double scale) {
    final armPaint = Paint()
      ..color = const Color(0xFF9ca3af)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2 * scale
      ..strokeCap = StrokeCap.round;
    
    // Left arm - outer line
    final leftArmOuter = Path();
    leftArmOuter.moveTo(cx - 28 * scale, cy - 22 * scale);
    leftArmOuter.quadraticBezierTo(cx - 35 * scale, cy - 18 * scale, cx - 38 * scale, cy - 10 * scale);
    leftArmOuter.quadraticBezierTo(cx - 42 * scale, cy + 5 * scale, cx - 40 * scale, cy + 20 * scale);
    canvas.drawPath(leftArmOuter, armPaint);
    
    // Left arm - inner line
    final leftArmInner = Path();
    leftArmInner.moveTo(cx - 32 * scale, cy - 10 * scale);
    leftArmInner.quadraticBezierTo(cx - 35 * scale, cy + 5 * scale, cx - 34 * scale, cy + 18 * scale);
    canvas.drawPath(leftArmInner, armPaint);
    
    // Right arm - outer line
    final rightArmOuter = Path();
    rightArmOuter.moveTo(cx + 28 * scale, cy - 22 * scale);
    rightArmOuter.quadraticBezierTo(cx + 35 * scale, cy - 18 * scale, cx + 38 * scale, cy - 10 * scale);
    rightArmOuter.quadraticBezierTo(cx + 42 * scale, cy + 5 * scale, cx + 40 * scale, cy + 20 * scale);
    canvas.drawPath(rightArmOuter, armPaint);
    
    // Right arm - inner line
    final rightArmInner = Path();
    rightArmInner.moveTo(cx + 32 * scale, cy - 10 * scale);
    rightArmInner.quadraticBezierTo(cx + 35 * scale, cy + 5 * scale, cx + 34 * scale, cy + 18 * scale);
    canvas.drawPath(rightArmInner, armPaint);
  }

  void _drawNeckline(Canvas canvas, Size size, Paint paint, Paint fillPaint, double cx, double cy) {
    final scale = size.width / 120;
    cy = cy + 8 * scale;
    
    // Draw arms first (behind garment)
    _drawArms(canvas, cx, cy, scale);
    
    // Draw mannequin neck
    _drawMannequinNeck(canvas, cx, cy, scale);
    
    fillPaint.color = const Color(0xFF374151);
    
    final bodice = Path();
    
    // Bottom left
    bodice.moveTo(cx - 22 * scale, cy + 35 * scale);
    
    // Left side curve (waist)
    bodice.quadraticBezierTo(cx - 26 * scale, cy + 15 * scale, cx - 28 * scale, cy + 5 * scale);
    
    // Left armhole - realistic curve
    bodice.quadraticBezierTo(cx - 32 * scale, cy - 10 * scale, cx - 28 * scale, cy - 22 * scale);
    
    // Left shoulder slope
    bodice.quadraticBezierTo(cx - 24 * scale, cy - 28 * scale, cx - 18 * scale, cy - 32 * scale);
    
    switch (styleName) {
      case 'Round':
        // Left strap
        bodice.lineTo(cx - 10 * scale, cy - 35 * scale);
        bodice.lineTo(cx - 8 * scale, cy - 42 * scale);
        bodice.lineTo(cx - 5 * scale, cy - 42 * scale);
        bodice.lineTo(cx - 6 * scale, cy - 35 * scale);
        // Round curve
        bodice.quadraticBezierTo(cx, cy - 25 * scale, cx + 6 * scale, cy - 35 * scale);
        // Right strap
        bodice.lineTo(cx + 5 * scale, cy - 42 * scale);
        bodice.lineTo(cx + 8 * scale, cy - 42 * scale);
        bodice.lineTo(cx + 10 * scale, cy - 35 * scale);
        break;

      case 'V-Neck':
        bodice.lineTo(cx - 10 * scale, cy - 35 * scale);
        bodice.lineTo(cx - 8 * scale, cy - 42 * scale);
        bodice.lineTo(cx - 5 * scale, cy - 42 * scale);
        bodice.lineTo(cx - 6 * scale, cy - 35 * scale);
        // V shape
        bodice.lineTo(cx, cy - 8 * scale);
        bodice.lineTo(cx + 6 * scale, cy - 35 * scale);
        bodice.lineTo(cx + 5 * scale, cy - 42 * scale);
        bodice.lineTo(cx + 8 * scale, cy - 42 * scale);
        bodice.lineTo(cx + 10 * scale, cy - 35 * scale);
        break;

      case 'Square':
        bodice.lineTo(cx - 10 * scale, cy - 35 * scale);
        bodice.lineTo(cx - 8 * scale, cy - 42 * scale);
        bodice.lineTo(cx - 5 * scale, cy - 42 * scale);
        bodice.lineTo(cx - 6 * scale, cy - 35 * scale);
        // Square shape
        bodice.lineTo(cx - 6 * scale, cy - 20 * scale);
        bodice.lineTo(cx + 6 * scale, cy - 20 * scale);
        bodice.lineTo(cx + 6 * scale, cy - 35 * scale);
        bodice.lineTo(cx + 5 * scale, cy - 42 * scale);
        bodice.lineTo(cx + 8 * scale, cy - 42 * scale);
        bodice.lineTo(cx + 10 * scale, cy - 35 * scale);
        break;

      case 'Sweetheart':
        // Strapless - curve from shoulder
        bodice.quadraticBezierTo(cx - 12 * scale, cy - 35 * scale, cx - 10 * scale, cy - 28 * scale);
        // Heart left curve
        bodice.quadraticBezierTo(cx - 5 * scale, cy - 35 * scale, cx, cy - 26 * scale);
        // Heart right curve
        bodice.quadraticBezierTo(cx + 5 * scale, cy - 35 * scale, cx + 10 * scale, cy - 28 * scale);
        bodice.quadraticBezierTo(cx + 12 * scale, cy - 35 * scale, cx + 18 * scale, cy - 32 * scale);
        break;

      case 'Boat':
        // Wide boat neck shoulder to shoulder
        bodice.lineTo(cx - 12 * scale, cy - 33 * scale);
        bodice.quadraticBezierTo(cx, cy - 28 * scale, cx + 12 * scale, cy - 33 * scale);
        break;

      case 'Scoop':
        bodice.lineTo(cx - 10 * scale, cy - 35 * scale);
        bodice.lineTo(cx - 8 * scale, cy - 42 * scale);
        bodice.lineTo(cx - 5 * scale, cy - 42 * scale);
        bodice.lineTo(cx - 6 * scale, cy - 35 * scale);
        // Deep U scoop
        bodice.quadraticBezierTo(cx - 4 * scale, cy - 10 * scale, cx, cy - 8 * scale);
        bodice.quadraticBezierTo(cx + 4 * scale, cy - 10 * scale, cx + 6 * scale, cy - 35 * scale);
        bodice.lineTo(cx + 5 * scale, cy - 42 * scale);
        bodice.lineTo(cx + 8 * scale, cy - 42 * scale);
        bodice.lineTo(cx + 10 * scale, cy - 35 * scale);
        break;
    }
    
    // Right shoulder slope
    bodice.lineTo(cx + 18 * scale, cy - 32 * scale);
    bodice.quadraticBezierTo(cx + 24 * scale, cy - 28 * scale, cx + 28 * scale, cy - 22 * scale);
    
    // Right armhole
    bodice.quadraticBezierTo(cx + 32 * scale, cy - 10 * scale, cx + 28 * scale, cy + 5 * scale);
    
    // Right side curve (waist)
    bodice.quadraticBezierTo(cx + 26 * scale, cy + 15 * scale, cx + 22 * scale, cy + 35 * scale);
    
    bodice.close();
    canvas.drawPath(bodice, fillPaint);
  }

  void _drawCollar(Canvas canvas, Size size, Paint paint, Paint fillPaint, double cx, double cy) {
    final scale = size.width / 120;
    cy = cy + 8 * scale;
    
    // Draw arms first (behind garment)
    _drawArms(canvas, cx, cy, scale);
    
    // Draw mannequin neck
    _drawMannequinNeck(canvas, cx, cy, scale);
    
    fillPaint.color = const Color(0xFF374151);
    
    // Base bodice shape
    final bodice = Path();
    
    // Bottom left
    bodice.moveTo(cx - 22 * scale, cy + 35 * scale);
    
    // Left side curve (waist)
    bodice.quadraticBezierTo(cx - 26 * scale, cy + 15 * scale, cx - 28 * scale, cy + 5 * scale);
    
    // Left armhole
    bodice.quadraticBezierTo(cx - 32 * scale, cy - 10 * scale, cx - 28 * scale, cy - 22 * scale);
    
    // Left shoulder slope
    bodice.quadraticBezierTo(cx - 24 * scale, cy - 28 * scale, cx - 18 * scale, cy - 32 * scale);
    
    switch (styleName) {
      case 'No Collar':
        // Simple round neck
        bodice.lineTo(cx - 10 * scale, cy - 34 * scale);
        bodice.quadraticBezierTo(cx, cy - 24 * scale, cx + 10 * scale, cy - 34 * scale);
        break;

      case 'Shirt Collar':
        // V opening for shirt
        bodice.lineTo(cx - 12 * scale, cy - 32 * scale);
        bodice.lineTo(cx - 4 * scale, cy - 18 * scale);
        bodice.lineTo(cx, cy + 5 * scale);
        bodice.lineTo(cx + 4 * scale, cy - 18 * scale);
        bodice.lineTo(cx + 12 * scale, cy - 32 * scale);
        break;

      case 'Peter Pan':
        bodice.lineTo(cx - 10 * scale, cy - 34 * scale);
        bodice.quadraticBezierTo(cx, cy - 24 * scale, cx + 10 * scale, cy - 34 * scale);
        break;

      case 'Mandarin':
        // V-neck with mandarin collar
        bodice.lineTo(cx - 10 * scale, cy - 35 * scale);
        bodice.lineTo(cx - 5 * scale, cy - 30 * scale);
        bodice.lineTo(cx, cy - 10 * scale);
        bodice.lineTo(cx + 5 * scale, cy - 30 * scale);
        bodice.lineTo(cx + 10 * scale, cy - 35 * scale);
        break;

      case 'Shawl':
        // Deep V for shawl
        bodice.lineTo(cx - 15 * scale, cy - 32 * scale);
        bodice.lineTo(cx - 6 * scale, cy - 22 * scale);
        bodice.lineTo(cx, cy + 10 * scale);
        bodice.lineTo(cx + 6 * scale, cy - 22 * scale);
        bodice.lineTo(cx + 15 * scale, cy - 32 * scale);
        break;
    }
    
    // Right shoulder slope
    bodice.lineTo(cx + 18 * scale, cy - 32 * scale);
    bodice.quadraticBezierTo(cx + 24 * scale, cy - 28 * scale, cx + 28 * scale, cy - 22 * scale);
    
    // Right armhole
    bodice.quadraticBezierTo(cx + 32 * scale, cy - 10 * scale, cx + 28 * scale, cy + 5 * scale);
    
    // Right side curve (waist)
    bodice.quadraticBezierTo(cx + 26 * scale, cy + 15 * scale, cx + 22 * scale, cy + 35 * scale);
    
    bodice.close();
    canvas.drawPath(bodice, fillPaint);
    
    // Draw collar details
    final collarFill = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final collarStroke = Paint()
      ..color = const Color(0xFF374151)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1 * scale;
    
    switch (styleName) {
      case 'Shirt Collar':
        // Left pointed collar
        final leftCollar = Path();
        leftCollar.moveTo(cx - 4 * scale, cy - 18 * scale);
        leftCollar.lineTo(cx - 16 * scale, cy - 12 * scale);
        leftCollar.lineTo(cx - 14 * scale, cy - 30 * scale);
        leftCollar.lineTo(cx - 6 * scale, cy - 32 * scale);
        leftCollar.close();
        canvas.drawPath(leftCollar, collarFill);
        canvas.drawPath(leftCollar, collarStroke);

        // Right pointed collar
        final rightCollar = Path();
        rightCollar.moveTo(cx + 4 * scale, cy - 18 * scale);
        rightCollar.lineTo(cx + 16 * scale, cy - 12 * scale);
        rightCollar.lineTo(cx + 14 * scale, cy - 30 * scale);
        rightCollar.lineTo(cx + 6 * scale, cy - 32 * scale);
        rightCollar.close();
        canvas.drawPath(rightCollar, collarFill);
        canvas.drawPath(rightCollar, collarStroke);
        break;

      case 'Peter Pan':
        // Left rounded collar
        final leftCollar = Path();
        leftCollar.moveTo(cx - 2 * scale, cy - 26 * scale);
        leftCollar.quadraticBezierTo(cx - 6 * scale, cy - 16 * scale, cx - 18 * scale, cy - 18 * scale);
        leftCollar.quadraticBezierTo(cx - 22 * scale, cy - 24 * scale, cx - 18 * scale, cy - 30 * scale);
        leftCollar.quadraticBezierTo(cx - 12 * scale, cy - 34 * scale, cx - 2 * scale, cy - 26 * scale);
        leftCollar.close();
        canvas.drawPath(leftCollar, collarFill);
        canvas.drawPath(leftCollar, collarStroke);

        // Right rounded collar
        final rightCollar = Path();
        rightCollar.moveTo(cx + 2 * scale, cy - 26 * scale);
        rightCollar.quadraticBezierTo(cx + 6 * scale, cy - 16 * scale, cx + 18 * scale, cy - 18 * scale);
        rightCollar.quadraticBezierTo(cx + 22 * scale, cy - 24 * scale, cx + 18 * scale, cy - 30 * scale);
        rightCollar.quadraticBezierTo(cx + 12 * scale, cy - 34 * scale, cx + 2 * scale, cy - 26 * scale);
        rightCollar.close();
        canvas.drawPath(rightCollar, collarFill);
        canvas.drawPath(rightCollar, collarStroke);
        break;

      case 'Mandarin':
        // Left stand collar
        final leftCollar = Path();
        leftCollar.moveTo(cx - 5 * scale, cy - 30 * scale);
        leftCollar.lineTo(cx - 12 * scale, cy - 34 * scale);
        leftCollar.lineTo(cx - 10 * scale, cy - 42 * scale);
        leftCollar.quadraticBezierTo(cx - 6 * scale, cy - 44 * scale, cx - 4 * scale, cy - 38 * scale);
        leftCollar.close();
        canvas.drawPath(leftCollar, collarFill);
        canvas.drawPath(leftCollar, collarStroke);

        // Right stand collar
        final rightCollar = Path();
        rightCollar.moveTo(cx + 5 * scale, cy - 30 * scale);
        rightCollar.lineTo(cx + 12 * scale, cy - 34 * scale);
        rightCollar.lineTo(cx + 10 * scale, cy - 42 * scale);
        rightCollar.quadraticBezierTo(cx + 6 * scale, cy - 44 * scale, cx + 4 * scale, cy - 38 * scale);
        rightCollar.close();
        canvas.drawPath(rightCollar, collarFill);
        canvas.drawPath(rightCollar, collarStroke);

        // Decorative lines
        final linePaint = Paint()
          ..color = const Color(0xFF374151)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.7 * scale;
        
        final leftLine = Path();
        leftLine.moveTo(cx - 6 * scale, cy - 32 * scale);
        leftLine.lineTo(cx - 9 * scale, cy - 39 * scale);
        canvas.drawPath(leftLine, linePaint);
        
        final rightLine = Path();
        rightLine.moveTo(cx + 6 * scale, cy - 32 * scale);
        rightLine.lineTo(cx + 9 * scale, cy - 39 * scale);
        canvas.drawPath(rightLine, linePaint);
        break;

      case 'Shawl':
        // Layered shawl lines
        final shawlPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5 * scale
          ..strokeCap = StrokeCap.round;

        // Outer layer
        final outer = Path();
        outer.moveTo(cx - 14 * scale, cy - 30 * scale);
        outer.quadraticBezierTo(cx - 8 * scale, cy - 18 * scale, cx, cy + 5 * scale);
        outer.quadraticBezierTo(cx + 8 * scale, cy - 18 * scale, cx + 14 * scale, cy - 30 * scale);
        canvas.drawPath(outer, shawlPaint);

        // Middle layer
        final middle = Path();
        middle.moveTo(cx - 11 * scale, cy - 27 * scale);
        middle.quadraticBezierTo(cx - 6 * scale, cy - 15 * scale, cx, cy - 2 * scale);
        middle.quadraticBezierTo(cx + 6 * scale, cy - 15 * scale, cx + 11 * scale, cy - 27 * scale);
        canvas.drawPath(middle, shawlPaint);

        // Inner layer
        final inner = Path();
        inner.moveTo(cx - 8 * scale, cy - 24 * scale);
        inner.quadraticBezierTo(cx - 4 * scale, cy - 14 * scale, cx, cy - 8 * scale);
        inner.quadraticBezierTo(cx + 4 * scale, cy - 14 * scale, cx + 8 * scale, cy - 24 * scale);
        canvas.drawPath(inner, shawlPaint);
        break;
    }
  }

  void _drawBodice(Canvas canvas, Size size, Paint paint, Paint fillPaint, double cx, double cy) {
    final scale = size.width / 120;
    cy = cy + 8 * scale;
    
    // Draw arms first (behind garment)
    _drawArms(canvas, cx, cy, scale);
    
    // Draw mannequin neck
    _drawMannequinNeck(canvas, cx, cy, scale);
    
    fillPaint.color = const Color(0xFF374151);
    
    switch (styleName) {
      case 'Basic Fitted':
        // Simple fitted bodice
        final bodice = _createBaseBodice(cx, cy, scale);
        bodice.lineTo(cx - 10 * scale, cy - 34 * scale);
        bodice.quadraticBezierTo(cx, cy - 24 * scale, cx + 10 * scale, cy - 34 * scale);
        _closeBaseBodice(bodice, cx, cy, scale);
        canvas.drawPath(bodice, fillPaint);
        
        // Center front line (dashed)
        final centerPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1 * scale;
        
        final dashPath = Path();
        double startY = cy - 24 * scale;
        double endY = cy + 35 * scale;
        double dashLength = 3 * scale;
        double gapLength = 3 * scale;
        double currentY = startY;
        
        while (currentY < endY) {
          final dashEnd = (currentY + dashLength).clamp(startY, endY);
          final dash = Path();
          dash.moveTo(cx, currentY);
          dash.lineTo(cx, dashEnd);
          canvas.drawPath(dash, centerPaint);
          currentY += dashLength + gapLength;
        }
        break;
        
      case 'Dart Front':
        final bodice = _createBaseBodice(cx, cy, scale);
        bodice.lineTo(cx - 10 * scale, cy - 34 * scale);
        bodice.quadraticBezierTo(cx, cy - 24 * scale, cx + 10 * scale, cy - 34 * scale);
        _closeBaseBodice(bodice, cx, cy, scale);
        canvas.drawPath(bodice, fillPaint);
        
        // Dart lines - triangular darts from bust point to waist
        final dartPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2 * scale;
        
        // Left dart (triangle shape)
        final leftDart1 = Path();
        leftDart1.moveTo(cx - 12 * scale, cy - 5 * scale);
        leftDart1.lineTo(cx - 16 * scale, cy + 35 * scale);
        canvas.drawPath(leftDart1, dartPaint);
        
        final leftDart2 = Path();
        leftDart2.moveTo(cx - 12 * scale, cy - 5 * scale);
        leftDart2.lineTo(cx - 8 * scale, cy + 35 * scale);
        canvas.drawPath(leftDart2, dartPaint);
        
        // Right dart (triangle shape)
        final rightDart1 = Path();
        rightDart1.moveTo(cx + 12 * scale, cy - 5 * scale);
        rightDart1.lineTo(cx + 16 * scale, cy + 35 * scale);
        canvas.drawPath(rightDart1, dartPaint);
        
        final rightDart2 = Path();
        rightDart2.moveTo(cx + 12 * scale, cy - 5 * scale);
        rightDart2.lineTo(cx + 8 * scale, cy + 35 * scale);
        canvas.drawPath(rightDart2, dartPaint);
        
        // Dart points (bust points)
        final dotPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;
        canvas.drawCircle(Offset(cx - 12 * scale, cy - 5 * scale), 2 * scale, dotPaint);
        canvas.drawCircle(Offset(cx + 12 * scale, cy - 5 * scale), 2 * scale, dotPaint);
        break;
        
      case 'Princess Line':
        final bodice = _createBaseBodice(cx, cy, scale);
        bodice.lineTo(cx - 10 * scale, cy - 34 * scale);
        bodice.quadraticBezierTo(cx, cy - 24 * scale, cx + 10 * scale, cy - 34 * scale);
        _closeBaseBodice(bodice, cx, cy, scale);
        canvas.drawPath(bodice, fillPaint);
        
        // Princess seam lines
        final seamPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2 * scale;
        
        // Left princess seam - curved from armhole through bust
        final leftSeam = Path();
        leftSeam.moveTo(cx - 24 * scale, cy - 26 * scale);
        leftSeam.quadraticBezierTo(cx - 14 * scale, cy - 5 * scale, cx - 16 * scale, cy + 35 * scale);
        canvas.drawPath(leftSeam, seamPaint);
        
        // Right princess seam
        final rightSeam = Path();
        rightSeam.moveTo(cx + 24 * scale, cy - 26 * scale);
        rightSeam.quadraticBezierTo(cx + 14 * scale, cy - 5 * scale, cx + 16 * scale, cy + 35 * scale);
        canvas.drawPath(rightSeam, seamPaint);
        
        // Center front line (dashed)
        final centerPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1 * scale;
        
        double startY = cy - 24 * scale;
        double endY = cy + 35 * scale;
        double dashLength = 3 * scale;
        double gapLength = 3 * scale;
        double currentY = startY;
        
        while (currentY < endY) {
          final dashEnd = (currentY + dashLength).clamp(startY, endY);
          final dash = Path();
          dash.moveTo(cx, currentY);
          dash.lineTo(cx, dashEnd);
          canvas.drawPath(dash, centerPaint);
          currentY += dashLength + gapLength;
        }
        break;
        
      case 'Wrap Style':
        // Wrap bodice with V-neck crossover
        final bodice = Path();
        bodice.moveTo(cx - 22 * scale, cy + 35 * scale);
        bodice.quadraticBezierTo(cx - 26 * scale, cy + 15 * scale, cx - 28 * scale, cy + 5 * scale);
        bodice.quadraticBezierTo(cx - 32 * scale, cy - 10 * scale, cx - 28 * scale, cy - 22 * scale);
        bodice.quadraticBezierTo(cx - 24 * scale, cy - 28 * scale, cx - 18 * scale, cy - 32 * scale);
        // V-neck for wrap
        bodice.lineTo(cx - 12 * scale, cy - 33 * scale);
        bodice.lineTo(cx, cy + 5 * scale);
        bodice.lineTo(cx + 12 * scale, cy - 33 * scale);
        bodice.lineTo(cx + 18 * scale, cy - 32 * scale);
        bodice.quadraticBezierTo(cx + 24 * scale, cy - 28 * scale, cx + 28 * scale, cy - 22 * scale);
        bodice.quadraticBezierTo(cx + 32 * scale, cy - 10 * scale, cx + 28 * scale, cy + 5 * scale);
        bodice.quadraticBezierTo(cx + 26 * scale, cy + 15 * scale, cx + 22 * scale, cy + 35 * scale);
        bodice.close();
        canvas.drawPath(bodice, fillPaint);
        
        // Wrap overlap lines
        final wrapPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2 * scale;
        
        // Left panel overlap
        final leftOverlap = Path();
        leftOverlap.moveTo(cx - 12 * scale, cy - 33 * scale);
        leftOverlap.quadraticBezierTo(cx - 5 * scale, cy - 10 * scale, cx + 10 * scale, cy + 20 * scale);
        canvas.drawPath(leftOverlap, wrapPaint);
        
        // Right panel edge
        final rightEdge = Path();
        rightEdge.moveTo(cx + 12 * scale, cy - 33 * scale);
        rightEdge.quadraticBezierTo(cx + 5 * scale, cy - 5 * scale, cx - 5 * scale, cy + 25 * scale);
        canvas.drawPath(rightEdge, wrapPaint);
        
        // Tie indication at waist
        final tiePaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2 * scale;
        canvas.drawCircle(Offset(cx - 8 * scale, cy + 28 * scale), 4 * scale, tiePaint);
        break;
        
      case 'Peplum':
        // Shorter fitted bodice
        final bodice = Path();
        bodice.moveTo(cx - 20 * scale, cy + 8 * scale);
        bodice.quadraticBezierTo(cx - 24 * scale, cy - 2 * scale, cx - 26 * scale, cy - 10 * scale);
        bodice.quadraticBezierTo(cx - 30 * scale, cy - 18 * scale, cx - 26 * scale, cy - 24 * scale);
        bodice.quadraticBezierTo(cx - 22 * scale, cy - 30 * scale, cx - 16 * scale, cy - 33 * scale);
        bodice.lineTo(cx - 10 * scale, cy - 35 * scale);
        bodice.quadraticBezierTo(cx, cy - 26 * scale, cx + 10 * scale, cy - 35 * scale);
        bodice.lineTo(cx + 16 * scale, cy - 33 * scale);
        bodice.quadraticBezierTo(cx + 22 * scale, cy - 30 * scale, cx + 26 * scale, cy - 24 * scale);
        bodice.quadraticBezierTo(cx + 30 * scale, cy - 18 * scale, cx + 26 * scale, cy - 10 * scale);
        bodice.quadraticBezierTo(cx + 24 * scale, cy - 2 * scale, cx + 20 * scale, cy + 8 * scale);
        bodice.close();
        canvas.drawPath(bodice, fillPaint);
        
        // Peplum flare with wavy edge
        final peplum = Path();
        peplum.moveTo(cx - 20 * scale, cy + 8 * scale);
        peplum.quadraticBezierTo(cx - 30 * scale, cy + 22 * scale, cx - 28 * scale, cy + 38 * scale);
        peplum.quadraticBezierTo(cx - 18 * scale, cy + 42 * scale, cx - 10 * scale, cy + 38 * scale);
        peplum.quadraticBezierTo(cx, cy + 35 * scale, cx + 10 * scale, cy + 38 * scale);
        peplum.quadraticBezierTo(cx + 18 * scale, cy + 42 * scale, cx + 28 * scale, cy + 38 * scale);
        peplum.quadraticBezierTo(cx + 30 * scale, cy + 22 * scale, cx + 20 * scale, cy + 8 * scale);
        peplum.close();
        canvas.drawPath(peplum, fillPaint);
        
        // Waistline seam
        final waistPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5 * scale;
        
        final waistSeam = Path();
        waistSeam.moveTo(cx - 20 * scale, cy + 8 * scale);
        waistSeam.quadraticBezierTo(cx, cy + 12 * scale, cx + 20 * scale, cy + 8 * scale);
        canvas.drawPath(waistSeam, waistPaint);
        
        // Peplum fold lines
        final foldPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8 * scale;
        
        final leftFold = Path();
        leftFold.moveTo(cx - 15 * scale, cy + 12 * scale);
        leftFold.quadraticBezierTo(cx - 18 * scale, cy + 25 * scale, cx - 16 * scale, cy + 38 * scale);
        canvas.drawPath(leftFold, foldPaint);
        
        final rightFold = Path();
        rightFold.moveTo(cx + 15 * scale, cy + 12 * scale);
        rightFold.quadraticBezierTo(cx + 18 * scale, cy + 25 * scale, cx + 16 * scale, cy + 38 * scale);
        canvas.drawPath(rightFold, foldPaint);
        break;
    }
  }
  
  Path _createBaseBodice(double cx, double cy, double scale) {
    final bodice = Path();
    bodice.moveTo(cx - 22 * scale, cy + 35 * scale);
    bodice.quadraticBezierTo(cx - 26 * scale, cy + 15 * scale, cx - 28 * scale, cy + 5 * scale);
    bodice.quadraticBezierTo(cx - 32 * scale, cy - 10 * scale, cx - 28 * scale, cy - 22 * scale);
    bodice.quadraticBezierTo(cx - 24 * scale, cy - 28 * scale, cx - 18 * scale, cy - 32 * scale);
    return bodice;
  }
  
  void _closeBaseBodice(Path bodice, double cx, double cy, double scale) {
    bodice.lineTo(cx + 18 * scale, cy - 32 * scale);
    bodice.quadraticBezierTo(cx + 24 * scale, cy - 28 * scale, cx + 28 * scale, cy - 22 * scale);
    bodice.quadraticBezierTo(cx + 32 * scale, cy - 10 * scale, cx + 28 * scale, cy + 5 * scale);
    bodice.quadraticBezierTo(cx + 26 * scale, cy + 15 * scale, cx + 22 * scale, cy + 35 * scale);
    bodice.close();
  }

  void _drawSleeve(Canvas canvas, Size size, Paint paint, Paint fillPaint, double cx, double cy) {
    final scale = size.width / 120;
    cy = cy + 8 * scale;
    
    // Draw mannequin neck
    _drawMannequinNeck(canvas, cx, cy, scale);
    
    fillPaint.color = const Color(0xFF374151);
    
    // Helper to draw base bodice
    void drawBaseBodice() {
      final bodice = Path();
      bodice.moveTo(cx - 22 * scale, cy + 35 * scale);
      bodice.quadraticBezierTo(cx - 26 * scale, cy + 15 * scale, cx - 28 * scale, cy + 5 * scale);
      bodice.quadraticBezierTo(cx - 32 * scale, cy - 10 * scale, cx - 28 * scale, cy - 22 * scale);
      bodice.quadraticBezierTo(cx - 24 * scale, cy - 28 * scale, cx - 18 * scale, cy - 32 * scale);
      bodice.lineTo(cx - 10 * scale, cy - 34 * scale);
      bodice.quadraticBezierTo(cx, cy - 24 * scale, cx + 10 * scale, cy - 34 * scale);
      bodice.lineTo(cx + 18 * scale, cy - 32 * scale);
      bodice.quadraticBezierTo(cx + 24 * scale, cy - 28 * scale, cx + 28 * scale, cy - 22 * scale);
      bodice.quadraticBezierTo(cx + 32 * scale, cy - 10 * scale, cx + 28 * scale, cy + 5 * scale);
      bodice.quadraticBezierTo(cx + 26 * scale, cy + 15 * scale, cx + 22 * scale, cy + 35 * scale);
      bodice.close();
      canvas.drawPath(bodice, fillPaint);
    }
    
    switch (styleName) {
      case 'Sleeveless':
        // Draw arms (visible without sleeves)
        _drawArms(canvas, cx, cy, scale);
        // Bodice with clean armholes
        drawBaseBodice();
        break;
        
      case 'Short':
        drawBaseBodice();
        
        // Left short sleeve - fitted, ends above elbow
        final leftShort = Path();
        leftShort.moveTo(cx - 28 * scale, cy - 22 * scale);
        leftShort.quadraticBezierTo(cx - 35 * scale, cy - 20 * scale, cx - 40 * scale, cy - 12 * scale);
        leftShort.lineTo(cx - 42 * scale, cy + 5 * scale);
        leftShort.lineTo(cx - 35 * scale, cy + 5 * scale);
        leftShort.quadraticBezierTo(cx - 33 * scale, cy - 5 * scale, cx - 32 * scale, cy - 10 * scale);
        leftShort.close();
        canvas.drawPath(leftShort, fillPaint);
        
        // Right short sleeve
        final rightShort = Path();
        rightShort.moveTo(cx + 28 * scale, cy - 22 * scale);
        rightShort.quadraticBezierTo(cx + 35 * scale, cy - 20 * scale, cx + 40 * scale, cy - 12 * scale);
        rightShort.lineTo(cx + 42 * scale, cy + 5 * scale);
        rightShort.lineTo(cx + 35 * scale, cy + 5 * scale);
        rightShort.quadraticBezierTo(cx + 33 * scale, cy - 5 * scale, cx + 32 * scale, cy - 10 * scale);
        rightShort.close();
        canvas.drawPath(rightShort, fillPaint);
        
        // Sleeve hem lines
        final hemPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1 * scale;
        final leftHem = Path();
        leftHem.moveTo(cx - 42 * scale, cy + 5 * scale);
        leftHem.lineTo(cx - 35 * scale, cy + 5 * scale);
        canvas.drawPath(leftHem, hemPaint);
        final rightHem = Path();
        rightHem.moveTo(cx + 42 * scale, cy + 5 * scale);
        rightHem.lineTo(cx + 35 * scale, cy + 5 * scale);
        canvas.drawPath(rightHem, hemPaint);
        break;
        
      case 'Long':
        drawBaseBodice();
        
        // Left long sleeve - fitted to wrist
        final leftLong = Path();
        leftLong.moveTo(cx - 28 * scale, cy - 22 * scale);
        leftLong.quadraticBezierTo(cx - 34 * scale, cy - 18 * scale, cx - 38 * scale, cy - 8 * scale);
        leftLong.lineTo(cx - 42 * scale, cy + 35 * scale);
        leftLong.lineTo(cx - 36 * scale, cy + 35 * scale);
        leftLong.lineTo(cx - 32 * scale, cy - 5 * scale);
        leftLong.close();
        canvas.drawPath(leftLong, fillPaint);
        
        // Right long sleeve
        final rightLong = Path();
        rightLong.moveTo(cx + 28 * scale, cy - 22 * scale);
        rightLong.quadraticBezierTo(cx + 34 * scale, cy - 18 * scale, cx + 38 * scale, cy - 8 * scale);
        rightLong.lineTo(cx + 42 * scale, cy + 35 * scale);
        rightLong.lineTo(cx + 36 * scale, cy + 35 * scale);
        rightLong.lineTo(cx + 32 * scale, cy - 5 * scale);
        rightLong.close();
        canvas.drawPath(rightLong, fillPaint);
        
        // Cuff lines
        final cuffPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1 * scale;
        final leftCuff = Path();
        leftCuff.moveTo(cx - 42 * scale, cy + 35 * scale);
        leftCuff.lineTo(cx - 36 * scale, cy + 35 * scale);
        canvas.drawPath(leftCuff, cuffPaint);
        final rightCuff = Path();
        rightCuff.moveTo(cx + 42 * scale, cy + 35 * scale);
        rightCuff.lineTo(cx + 36 * scale, cy + 35 * scale);
        canvas.drawPath(rightCuff, cuffPaint);
        break;
        
      case 'Puff':
        drawBaseBodice();
        
        // Left puff sleeve - rounded/gathered at shoulder
        final leftPuff = Path();
        leftPuff.moveTo(cx - 28 * scale, cy - 22 * scale);
        leftPuff.quadraticBezierTo(cx - 48 * scale, cy - 20 * scale, cx - 48 * scale, cy - 5 * scale);
        leftPuff.quadraticBezierTo(cx - 48 * scale, cy + 8 * scale, cx - 38 * scale, cy + 10 * scale);
        leftPuff.lineTo(cx - 34 * scale, cy + 10 * scale);
        leftPuff.quadraticBezierTo(cx - 33 * scale, cy, cx - 32 * scale, cy - 10 * scale);
        leftPuff.close();
        canvas.drawPath(leftPuff, fillPaint);
        
        // Right puff sleeve
        final rightPuff = Path();
        rightPuff.moveTo(cx + 28 * scale, cy - 22 * scale);
        rightPuff.quadraticBezierTo(cx + 48 * scale, cy - 20 * scale, cx + 48 * scale, cy - 5 * scale);
        rightPuff.quadraticBezierTo(cx + 48 * scale, cy + 8 * scale, cx + 38 * scale, cy + 10 * scale);
        rightPuff.lineTo(cx + 34 * scale, cy + 10 * scale);
        rightPuff.quadraticBezierTo(cx + 33 * scale, cy, cx + 32 * scale, cy - 10 * scale);
        rightPuff.close();
        canvas.drawPath(rightPuff, fillPaint);
        
        // Gathering lines at hem
        final gatherPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1 * scale;
        final leftGather = Path();
        leftGather.moveTo(cx - 38 * scale, cy + 10 * scale);
        leftGather.lineTo(cx - 34 * scale, cy + 10 * scale);
        canvas.drawPath(leftGather, gatherPaint);
        final rightGather = Path();
        rightGather.moveTo(cx + 38 * scale, cy + 10 * scale);
        rightGather.lineTo(cx + 34 * scale, cy + 10 * scale);
        canvas.drawPath(rightGather, gatherPaint);
        
        // Puff volume lines
        final volumePaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8 * scale;
        final leftVolume = Path();
        leftVolume.moveTo(cx - 35 * scale, cy - 18 * scale);
        leftVolume.quadraticBezierTo(cx - 42 * scale, cy - 10 * scale, cx - 40 * scale, cy + 2 * scale);
        canvas.drawPath(leftVolume, volumePaint);
        final rightVolume = Path();
        rightVolume.moveTo(cx + 35 * scale, cy - 18 * scale);
        rightVolume.quadraticBezierTo(cx + 42 * scale, cy - 10 * scale, cx + 40 * scale, cy + 2 * scale);
        canvas.drawPath(rightVolume, volumePaint);
        break;
        
      case 'Bell':
        drawBaseBodice();
        
        // Left bell sleeve - fitted at top, flares at bottom
        final leftBell = Path();
        leftBell.moveTo(cx - 28 * scale, cy - 22 * scale);
        leftBell.quadraticBezierTo(cx - 34 * scale, cy - 18 * scale, cx - 36 * scale, cy - 8 * scale);
        leftBell.lineTo(cx - 38 * scale, cy + 5 * scale);
        leftBell.quadraticBezierTo(cx - 42 * scale, cy + 20 * scale, cx - 55 * scale, cy + 38 * scale);
        leftBell.lineTo(cx - 35 * scale, cy + 38 * scale);
        leftBell.quadraticBezierTo(cx - 34 * scale, cy + 20 * scale, cx - 32 * scale, cy - 5 * scale);
        leftBell.close();
        canvas.drawPath(leftBell, fillPaint);
        
        // Right bell sleeve
        final rightBell = Path();
        rightBell.moveTo(cx + 28 * scale, cy - 22 * scale);
        rightBell.quadraticBezierTo(cx + 34 * scale, cy - 18 * scale, cx + 36 * scale, cy - 8 * scale);
        rightBell.lineTo(cx + 38 * scale, cy + 5 * scale);
        rightBell.quadraticBezierTo(cx + 42 * scale, cy + 20 * scale, cx + 55 * scale, cy + 38 * scale);
        rightBell.lineTo(cx + 35 * scale, cy + 38 * scale);
        rightBell.quadraticBezierTo(cx + 34 * scale, cy + 20 * scale, cx + 32 * scale, cy - 5 * scale);
        rightBell.close();
        canvas.drawPath(rightBell, fillPaint);
        
        // Flare indication lines
        final flarePaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8 * scale;
        final leftFlare = Path();
        leftFlare.moveTo(cx - 40 * scale, cy + 10 * scale);
        leftFlare.lineTo(cx - 48 * scale, cy + 35 * scale);
        canvas.drawPath(leftFlare, flarePaint);
        final rightFlare = Path();
        rightFlare.moveTo(cx + 40 * scale, cy + 10 * scale);
        rightFlare.lineTo(cx + 48 * scale, cy + 35 * scale);
        canvas.drawPath(rightFlare, flarePaint);
        break;
        
      case 'Cap':
        drawBaseBodice();
        
        // Left cap sleeve - very short, just covers shoulder
        final leftCap = Path();
        leftCap.moveTo(cx - 28 * scale, cy - 22 * scale);
        leftCap.quadraticBezierTo(cx - 38 * scale, cy - 22 * scale, cx - 40 * scale, cy - 15 * scale);
        leftCap.quadraticBezierTo(cx - 40 * scale, cy - 10 * scale, cx - 35 * scale, cy - 8 * scale);
        leftCap.quadraticBezierTo(cx - 33 * scale, cy - 10 * scale, cx - 32 * scale, cy - 15 * scale);
        leftCap.close();
        canvas.drawPath(leftCap, fillPaint);
        
        // Right cap sleeve
        final rightCap = Path();
        rightCap.moveTo(cx + 28 * scale, cy - 22 * scale);
        rightCap.quadraticBezierTo(cx + 38 * scale, cy - 22 * scale, cx + 40 * scale, cy - 15 * scale);
        rightCap.quadraticBezierTo(cx + 40 * scale, cy - 10 * scale, cx + 35 * scale, cy - 8 * scale);
        rightCap.quadraticBezierTo(cx + 33 * scale, cy - 10 * scale, cx + 32 * scale, cy - 15 * scale);
        rightCap.close();
        canvas.drawPath(rightCap, fillPaint);
        
        // Cap edge line
        final capPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8 * scale;
        final leftCapEdge = Path();
        leftCapEdge.moveTo(cx - 40 * scale, cy - 15 * scale);
        leftCapEdge.quadraticBezierTo(cx - 40 * scale, cy - 10 * scale, cx - 35 * scale, cy - 8 * scale);
        canvas.drawPath(leftCapEdge, capPaint);
        final rightCapEdge = Path();
        rightCapEdge.moveTo(cx + 40 * scale, cy - 15 * scale);
        rightCapEdge.quadraticBezierTo(cx + 40 * scale, cy - 10 * scale, cx + 35 * scale, cy - 8 * scale);
        canvas.drawPath(rightCapEdge, capPaint);
        break;
    }
  }
  
  void _drawSkirt(Canvas canvas, Size size, Paint paint, Paint fillPaint, double cx, double cy) {
    final scale = size.width / 120;
    cy = cy - 5 * scale;
    
    fillPaint.color = const Color(0xFF374151);
    
    // Common measurements
    final waistWidth = 22 * scale;
    final waistTop = cy - 35 * scale;
    final waistHeight = 6 * scale;
    final hemY = cy + 40 * scale;
    
    switch (styleName) {
      case 'Straight':
        // Waistband
        final waistband = Path();
        waistband.addRect(Rect.fromLTWH(cx - waistWidth, waistTop, waistWidth * 2, waistHeight));
        canvas.drawPath(waistband, fillPaint);
        
        // Skirt body - minimal taper (almost rectangular)
        final skirt = Path();
        skirt.moveTo(cx - waistWidth, waistTop + waistHeight);
        skirt.lineTo(cx - waistWidth - 2 * scale, hemY);
        skirt.lineTo(cx + waistWidth + 2 * scale, hemY);
        skirt.lineTo(cx + waistWidth, waistTop + waistHeight);
        skirt.close();
        canvas.drawPath(skirt, fillPaint);
        
        // Center line (dashed)
        final centerPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1 * scale;
        
        double currentY = waistTop + waistHeight;
        while (currentY < hemY) {
          final dashEnd = (currentY + 3 * scale).clamp(waistTop + waistHeight, hemY);
          final dash = Path();
          dash.moveTo(cx, currentY);
          dash.lineTo(cx, dashEnd);
          canvas.drawPath(dash, centerPaint);
          currentY += 6 * scale;
        }
        break;
        
      case 'A-Line':
        // Waistband
        final waistband = Path();
        waistband.addRect(Rect.fromLTWH(cx - waistWidth, waistTop, waistWidth * 2, waistHeight));
        canvas.drawPath(waistband, fillPaint);
        
        // Skirt body - gradual flare (A shape)
        final skirt = Path();
        skirt.moveTo(cx - waistWidth, waistTop + waistHeight);
        skirt.lineTo(cx - 35 * scale, hemY);
        skirt.lineTo(cx + 35 * scale, hemY);
        skirt.lineTo(cx + waistWidth, waistTop + waistHeight);
        skirt.close();
        canvas.drawPath(skirt, fillPaint);
        
        // Side seam lines
        final seamPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8 * scale;
        final leftSeam = Path();
        leftSeam.moveTo(cx - waistWidth, waistTop + waistHeight);
        leftSeam.lineTo(cx - 35 * scale, hemY);
        canvas.drawPath(leftSeam, seamPaint);
        final rightSeam = Path();
        rightSeam.moveTo(cx + waistWidth, waistTop + waistHeight);
        rightSeam.lineTo(cx + 35 * scale, hemY);
        canvas.drawPath(rightSeam, seamPaint);
        break;
        
      case 'Flared':
        // Waistband
        final waistband = Path();
        waistband.addRect(Rect.fromLTWH(cx - waistWidth, waistTop, waistWidth * 2, waistHeight));
        canvas.drawPath(waistband, fillPaint);
        
        // Skirt body - full dramatic flare with wavy hem
        final skirt = Path();
        skirt.moveTo(cx - waistWidth, waistTop + waistHeight);
        skirt.quadraticBezierTo(cx - 30 * scale, cy + 10 * scale, cx - 48 * scale, hemY);
        // Wavy hem
        skirt.quadraticBezierTo(cx - 35 * scale, hemY + 5 * scale, cx - 20 * scale, hemY);
        skirt.quadraticBezierTo(cx, hemY - 5 * scale, cx + 20 * scale, hemY);
        skirt.quadraticBezierTo(cx + 35 * scale, hemY + 5 * scale, cx + 48 * scale, hemY);
        skirt.quadraticBezierTo(cx + 30 * scale, cy + 10 * scale, cx + waistWidth, waistTop + waistHeight);
        skirt.close();
        canvas.drawPath(skirt, fillPaint);
        
        // Flow lines
        final flowPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8 * scale;
        final leftFlow = Path();
        leftFlow.moveTo(cx - 10 * scale, waistTop + waistHeight);
        leftFlow.quadraticBezierTo(cx - 15 * scale, cy + 10 * scale, cx - 25 * scale, hemY);
        canvas.drawPath(leftFlow, flowPaint);
        final rightFlow = Path();
        rightFlow.moveTo(cx + 10 * scale, waistTop + waistHeight);
        rightFlow.quadraticBezierTo(cx + 15 * scale, cy + 10 * scale, cx + 25 * scale, hemY);
        canvas.drawPath(rightFlow, flowPaint);
        break;
        
      case 'Pleated':
        // Waistband
        final waistband = Path();
        waistband.addRect(Rect.fromLTWH(cx - waistWidth, waistTop, waistWidth * 2, waistHeight));
        canvas.drawPath(waistband, fillPaint);
        
        // Skirt body with slight A-line
        final skirt = Path();
        skirt.moveTo(cx - waistWidth, waistTop + waistHeight);
        skirt.lineTo(cx - 32 * scale, hemY);
        skirt.lineTo(cx + 32 * scale, hemY);
        skirt.lineTo(cx + waistWidth, waistTop + waistHeight);
        skirt.close();
        canvas.drawPath(skirt, fillPaint);
        
        // Pleat lines - vertical stripes
        final pleatPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1 * scale;
        
        for (int i = -4; i <= 4; i++) {
          final topX = cx + i * 5 * scale;
          final bottomX = cx + i * 7 * scale;
          final pleat = Path();
          pleat.moveTo(topX, waistTop + waistHeight);
          pleat.lineTo(bottomX, hemY);
          canvas.drawPath(pleat, pleatPaint);
        }
        break;
        
      case 'Gathered':
        // Waistband
        final waistband = Path();
        waistband.addRect(Rect.fromLTWH(cx - waistWidth, waistTop, waistWidth * 2, waistHeight));
        canvas.drawPath(waistband, fillPaint);
        
        // Gathering bumps at waist
        final gatherBumpPaint = Paint()
          ..color = const Color(0xFF374151)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5 * scale;
        for (int i = -3; i <= 3; i++) {
          final arc = Path();
          arc.addArc(
            Rect.fromCircle(center: Offset(cx + i * 6 * scale, waistTop + waistHeight + 3 * scale), radius: 3 * scale),
            3.14159, // PI
            -3.14159, // -PI (draws top half)
          );
          canvas.drawPath(arc, gatherBumpPaint);
        }
        
        // Full gathered skirt body
        final skirt = Path();
        skirt.moveTo(cx - waistWidth, waistTop + waistHeight);
        skirt.quadraticBezierTo(cx - 35 * scale, cy, cx - 42 * scale, hemY);
        skirt.lineTo(cx + 42 * scale, hemY);
        skirt.quadraticBezierTo(cx + 35 * scale, cy, cx + waistWidth, waistTop + waistHeight);
        skirt.close();
        canvas.drawPath(skirt, fillPaint);
        
        // Gather flow lines
        final flowPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8 * scale;
        for (int i = -2; i <= 2; i++) {
          final flow = Path();
          flow.moveTo(cx + i * 8 * scale, waistTop + waistHeight + 5 * scale);
          flow.quadraticBezierTo(cx + i * 10 * scale, cy + 10 * scale, cx + i * 12 * scale, hemY - 2 * scale);
          canvas.drawPath(flow, flowPaint);
        }
        break;
        
      case 'Pencil':
        // Waistband
        final waistband = Path();
        waistband.addRect(Rect.fromLTWH(cx - waistWidth, waistTop, waistWidth * 2, waistHeight));
        canvas.drawPath(waistband, fillPaint);
        
        // Fitted pencil shape - widens at hip, narrows at hem
        final skirt = Path();
        skirt.moveTo(cx - waistWidth, waistTop + waistHeight);
        // Hip curve out
        skirt.quadraticBezierTo(cx - 26 * scale, cy - 15 * scale, cx - 24 * scale, cy);
        // Taper in toward hem
        skirt.quadraticBezierTo(cx - 22 * scale, cy + 20 * scale, cx - 18 * scale, hemY);
        skirt.lineTo(cx + 18 * scale, hemY);
        // Right side
        skirt.quadraticBezierTo(cx + 22 * scale, cy + 20 * scale, cx + 24 * scale, cy);
        skirt.quadraticBezierTo(cx + 26 * scale, cy - 15 * scale, cx + waistWidth, waistTop + waistHeight);
        skirt.close();
        canvas.drawPath(skirt, fillPaint);
        
        // Back slit indication
        final slitPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1 * scale;
        final slit = Path();
        slit.moveTo(cx, cy + 25 * scale);
        slit.lineTo(cx, hemY);
        canvas.drawPath(slit, slitPaint);
        
        // Dart lines from waist
        final dartPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8 * scale;
        final leftDart = Path();
        leftDart.moveTo(cx - 10 * scale, waistTop + waistHeight);
        leftDart.lineTo(cx - 12 * scale, cy - 5 * scale);
        canvas.drawPath(leftDart, dartPaint);
        final rightDart = Path();
        rightDart.moveTo(cx + 10 * scale, waistTop + waistHeight);
        rightDart.lineTo(cx + 12 * scale, cy - 5 * scale);
        canvas.drawPath(rightDart, dartPaint);
        break;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}