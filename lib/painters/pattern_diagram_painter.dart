import 'package:flutter/material.dart';
import 'dart:math';
import '../utils/pattern_drafting_instructions.dart';

/// Painter for pattern drafting diagrams showing step-by-step construction
class PatternDiagramPainter extends CustomPainter {
  final DiagramType diagramType;
  final Map<String, double> measurements;
  final Color fillColor;
  final Color lineColor;
  final Color labelColor;

  PatternDiagramPainter({
    required this.diagramType,
    required this.measurements,
    this.fillColor = const Color(0xFFF5DEB3), // Wheat/tan color like reference
    this.lineColor = const Color(0xFF374151),
    this.labelColor = const Color(0xFF1F2937),
  });

  @override
  void paint(Canvas canvas, Size size) {
    switch (diagramType) {
      case DiagramType.backStep1:
        _drawBackStep1(canvas, size);
        break;
      case DiagramType.backStep2:
        _drawBackStep2(canvas, size);
        break;
      case DiagramType.backStep3:
        _drawBackStep3(canvas, size);
        break;
      case DiagramType.backStep4:
        _drawBackStep4(canvas, size);
        break;
      case DiagramType.frontStep1:
        _drawFrontStep1(canvas, size);
        break;
      case DiagramType.frontStep2:
        _drawFrontStep2(canvas, size);
        break;
      case DiagramType.frontStep3:
        _drawFrontStep3(canvas, size);
        break;
      case DiagramType.frontStep4:
        _drawFrontStep4(canvas, size);
        break;
      default:
        _drawGenericDiagram(canvas, size);
    }
  }

  // Paint objects
  Paint get _linePaint => Paint()
    ..color = lineColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.5;

  Paint get _dashedPaint => Paint()
    ..color = lineColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  Paint get _fillPaint => Paint()
    ..color = fillColor
    ..style = PaintingStyle.fill;

  Paint get _pointPaint => Paint()
    ..color = lineColor
    ..style = PaintingStyle.fill;

