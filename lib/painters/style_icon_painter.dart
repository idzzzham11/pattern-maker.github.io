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
      ..color = const Color(0xFF6b7280)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final fillPaint = Paint()
      ..color = const Color(0xFFe9d5ff)
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

  void _drawNeckline(Canvas canvas, Size size, Paint paint, Paint fillPaint, double cx, double cy) {
    // Draw basic bodice outline
    final bodiceRect = Rect.fromLTWH(cx - 40, cy - 10, 80, 70);
    canvas.drawRect(bodiceRect, fillPaint..color = const Color(0xFFf3e8ff));
    canvas.drawRect(bodiceRect, paint);

    fillPaint.color = const Color(0xFFe9d5ff);
    
    switch (styleName) {
      case 'Round':
        final path = Path();
        path.moveTo(cx - 15, cy - 10);
        path.arcToPoint(
          Offset(cx + 15, cy - 10),
          radius: const Radius.circular(15),
          clockwise: false,
        );
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, paint);
        break;
        
      case 'V-Neck':
        final path = Path();
        path.moveTo(cx - 15, cy - 10);
        path.lineTo(cx, cy + 10);
        path.lineTo(cx + 15, cy - 10);
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, paint);
        break;
        
      case 'Square':
        final rect = Rect.fromLTWH(cx - 15, cy - 10, 30, 20);
        canvas.drawRect(rect, fillPaint);
        canvas.drawRect(rect, paint);
        break;
        
      case 'Sweetheart':
        final path = Path();
        path.moveTo(cx - 15, cy - 5);
        path.quadraticBezierTo(cx - 8, cy - 15, cx, cy - 5);
        path.quadraticBezierTo(cx + 8, cy - 15, cx + 15, cy - 5);
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, paint);
        break;
        
      case 'Boat':
        final path = Path();
        path.moveTo(cx - 35, cy - 5);
        path.lineTo(cx + 35, cy - 5);
        canvas.drawPath(path, paint);
        break;
        
      case 'Scoop':
        final path = Path();
        path.moveTo(cx - 15, cy - 10);
        path.quadraticBezierTo(cx, cy + 15, cx + 15, cy - 10);
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, paint);
        break;
    }
  }

  void _drawCollar(Canvas canvas, Size size, Paint paint, Paint fillPaint, double cx, double cy) {
    // Draw neck area
    final bodiceRect = Rect.fromLTWH(cx - 30, cy, 60, 60);
    canvas.drawRect(bodiceRect, fillPaint..color = const Color(0xFFf3e8ff));
    canvas.drawRect(bodiceRect, paint);

    fillPaint.color = const Color(0xFFddd6fe);
    paint.color = const Color(0xFF8b5cf6);
    paint.strokeWidth = 2.5;
    
    switch (styleName) {
      case 'No Collar':
        final path = Path();
        path.moveTo(cx - 12, cy);
        path.arcToPoint(
          Offset(cx + 12, cy),
          radius: const Radius.circular(12),
          clockwise: false,
        );
        canvas.drawPath(path, paint);
        break;
        
      case 'Shirt Collar':
        final collarRect = Rect.fromLTWH(cx - 25, cy - 12, 50, 15);
        canvas.drawRect(collarRect, fillPaint);
        canvas.drawRect(collarRect, paint);
        
        final path = Path();
        path.moveTo(cx - 10, cy + 3);
        path.lineTo(cx - 20, cy + 20);
        path.moveTo(cx + 10, cy + 3);
        path.lineTo(cx + 20, cy + 20);
        canvas.drawPath(path, paint);
        break;
        
      case 'Peter Pan':
        final path = Path();
        path.addArc(Rect.fromCircle(center: Offset(cx - 15, cy + 5), radius: 12), 0, pi);
        path.addArc(Rect.fromCircle(center: Offset(cx + 15, cy + 5), radius: 12), 0, pi);
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, paint);
        break;
        
      case 'Mandarin':
        final rect = Rect.fromLTWH(cx - 20, cy - 5, 40, 12);
        canvas.drawRect(rect, fillPaint);
        canvas.drawRect(rect, paint);
        break;
        
      case 'Shawl':
        final path = Path();
        path.moveTo(cx - 25, cy);
        path.quadraticBezierTo(cx - 15, cy + 20, cx, cy + 30);
        path.quadraticBezierTo(cx + 15, cy + 20, cx + 25, cy);
        canvas.drawPath(path, paint);
        break;
    }
  }

  void _drawBodice(Canvas canvas, Size size, Paint paint, Paint fillPaint, double cx, double cy) {
    fillPaint.color = const Color(0xFFe9d5ff);
    
    switch (styleName) {
      case 'Basic Fitted':
        final rect = Rect.fromLTWH(cx - 25, cy - 20, 50, 70);
        canvas.drawRect(rect, fillPaint);
        canvas.drawRect(rect, paint);
        break;
        
      case 'Dart Front':
        final rect = Rect.fromLTWH(cx - 25, cy - 20, 50, 70);
        canvas.drawRect(rect, fillPaint);
        canvas.drawRect(rect, paint);
        
        paint.color = const Color(0xFF8b5cf6);
        paint.strokeWidth = 1;
        final dashPath = Path();
        dashPath.moveTo(cx - 10, cy - 5);
        dashPath.lineTo(cx - 15, cy + 30);
        dashPath.moveTo(cx + 10, cy - 5);
        dashPath.lineTo(cx + 15, cy + 30);
        canvas.drawPath(dashPath, paint);
        break;
        
      case 'Princess Line':
        final path1 = Path();
        path1.moveTo(cx - 25, cy - 20);
        path1.lineTo(cx - 30, cy + 50);
        path1.lineTo(cx - 10, cy + 50);
        path1.lineTo(cx - 15, cy - 20);
        path1.close();
        canvas.drawPath(path1, fillPaint);
        canvas.drawPath(path1, paint);
        
        final path2 = Path();
        path2.moveTo(cx + 25, cy - 20);
        path2.lineTo(cx + 20, cy + 50);
        path2.lineTo(cx + 40, cy + 50);
        path2.lineTo(cx + 35, cy - 20);
        path2.close();
        canvas.drawPath(path2, fillPaint);
        canvas.drawPath(path2, paint);
        
        final centerRect = Rect.fromLTWH(cx - 15, cy - 20, 30, 70);
        canvas.drawRect(centerRect, fillPaint);
        canvas.drawRect(centerRect, paint);
        break;
        
      case 'Wrap Style':
        final path = Path();
        path.moveTo(cx - 20, cy - 20);
        path.lineTo(cx - 10, cy + 30);
        path.lineTo(cx, cy + 50);
        path.lineTo(cx + 30, cy + 30);
        path.lineTo(cx + 40, cy - 20);
        path.lineTo(cx, cy);
        path.close();
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, paint);
        break;
        
      case 'Peplum':
        final bodiceRect = Rect.fromLTWH(cx - 20, cy - 20, 40, 45);
        canvas.drawRect(bodiceRect, fillPaint);
        canvas.drawRect(bodiceRect, paint);
        
        final peplumPath = Path();
        peplumPath.moveTo(cx - 20, cy + 25);
        peplumPath.quadraticBezierTo(cx - 30, cy + 35, cx - 25, cy + 45);
        peplumPath.lineTo(cx + 35, cy + 45);
        peplumPath.quadraticBezierTo(cx + 40, cy + 35, cx + 30, cy + 25);
        peplumPath.close();
        canvas.drawPath(peplumPath, fillPaint);
        canvas.drawPath(peplumPath, paint);
        break;
    }
  }

  void _drawSleeve(Canvas canvas, Size size, Paint paint, Paint fillPaint, double cx, double cy) {
    // Draw shoulder area
    final bodiceRect = Rect.fromLTWH(cx - 25, cy - 10, 50, 40);
    canvas.drawRect(bodiceRect, fillPaint..color = const Color(0xFFf3e8ff));
    canvas.drawRect(bodiceRect, paint);

    fillPaint.color = const Color(0xFFe9d5ff);
    
    switch (styleName) {
      case 'Sleeveless':
        final path = Path();
        path.addArc(Rect.fromCircle(center: Offset(cx - 27, cy), radius: 8), 0, pi * 0.5);
        path.addArc(Rect.fromCircle(center: Offset(cx + 37, cy), radius: 8), pi * 0.5, pi * 0.5);
        canvas.drawPath(path, paint);
        break;
        
      case 'Short':
        final leftPath = Path();
        leftPath.moveTo(cx - 25, cy - 10);
        leftPath.lineTo(cx - 35, cy);
        leftPath.lineTo(cx - 32, cy + 15);
        leftPath.lineTo(cx - 25, cy + 13);
        leftPath.close();
        canvas.drawPath(leftPath, fillPaint);
        canvas.drawPath(leftPath, paint);
        
        final rightPath = Path();
        rightPath.moveTo(cx + 25, cy - 10);
        rightPath.lineTo(cx + 35, cy);
        rightPath.lineTo(cx + 32, cy + 15);
        rightPath.lineTo(cx + 25, cy + 13);
        rightPath.close();
        canvas.drawPath(rightPath, fillPaint);
        canvas.drawPath(rightPath, paint);
        break;
        
      case 'Long':
        final leftPath = Path();
        leftPath.moveTo(cx - 25, cy - 10);
        leftPath.lineTo(cx - 30, cy);
        leftPath.lineTo(cx - 32, cy + 45);
        leftPath.lineTo(cx - 28, cy + 45);
        leftPath.lineTo(cx - 25, cy + 20);
        leftPath.close();
        canvas.drawPath(leftPath, fillPaint);
        canvas.drawPath(leftPath, paint);
        
        final rightPath = Path();
        rightPath.moveTo(cx + 25, cy - 10);
        rightPath.lineTo(cx + 30, cy);
        rightPath.lineTo(cx + 32, cy + 45);
        rightPath.lineTo(cx + 28, cy + 45);
        rightPath.lineTo(cx + 25, cy + 20);
        rightPath.close();
        canvas.drawPath(rightPath, fillPaint);
        canvas.drawPath(rightPath, paint);
        break;
        
      case 'Puff':
        final leftPath = Path();
        leftPath.moveTo(cx - 25, cy - 10);
        leftPath.quadraticBezierTo(cx - 45, cy + 5, cx - 30, cy + 18);
        leftPath.lineTo(cx - 25, cy + 15);
        leftPath.close();
        canvas.drawPath(leftPath, fillPaint);
        canvas.drawPath(leftPath, paint);
        
        final rightPath = Path();
        rightPath.moveTo(cx + 25, cy - 10);
        rightPath.quadraticBezierTo(cx + 45, cy + 5, cx + 30, cy + 18);
        rightPath.lineTo(cx + 25, cy + 15);
        rightPath.close();
        canvas.drawPath(rightPath, fillPaint);
        canvas.drawPath(rightPath, paint);
        break;
        
      case 'Bell':
        final leftPath = Path();
        leftPath.moveTo(cx - 25, cy - 10);
        leftPath.lineTo(cx - 28, cy + 20);
        leftPath.lineTo(cx - 45, cy + 40);
        leftPath.lineTo(cx - 32, cy + 40);
        leftPath.lineTo(cx - 25, cy + 25);
        leftPath.close();
        canvas.drawPath(leftPath, fillPaint);
        canvas.drawPath(leftPath, paint);
        
        final rightPath = Path();
        rightPath.moveTo(cx + 25, cy - 10);
        rightPath.lineTo(cx + 28, cy + 20);
        rightPath.lineTo(cx + 45, cy + 40);
        rightPath.lineTo(cx + 32, cy + 40);
        rightPath.lineTo(cx + 25, cy + 25);
        rightPath.close();
        canvas.drawPath(rightPath, fillPaint);
        canvas.drawPath(rightPath, paint);
        break;
        
      case 'Cap':
        final leftPath = Path();
        leftPath.moveTo(cx - 25, cy - 10);
        leftPath.quadraticBezierTo(cx - 32, cy - 2, cx - 28, cy + 5);
        leftPath.lineTo(cx - 25, cy + 3);
        leftPath.close();
        canvas.drawPath(leftPath, fillPaint);
        canvas.drawPath(leftPath, paint);
        
        final rightPath = Path();
        rightPath.moveTo(cx + 25, cy - 10);
        rightPath.quadraticBezierTo(cx + 32, cy - 2, cx + 28, cy + 5);
        rightPath.lineTo(cx + 25, cy + 3);
        rightPath.close();
        canvas.drawPath(rightPath, fillPaint);
        canvas.drawPath(rightPath, paint);
        break;
    }
  }

  void _drawSkirt(Canvas canvas, Size size, Paint paint, Paint fillPaint, double cx, double cy) {
    // Draw waist
    paint.color = const Color(0xFF8b5cf6);
    paint.strokeWidth = 1;
    final waistPath = Path();
    waistPath.moveTo(cx - 20, cy - 15);
    waistPath.lineTo(cx + 20, cy - 15);
    canvas.drawPath(waistPath, paint);

    fillPaint.color = const Color(0xFFe9d5ff);
    paint.color = const Color(0xFF6b7280);
    paint.strokeWidth = 2;
    
    switch (styleName) {
      case 'Straight':
        final rect = Rect.fromLTWH(cx - 18, cy - 15, 36, 70);
        canvas.drawRect(rect, fillPaint);
        canvas.drawRect(rect, paint);
        break;
        
      case 'A-Line':
        final path = Path();
        path.moveTo(cx - 15, cy - 15);
        path.lineTo(cx - 30, cy + 55);
        path.lineTo(cx + 40, cy + 55);
        path.lineTo(cx + 25, cy - 15);
        path.close();
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, paint);
        break;
        
      case 'Flared':
        final path = Path();
        path.moveTo(cx, cy - 15);
        path.quadraticBezierTo(cx - 25, cy + 20, cx - 35, cy + 55);
        path.lineTo(cx + 45, cy + 55);
        path.quadraticBezierTo(cx + 35, cy + 20, cx + 20, cy - 15);
        path.close();
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, paint);
        break;
        
      case 'Pleated':
        final rect = Rect.fromLTWH(cx - 25, cy - 15, 50, 70);
        canvas.drawRect(rect, fillPaint);
        canvas.drawRect(rect, paint);
        
        paint.color = const Color(0xFF8b5cf6);
        paint.strokeWidth = 1;
        for (int i = 0; i < 5; i++) {
          final linePath = Path();
          linePath.moveTo(cx - 20 + i * 10, cy - 15);
          linePath.lineTo(cx - 20 + i * 10, cy + 55);
          canvas.drawPath(linePath, paint);
        }
        break;
        
      case 'Gathered':
        final path = Path();
        path.moveTo(cx - 20, cy - 15);
        for (int i = 0; i <= 10; i++) {
          final x = cx - 20 + i * 4;
          final y = cy - 15 + (i % 2 == 0 ? 0 : 3);
          path.lineTo(x, y);
        }
        path.lineTo(cx + 30, cy + 55);
        path.lineTo(cx - 20, cy + 55);
        path.close();
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, paint);
        break;
        
      case 'Pencil':
        final path = Path();
        path.moveTo(cx - 17, cy - 15);
        path.lineTo(cx - 20, cy + 30);
        path.lineTo(cx - 18, cy + 55);
        path.lineTo(cx + 28, cy + 55);
        path.lineTo(cx + 30, cy + 30);
        path.lineTo(cx + 27, cy - 15);
        path.close();
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, paint);
        break;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