  // Helper to draw a labeled point
  void _drawPoint(Canvas canvas, Offset position, String label, {bool alignRight = false, bool alignBottom = false}) {
    // Draw point
    canvas.drawCircle(position, 3, _pointPaint);
    
    // Draw label
    final textSpan = TextSpan(
      text: label,
      style: TextStyle(
        color: labelColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    
    double dx = position.dx + (alignRight ? -textPainter.width - 6 : 6);
    double dy = position.dy + (alignBottom ? 4 : -textPainter.height - 2);
    
    textPainter.paint(canvas, Offset(dx, dy));
  }

  // Helper to draw dashed line
  void _drawDashedLine(Canvas canvas, Offset start, Offset end) {
    final path = Path();
    final distance = (end - start).distance;
    final dashLength = 5.0;
    final gapLength = 3.0;
    final dx = (end.dx - start.dx) / distance;
    final dy = (end.dy - start.dy) / distance;
    
    double currentDistance = 0;
    bool drawing = true;
    
    path.moveTo(start.dx, start.dy);
    
    while (currentDistance < distance) {
      final segmentLength = drawing ? dashLength : gapLength;
      currentDistance += segmentLength;
      
      if (currentDistance > distance) {
        currentDistance = distance;
      }
      
      final x = start.dx + dx * currentDistance;
      final y = start.dy + dy * currentDistance;
      
      if (drawing) {
        path.lineTo(x, y);
      } else {
        path.moveTo(x, y);
      }
      
      drawing = !drawing;
    }
    
    canvas.drawPath(path, _dashedPaint);
  }

  // Helper to draw measurement annotation
  void _drawMeasurement(Canvas canvas, Offset start, Offset end, String label, {bool outside = true}) {
    final midX = (start.dx + end.dx) / 2;
    final midY = (start.dy + end.dy) / 2;
    
    final textSpan = TextSpan(
      text: label,
      style: TextStyle(
        color: labelColor,
        fontSize: 9,
        fontStyle: FontStyle.italic,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    
    final offset = outside ? 8.0 : -textPainter.height - 4;
    textPainter.paint(canvas, Offset(midX - textPainter.width / 2, midY + offset));
  }

  // BACK BODICE STEP 1 - Basic lines
  void _drawBackStep1(Canvas canvas, Size size) {
    final scale = size.width / 200;
    final margin = 30 * scale;
    
    // Points
    final A = Offset(size.width - margin, margin);
    final B = Offset(size.width - margin, size.height - margin);
    final C = Offset(margin, margin);
    final D = Offset(margin, margin + 40 * scale);
    
    // Draw lines
    // AB - vertical line
    canvas.drawLine(A, B, _linePaint);
    
    // AC - horizontal line (dashed)
    _drawDashedLine(canvas, A, C);
    
    // CD - short vertical line
    canvas.drawLine(C, D, _linePaint);
    
    // Draw points with labels
    _drawPoint(canvas, A, 'A');
    _drawPoint(canvas, B, 'B', alignBottom: true);
    _drawPoint(canvas, C, 'C', alignRight: true);
    _drawPoint(canvas, D, 'D', alignRight: true, alignBottom: true);
  }

  // BACK BODICE STEP 2 - Neckline
  void _drawBackStep2(Canvas canvas, Size size) {
    final scale = size.width / 200;
    final margin = 30 * scale;
    
    // Points
    final A = Offset(size.width - margin, margin);
    final B = Offset(size.width - margin, size.height - margin);
    final C = Offset(margin, margin);
    final D = Offset(margin, margin + 40 * scale);
    final E = Offset(margin + 50 * scale, margin + 15 * scale);
    final F = Offset(size.width - margin - 20 * scale, margin);
    
    // Draw lines
    canvas.drawLine(A, B, _linePaint);
    _drawDashedLine(canvas, A, C);
    canvas.drawLine(C, D, _linePaint);
    
    // DE - shoulder line
    canvas.drawLine(D, E, _linePaint);
    
    // EF - curved neckline
    final neckPath = Path();
    neckPath.moveTo(E.dx, E.dy);
    neckPath.quadraticBezierTo(
      E.dx + 20 * scale, E.dy - 10 * scale,
      F.dx, F.dy,
    );
    canvas.drawPath(neckPath, _linePaint);
    
    // Draw points
    _drawPoint(canvas, A, 'A');
    _drawPoint(canvas, B, 'B', alignBottom: true);
    _drawPoint(canvas, C, 'C', alignRight: true);
    _drawPoint(canvas, D, 'D', alignRight: true);
    _drawPoint(canvas, E, 'E');
    _drawPoint(canvas, F, 'F', alignRight: true);
  }

  // BACK BODICE STEP 3 - Armhole
  void _drawBackStep3(Canvas canvas, Size size) {
    final scale = size.width / 200;
    final margin = 25 * scale;
    
    // Points
    final A = Offset(size.width - margin, margin);
    final B = Offset(size.width - margin, size.height - margin);
    final C = Offset(margin + 20 * scale, margin);
    final D = Offset(margin, margin + 35 * scale);
    final E = Offset(margin + 50 * scale, margin + 15 * scale);
    final F = Offset(size.width - margin - 15 * scale, margin);
    final G = Offset(size.width - margin, margin + (size.height - 2 * margin) * 0.55);
    final H = Offset(margin, margin + (size.height - 2 * margin) * 0.55);
    final I = Offset(size.width - margin, margin + (size.height - 2 * margin) * 0.28);
    final J = Offset(margin + 60 * scale, margin + (size.height - 2 * margin) * 0.28);
    final K = Offset(margin, margin + (size.height - 2 * margin) * 0.38);
    final L = Offset(margin + 25 * scale, margin + (size.height - 2 * margin) * 0.45);
    
    // Draw construction lines (dashed)
    _drawDashedLine(canvas, A, C);
    _drawDashedLine(canvas, I, J);
    _drawDashedLine(canvas, G, H);
    
    // Draw main lines
    canvas.drawLine(A, B, _linePaint);
    canvas.drawLine(C, D, _linePaint);
    canvas.drawLine(D, E, _linePaint);
    
    // Neckline curve
    final neckPath = Path();
    neckPath.moveTo(E.dx, E.dy);
    neckPath.quadraticBezierTo(E.dx + 15 * scale, E.dy - 8 * scale, F.dx, F.dy);
    canvas.drawPath(neckPath, _linePaint);
    
    // Armhole curve D -> J -> L -> H
    final armholePath = Path();
    armholePath.moveTo(D.dx, D.dy);
    armholePath.quadraticBezierTo(D.dx + 20 * scale, J.dy - 10 * scale, J.dx, J.dy);
    armholePath.quadraticBezierTo(J.dx - 10 * scale, L.dy, L.dx, L.dy);
    armholePath.quadraticBezierTo(L.dx - 15 * scale, H.dy - 15 * scale, H.dx, H.dy);
    canvas.drawPath(armholePath, _linePaint);
    
    // Draw points
    _drawPoint(canvas, A, 'A');
    _drawPoint(canvas, B, 'B', alignBottom: true);
    _drawPoint(canvas, C, 'C');
    _drawPoint(canvas, D, 'D', alignRight: true);
    _drawPoint(canvas, E, 'E');
    _drawPoint(canvas, F, 'F');
    _drawPoint(canvas, G, 'G');
    _drawPoint(canvas, H, 'H', alignRight: true);
    _drawPoint(canvas, I, 'I');
    _drawPoint(canvas, J, 'J');
    _drawPoint(canvas, K, 'K', alignRight: true);
    _drawPoint(canvas, L, 'L');
  }

  // BACK BODICE STEP 4 - Complete with dart
  void _drawBackStep4(Canvas canvas, Size size) {
    final scale = size.width / 200;
    final margin = 25 * scale;
    
    // Points
    final A = Offset(size.width - margin, margin);
    final B = Offset(size.width - margin, size.height - margin);
    final C = Offset(margin + 20 * scale, margin);
    final D = Offset(margin, margin + 35 * scale);
    final E = Offset(margin + 50 * scale, margin + 15 * scale);
    final F = Offset(size.width - margin - 15 * scale, margin);
    final G = Offset(size.width - margin, margin + (size.height - 2 * margin) * 0.55);
    final H = Offset(margin, margin + (size.height - 2 * margin) * 0.55);
    final I = Offset(size.width - margin, margin + (size.height - 2 * margin) * 0.28);
    final J = Offset(margin + 60 * scale, margin + (size.height - 2 * margin) * 0.28);
    final L = Offset(margin + 25 * scale, margin + (size.height - 2 * margin) * 0.45);
    final M = Offset(size.width - margin - 40 * scale, size.height - margin);
    final N = Offset(size.width - margin - 25 * scale, margin + (size.height - 2 * margin) * 0.55);
    final O = Offset(size.width - margin - 40 * scale, size.height - margin);
    final P = Offset(size.width - margin - 55 * scale, size.height - margin);
    final Q = Offset(margin, size.height - margin);
    
    // Draw filled pattern shape
    final patternPath = Path();
    patternPath.moveTo(F.dx, F.dy);
    patternPath.quadraticBezierTo(E.dx + 15 * scale, E.dy - 8 * scale, E.dx, E.dy);
    patternPath.lineTo(D.dx, D.dy);
    patternPath.quadraticBezierTo(D.dx + 20 * scale, J.dy - 10 * scale, J.dx, J.dy);
    patternPath.quadraticBezierTo(J.dx - 10 * scale, L.dy, L.dx, L.dy);
    patternPath.quadraticBezierTo(L.dx - 15 * scale, H.dy - 15 * scale, H.dx, H.dy);
    patternPath.lineTo(Q.dx, Q.dy);
    patternPath.lineTo(P.dx, P.dy);
    patternPath.lineTo(N.dx, N.dy); // Dart point
    patternPath.lineTo(O.dx, O.dy);
    patternPath.lineTo(B.dx, B.dy);
    patternPath.lineTo(A.dx, A.dy);
    patternPath.lineTo(F.dx, F.dy);
    patternPath.close();
    
    canvas.drawPath(patternPath, _fillPaint);
    canvas.drawPath(patternPath, _linePaint);
    
    // Draw dart lines
    canvas.drawLine(N, P, _linePaint);
    canvas.drawLine(N, O, _linePaint);
    
    // Draw construction lines (dashed)
    _drawDashedLine(canvas, I, J);
    _drawDashedLine(canvas, G, H);
    
    // Draw points
    _drawPoint(canvas, A, 'A');
    _drawPoint(canvas, B, 'B');
    _drawPoint(canvas, C, 'C');
    _drawPoint(canvas, D, 'D', alignRight: true);
    _drawPoint(canvas, E, 'E');
    _drawPoint(canvas, F, 'F');
    _drawPoint(canvas, G, 'G');
    _drawPoint(canvas, H, 'H', alignRight: true);
    _drawPoint(canvas, I, 'I');
    _drawPoint(canvas, J, 'J');
    _drawPoint(canvas, M, 'M', alignBottom: true);
    _drawPoint(canvas, N, 'N');
    _drawPoint(canvas, O, 'O', alignBottom: true);
    _drawPoint(canvas, P, 'P', alignBottom: true);
    _drawPoint(canvas, Q, 'Q', alignRight: true, alignBottom: true);
  }

  // FRONT BODICE STEP 1
  void _drawFrontStep1(Canvas canvas, Size size) {
    final scale = size.width / 200;
    final margin = 30 * scale;
    
    final A = Offset(size.width - margin, margin);
    final B = Offset(size.width - margin, size.height - margin);
    final C = Offset(margin, margin);
    final D = Offset(margin, margin + 35 * scale);
    
    canvas.drawLine(A, B, _linePaint);
    _drawDashedLine(canvas, A, C);
    canvas.drawLine(C, D, _linePaint);
    
    _drawPoint(canvas, A, 'A');
    _drawPoint(canvas, B, 'B', alignBottom: true);
    _drawPoint(canvas, C, 'C', alignRight: true);
    _drawPoint(canvas, D, 'D', alignRight: true, alignBottom: true);
  }

  // FRONT BODICE STEP 2
  void _drawFrontStep2(Canvas canvas, Size size) {
    final scale = size.width / 200;
    final margin = 30 * scale;
    
    final A = Offset(size.width - margin, margin);
    final B = Offset(size.width - margin, size.height - margin);
    final C = Offset(margin, margin);
    final D = Offset(margin, margin + 35 * scale);
    final E = Offset(margin + 50 * scale, margin + 12 * scale);
    final F = Offset(size.width - margin - 25 * scale, margin);
    final G = Offset(size.width - margin - 10 * scale, margin + 20 * scale);
    
    canvas.drawLine(A, B, _linePaint);
    _drawDashedLine(canvas, A, C);
    canvas.drawLine(C, D, _linePaint);
    canvas.drawLine(D, E, _linePaint);
    
    // Deeper front neckline curve
    final neckPath = Path();
    neckPath.moveTo(E.dx, E.dy);
    neckPath.quadraticBezierTo(E.dx + 30 * scale, G.dy, G.dx, G.dy);
    neckPath.quadraticBezierTo(G.dx + 5 * scale, F.dy + 5 * scale, F.dx, F.dy);
    canvas.drawPath(neckPath, _linePaint);
    
    _drawPoint(canvas, A, 'A');
    _drawPoint(canvas, B, 'B', alignBottom: true);
    _drawPoint(canvas, C, 'C', alignRight: true);
    _drawPoint(canvas, D, 'D', alignRight: true);
    _drawPoint(canvas, E, 'E');
    _drawPoint(canvas, F, 'F');
    _drawPoint(canvas, G, 'G');
  }

  // FRONT BODICE STEP 3
  void _drawFrontStep3(Canvas canvas, Size size) {
    final scale = size.width / 200;
    final margin = 25 * scale;
    
    final A = Offset(size.width - margin, margin);
    final B = Offset(size.width - margin, size.height - margin);
    final C = Offset(margin + 20 * scale, margin);
    final D = Offset(margin, margin + 32 * scale);
    final E = Offset(margin + 50 * scale, margin + 12 * scale);
    final F = Offset(size.width - margin - 20 * scale, margin);
    final G = Offset(size.width - margin - 8 * scale, margin + 18 * scale);
    final H = Offset(size.width - margin, margin + (size.height - 2 * margin) * 0.5);
    final I = Offset(margin, margin + (size.height - 2 * margin) * 0.5);
    final J = Offset(size.width - margin, margin + (size.height - 2 * margin) * 0.25);
    final K = Offset(margin + 55 * scale, margin + (size.height - 2 * margin) * 0.25);
    final L = Offset(margin, margin + (size.height - 2 * margin) * 0.35);
    final M = Offset(margin + 20 * scale, margin + (size.height - 2 * margin) * 0.42);
    
    // Construction lines
    _drawDashedLine(canvas, A, C);
    _drawDashedLine(canvas, J, K);
    _drawDashedLine(canvas, H, I);
    
    // Main lines
    canvas.drawLine(A, B, _linePaint);
    canvas.drawLine(C, D, _linePaint);
    canvas.drawLine(D, E, _linePaint);
    
    // Neckline
    final neckPath = Path();
    neckPath.moveTo(E.dx, E.dy);
    neckPath.quadraticBezierTo(E.dx + 25 * scale, G.dy, G.dx, G.dy);
    neckPath.quadraticBezierTo(G.dx + 5 * scale, F.dy + 3 * scale, F.dx, F.dy);
    canvas.drawPath(neckPath, _linePaint);
    
    // Armhole
    final armholePath = Path();
    armholePath.moveTo(D.dx, D.dy);
    armholePath.quadraticBezierTo(D.dx + 15 * scale, K.dy - 8 * scale, K.dx, K.dy);
    armholePath.quadraticBezierTo(K.dx - 8 * scale, M.dy, M.dx, M.dy);
    armholePath.quadraticBezierTo(M.dx - 12 * scale, I.dy - 12 * scale, I.dx, I.dy);
    canvas.drawPath(armholePath, _linePaint);
    
    _drawPoint(canvas, A, 'A');
    _drawPoint(canvas, B, 'B', alignBottom: true);
    _drawPoint(canvas, C, 'C');
    _drawPoint(canvas, D, 'D', alignRight: true);
    _drawPoint(canvas, E, 'E');
    _drawPoint(canvas, F, 'F');
    _drawPoint(canvas, G, 'G');
    _drawPoint(canvas, H, 'H');
    _drawPoint(canvas, I, 'I', alignRight: true);
    _drawPoint(canvas, J, 'J');
    _drawPoint(canvas, K, 'K');
    _drawPoint(canvas, L, 'L', alignRight: true);
    _drawPoint(canvas, M, 'M');
  }

  // FRONT BODICE STEP 4 - Complete with dart
  void _drawFrontStep4(Canvas canvas, Size size) {
    final scale = size.width / 200;
    final margin = 25 * scale;
    
    final A = Offset(size.width - margin, margin);
    final B = Offset(size.width - margin, size.height - margin);
    final C = Offset(margin + 20 * scale, margin);
    final D = Offset(margin, margin + 32 * scale);
    final E = Offset(margin + 50 * scale, margin + 12 * scale);
    final F = Offset(size.width - margin - 20 * scale, margin);
    final G = Offset(size.width - margin - 8 * scale, margin + 18 * scale);
    final H = Offset(size.width - margin, margin + (size.height - 2 * margin) * 0.5);
    final I = Offset(margin, margin + (size.height - 2 * margin) * 0.5);
    final J = Offset(size.width - margin, margin + (size.height - 2 * margin) * 0.25);
    final K = Offset(margin + 55 * scale, margin + (size.height - 2 * margin) * 0.25);
    final M = Offset(margin + 20 * scale, margin + (size.height - 2 * margin) * 0.42);
    final N = Offset(size.width - margin, margin + (size.height - 2 * margin) * 0.55);
    final O = Offset(size.width - margin - 35 * scale, size.height - margin);
    final P = Offset(margin, size.height - margin);
    final Q = Offset(size.width - margin - 25 * scale, margin + (size.height - 2 * margin) * 0.5);
    final R = Offset(size.width - margin - 35 * scale, size.height - margin);
    final S = Offset(size.width - margin - 50 * scale, size.height - margin);
    final T = Offset(size.width - margin - 60 * scale, size.height - margin);
    
    // Draw filled pattern
    final patternPath = Path();
    patternPath.moveTo(F.dx, F.dy);
    patternPath.quadraticBezierTo(G.dx + 5 * scale, F.dy + 3 * scale, G.dx, G.dy);
    patternPath.quadraticBezierTo(E.dx + 25 * scale, G.dy, E.dx, E.dy);
    patternPath.lineTo(D.dx, D.dy);
    patternPath.quadraticBezierTo(D.dx + 15 * scale, K.dy - 8 * scale, K.dx, K.dy);
    patternPath.quadraticBezierTo(K.dx - 8 * scale, M.dy, M.dx, M.dy);
    patternPath.quadraticBezierTo(M.dx - 12 * scale, I.dy - 12 * scale, I.dx, I.dy);
    patternPath.lineTo(P.dx, P.dy);
    patternPath.lineTo(S.dx, S.dy);
    patternPath.lineTo(Q.dx, Q.dy); // Dart point
    patternPath.lineTo(R.dx, R.dy);
    patternPath.lineTo(B.dx, B.dy);
    patternPath.lineTo(A.dx, A.dy);
    patternPath.lineTo(F.dx, F.dy);
    patternPath.close();
    
    canvas.drawPath(patternPath, _fillPaint);
    canvas.drawPath(patternPath, _linePaint);
    
    // Dart lines
    canvas.drawLine(Q, S, _linePaint);
    canvas.drawLine(Q, R, _linePaint);
    
    // Construction lines
    _drawDashedLine(canvas, J, K);
    _drawDashedLine(canvas, H, I);
    
    _drawPoint(canvas, A, 'A');
    _drawPoint(canvas, B, 'B');
    _drawPoint(canvas, C, 'C');
    _drawPoint(canvas, D, 'D', alignRight: true);
    _drawPoint(canvas, E, 'E');
    _drawPoint(canvas, F, 'F');
    _drawPoint(canvas, G, 'G');
    _drawPoint(canvas, H, 'H');
    _drawPoint(canvas, I, 'I', alignRight: true);
    _drawPoint(canvas, J, 'J');
    _drawPoint(canvas, K, 'K');
    _drawPoint(canvas, M, 'M');
    _drawPoint(canvas, N, 'N');
    _drawPoint(canvas, O, 'O', alignBottom: true);
    _drawPoint(canvas, P, 'P', alignRight: true, alignBottom: true);
    _drawPoint(canvas, Q, 'Q');
    _drawPoint(canvas, R, 'R', alignBottom: true);
    _drawPoint(canvas, S, 'S', alignBottom: true);
  }

  void _drawGenericDiagram(Canvas canvas, Size size) {
    // Draw a simple placeholder diagram
    final rect = Rect.fromLTWH(20, 20, size.width - 40, size.height - 40);
    canvas.drawRect(rect, _linePaint);
    
    final textSpan = TextSpan(
      text: 'Rajah akan ditambah',
      style: TextStyle(color: labelColor, fontSize: 14),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset((size.width - textPainter.width) / 2, (size.height - textPainter.height) / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}