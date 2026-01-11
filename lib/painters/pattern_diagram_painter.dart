import 'package:flutter/material.dart';
import 'dart:math';
import '../utils/pattern_drafting_instructions.dart';

/// Painter for pattern drafting diagrams showing step-by-step construction
/// Matches the textbook reference images exactly
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
  void _drawPoint(Canvas canvas, Offset position, String label, {
    bool alignRight = false, 
    bool alignBottom = false,
    bool alignTop = false,
    bool alignLeft = false,
  }) {
    // Draw small circle for point
    canvas.drawCircle(position, 2.5, _pointPaint);
    
    // Draw label
    final textSpan = TextSpan(
      text: label,
      style: TextStyle(
        color: labelColor,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    
    double dx = position.dx;
    double dy = position.dy;
    
    if (alignRight) {
      dx = position.dx - textPainter.width - 5;
    } else if (alignLeft) {
      dx = position.dx + 5;
    } else {
      dx = position.dx - textPainter.width / 2;
    }
    
    if (alignBottom) {
      dy = position.dy + 4;
    } else if (alignTop) {
      dy = position.dy - textPainter.height - 3;
    } else {
      dy = position.dy - textPainter.height / 2;
    }
    
    textPainter.paint(canvas, Offset(dx, dy));
  }

  // Helper to draw dashed line
  void _drawDashedLine(Canvas canvas, Offset start, Offset end, {double dashLength = 5, double gapLength = 3}) {
    final distance = (end - start).distance;
    if (distance == 0) return;
    
    final dx = (end.dx - start.dx) / distance;
    final dy = (end.dy - start.dy) / distance;
    
    double currentDistance = 0;
    bool drawing = true;
    
    while (currentDistance < distance) {
      final segmentLength = drawing ? dashLength : gapLength;
      final nextDistance = (currentDistance + segmentLength).clamp(0.0, distance);
      
      if (drawing) {
        final startX = start.dx + dx * currentDistance;
        final startY = start.dy + dy * currentDistance;
        final endX = start.dx + dx * nextDistance;
        final endY = start.dy + dy * nextDistance;
        canvas.drawLine(Offset(startX, startY), Offset(endX, endY), _dashedPaint);
      }
      
      currentDistance = nextDistance;
      drawing = !drawing;
    }
  }

  // Helper to draw right angle marker
  void _drawRightAngle(Canvas canvas, Offset corner, Offset dir1, Offset dir2, double size) {
    final p1 = Offset(corner.dx + dir1.dx * size, corner.dy + dir1.dy * size);
    final p2 = Offset(corner.dx + dir1.dx * size + dir2.dx * size, corner.dy + dir1.dy * size + dir2.dy * size);
    final p3 = Offset(corner.dx + dir2.dx * size, corner.dy + dir2.dy * size);
    
    final path = Path();
    path.moveTo(p1.dx, p1.dy);
    path.lineTo(p2.dx, p2.dy);
    path.lineTo(p3.dx, p3.dy);
    canvas.drawPath(path, _dashedPaint);
  }

  // ==================== BACK BODICE STEPS ====================

  // BACK BODICE STEP 1 - Basic lines: A, B, C, D
  void _drawBackStep1(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final margin = 20.0;
    
    // Points matching reference image
    final A = Offset(w - margin - 10, margin + 10);           // Top right
    final B = Offset(w - margin - 10, h - margin - 10);       // Bottom right
    final C = Offset(margin + 30, margin + 10);               // Top left
    final D = Offset(margin + 30, margin + 40);               // Below C
    
    // Draw AB - vertical dashed line (main center line)
    _drawDashedLine(canvas, A, B);
    
    // Draw CA - horizontal dashed line
    _drawDashedLine(canvas, C, A);
    
    // Draw CD - short vertical solid line
    canvas.drawLine(C, D, _linePaint);
    
    // Draw right angle markers
    _drawRightAngle(canvas, C, Offset(1, 0), Offset(0, 1), 6);
    _drawRightAngle(canvas, A, Offset(-1, 0), Offset(0, 1), 6);
    
    // Draw points with labels
    _drawPoint(canvas, C, 'C', alignRight: true, alignTop: true);
    _drawPoint(canvas, A, 'A', alignLeft: true, alignTop: true);
    _drawPoint(canvas, D, 'D', alignRight: true);
    _drawPoint(canvas, B, 'B', alignLeft: true, alignBottom: true);
  }

  // BACK BODICE STEP 2 - Add neckline: E, F
  void _drawBackStep2(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final margin = 20.0;
    
    // Points
    final A = Offset(w - margin - 10, margin + 10);
    final B = Offset(w - margin - 10, h - margin - 10);
    final C = Offset(margin + 30, margin + 10);
    final D = Offset(margin + 30, margin + 40);
    final E = Offset(margin + 70, margin + 10);               // On CA line
    final F = Offset(w - margin - 10, margin + 35);           // Below A on AB line
    
    // Draw construction lines
    _drawDashedLine(canvas, C, A);
    canvas.drawLine(A, B, _linePaint);
    canvas.drawLine(C, D, _linePaint);
    
    // Draw shoulder line D to E
    canvas.drawLine(D, E, _linePaint);
    
    // Draw curved neckline E to F
    final neckPath = Path();
    neckPath.moveTo(E.dx, E.dy);
    neckPath.quadraticBezierTo(
      E.dx + 25, F.dy - 5,
      F.dx, F.dy,
    );
    canvas.drawPath(neckPath, _linePaint);
    
    // Right angle markers
    _drawRightAngle(canvas, C, Offset(1, 0), Offset(0, 1), 6);
    _drawRightAngle(canvas, A, Offset(-1, 0), Offset(0, 1), 6);
    _drawRightAngle(canvas, F, Offset(-1, 0), Offset(0, -1), 5);
    
    // Draw points
    _drawPoint(canvas, C, 'C', alignRight: true, alignTop: true);
    _drawPoint(canvas, A, 'A', alignLeft: true, alignTop: true);
    _drawPoint(canvas, D, 'D', alignRight: true);
    _drawPoint(canvas, E, 'E', alignTop: true);
    _drawPoint(canvas, F, 'F', alignLeft: true);
    _drawPoint(canvas, B, 'B', alignLeft: true, alignBottom: true);
  }

  // BACK BODICE STEP 3 - Add armhole: G, H, I, J, K, L
  void _drawBackStep3(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final margin = 18.0;
    
    // Points
    final A = Offset(w - margin - 10, margin + 8);
    final B = Offset(w - margin - 10, h - margin - 8);
    final C = Offset(margin + 25, margin + 8);
    final D = Offset(margin + 25, margin + 35);
    final E = Offset(margin + 65, margin + 8);
    final F = Offset(w - margin - 10, margin + 30);
    
    // Armhole points
    final chestLevel = margin + 75;   // J-I level
    final armholeLevel = margin + 105; // H-G level
    
    final G = Offset(w - margin - 10, armholeLevel);          // Right side armhole level
    final H = Offset(margin + 25, armholeLevel);              // Left side armhole level
    final I = Offset(w - margin - 10, chestLevel);            // Right side chest level
    final J = Offset(margin + 70, chestLevel);                // Middle chest level
    final K = Offset(margin + 55, armholeLevel);              // Below J
    final L = Offset(margin + 38, armholeLevel - 18);         // Armhole curve point
    
    // Draw construction lines (dashed)
    _drawDashedLine(canvas, C, A);
    _drawDashedLine(canvas, J, I);
    _drawDashedLine(canvas, H, G);
    
    // Draw main lines
    canvas.drawLine(A, B, _linePaint);
    canvas.drawLine(C, D, _linePaint);
    canvas.drawLine(D, E, _linePaint);  // Shoulder
    
    // Neckline curve
    final neckPath = Path();
    neckPath.moveTo(E.dx, E.dy);
    neckPath.quadraticBezierTo(E.dx + 20, F.dy - 5, F.dx, F.dy);
    canvas.drawPath(neckPath, _linePaint);
    
    // Armhole curve: D -> J -> L -> H
    final armholePath = Path();
    armholePath.moveTo(D.dx, D.dy);
    armholePath.quadraticBezierTo(D.dx + 15, D.dy + 20, J.dx, J.dy);
    armholePath.quadraticBezierTo(J.dx - 15, J.dy + 15, L.dx, L.dy);
    armholePath.quadraticBezierTo(L.dx - 8, L.dy + 12, H.dx, H.dy);
    canvas.drawPath(armholePath, _linePaint);
    
    // Right angle markers
    _drawRightAngle(canvas, C, Offset(1, 0), Offset(0, 1), 5);
    _drawRightAngle(canvas, G, Offset(-1, 0), Offset(0, -1), 5);
    
    // Draw points
    _drawPoint(canvas, C, 'C', alignRight: true, alignTop: true);
    _drawPoint(canvas, E, 'E', alignTop: true);
    _drawPoint(canvas, A, 'A', alignLeft: true, alignTop: true);
    _drawPoint(canvas, D, 'D', alignRight: true);
    _drawPoint(canvas, F, 'F', alignLeft: true);
    _drawPoint(canvas, J, 'J', alignTop: true);
    _drawPoint(canvas, I, 'I', alignLeft: true);
    _drawPoint(canvas, L, 'L', alignRight: true);
    _drawPoint(canvas, H, 'H', alignRight: true);
    _drawPoint(canvas, K, 'K', alignTop: true);
    _drawPoint(canvas, G, 'G', alignLeft: true);
    _drawPoint(canvas, B, 'B', alignLeft: true, alignBottom: true);
  }

  // BACK BODICE STEP 4 - Complete with dart and fill
  void _drawBackStep4(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final margin = 18.0;
    
    // Points
    final A = Offset(w - margin - 10, margin + 8);
    final B = Offset(w - margin - 10, h - margin - 8);
    final C = Offset(margin + 25, margin + 8);
    final D = Offset(margin + 25, margin + 35);
    final E = Offset(margin + 65, margin + 8);
    final F = Offset(w - margin - 10, margin + 30);
    
    final chestLevel = margin + 75;
    final armholeLevel = margin + 105;
    
    final G = Offset(w - margin - 10, armholeLevel);
    final H = Offset(margin + 25, armholeLevel);
    final I = Offset(w - margin - 10, chestLevel);
    final J = Offset(margin + 70, chestLevel);
    final K = Offset(margin + 55, armholeLevel);
    final L = Offset(margin + 38, armholeLevel - 18);
    
    // Waistline points
    final waistY = h - margin - 8;
    final M = Offset(margin + 25, waistY);                    // Bottom left
    final Q = Offset(margin + 45, waistY);                    // Left of dart
    final N = Offset(w - margin - 55, armholeLevel + 15);     // Dart apex
    final P = Offset(w - margin - 65, waistY);                // Dart left leg
    final O = Offset(w - margin - 45, waistY);                // Dart right leg
    
    // Draw filled pattern shape
    final patternPath = Path();
    patternPath.moveTo(F.dx, F.dy);
    
    // Neckline
    patternPath.quadraticBezierTo(E.dx + 20, F.dy - 5, E.dx, E.dy);
    patternPath.lineTo(D.dx, D.dy);
    
    // Armhole
    patternPath.quadraticBezierTo(D.dx + 15, D.dy + 20, J.dx, J.dy);
    patternPath.quadraticBezierTo(J.dx - 15, J.dy + 15, L.dx, L.dy);
    patternPath.quadraticBezierTo(L.dx - 8, L.dy + 12, H.dx, H.dy);
    
    // Left side down to waist
    patternPath.lineTo(M.dx, M.dy);
    patternPath.lineTo(Q.dx, Q.dy);
    
    // Dart
    patternPath.lineTo(P.dx, P.dy);
    patternPath.lineTo(N.dx, N.dy);
    patternPath.lineTo(O.dx, O.dy);
    
    // Bottom to B
    patternPath.lineTo(B.dx, B.dy);
    patternPath.lineTo(A.dx, A.dy);
    patternPath.lineTo(F.dx, F.dy);
    patternPath.close();
    
    // Fill and stroke
    canvas.drawPath(patternPath, _fillPaint);
    canvas.drawPath(patternPath, _linePaint);
    
    // Dart lines (emphasized)
    canvas.drawLine(N, P, _linePaint);
    canvas.drawLine(N, O, _linePaint);
    
    // Construction lines (dashed)
    _drawDashedLine(canvas, C, A);
    _drawDashedLine(canvas, J, I);
    _drawDashedLine(canvas, H, G);
    
    // Draw points
    _drawPoint(canvas, C, 'C', alignRight: true, alignTop: true);
    _drawPoint(canvas, E, 'E', alignTop: true);
    _drawPoint(canvas, A, 'A', alignLeft: true, alignTop: true);
    _drawPoint(canvas, D, 'D', alignRight: true);
    _drawPoint(canvas, F, 'F', alignLeft: true);
    _drawPoint(canvas, J, 'J', alignTop: true);
    _drawPoint(canvas, I, 'I', alignLeft: true);
    _drawPoint(canvas, L, 'L', alignRight: true);
    _drawPoint(canvas, H, 'H', alignRight: true);
    _drawPoint(canvas, K, 'K', alignTop: true);
    _drawPoint(canvas, G, 'G', alignLeft: true);
    _drawPoint(canvas, N, 'N', alignTop: true);
    _drawPoint(canvas, M, 'M', alignRight: true, alignBottom: true);
    _drawPoint(canvas, Q, 'Q', alignBottom: true);
    _drawPoint(canvas, P, 'P', alignBottom: true);
    _drawPoint(canvas, O, 'O', alignBottom: true);
    _drawPoint(canvas, B, 'B', alignLeft: true, alignBottom: true);
  }

  // ==================== FRONT BODICE STEPS ====================
  // Front bodice has deeper neckline and different dart placement

  void _drawFrontStep1(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final margin = 20.0;
    
    final A = Offset(w - margin - 10, margin + 10);
    final B = Offset(w - margin - 10, h - margin - 10);
    final C = Offset(margin + 30, margin + 10);
    final D = Offset(margin + 30, margin + 35);
    
    _drawDashedLine(canvas, A, B);
    _drawDashedLine(canvas, C, A);
    canvas.drawLine(C, D, _linePaint);
    
    _drawRightAngle(canvas, C, Offset(1, 0), Offset(0, 1), 6);
    _drawRightAngle(canvas, A, Offset(-1, 0), Offset(0, 1), 6);
    
    _drawPoint(canvas, C, 'C', alignRight: true, alignTop: true);
    _drawPoint(canvas, A, 'A', alignLeft: true, alignTop: true);
    _drawPoint(canvas, D, 'D', alignRight: true);
    _drawPoint(canvas, B, 'B', alignLeft: true, alignBottom: true);
  }

  void _drawFrontStep2(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final margin = 20.0;
    
    final A = Offset(w - margin - 10, margin + 10);
    final B = Offset(w - margin - 10, h - margin - 10);
    final C = Offset(margin + 30, margin + 10);
    final D = Offset(margin + 30, margin + 35);
    final E = Offset(margin + 65, margin + 10);
    final F = Offset(w - margin - 10, margin + 45);  // Deeper neckline for front
    
    _drawDashedLine(canvas, C, A);
    canvas.drawLine(A, B, _linePaint);
    canvas.drawLine(C, D, _linePaint);
    canvas.drawLine(D, E, _linePaint);
    
    // Deeper curved neckline for front
    final neckPath = Path();
    neckPath.moveTo(E.dx, E.dy);
    neckPath.quadraticBezierTo(
      E.dx + 30, F.dy - 10,
      F.dx, F.dy,
    );
    canvas.drawPath(neckPath, _linePaint);
    
    _drawRightAngle(canvas, C, Offset(1, 0), Offset(0, 1), 6);
    _drawRightAngle(canvas, A, Offset(-1, 0), Offset(0, 1), 6);
    _drawRightAngle(canvas, F, Offset(-1, 0), Offset(0, -1), 5);
    
    _drawPoint(canvas, C, 'C', alignRight: true, alignTop: true);
    _drawPoint(canvas, A, 'A', alignLeft: true, alignTop: true);
    _drawPoint(canvas, D, 'D', alignRight: true);
    _drawPoint(canvas, E, 'E', alignTop: true);
    _drawPoint(canvas, F, 'F', alignLeft: true);
    _drawPoint(canvas, B, 'B', alignLeft: true, alignBottom: true);
  }

  void _drawFrontStep3(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final margin = 18.0;
    
    final A = Offset(w - margin - 10, margin + 8);
    final B = Offset(w - margin - 10, h - margin - 8);
    final C = Offset(margin + 25, margin + 8);
    final D = Offset(margin + 25, margin + 35);
    final E = Offset(margin + 65, margin + 8);
    final F = Offset(w - margin - 10, margin + 40);
    
    final chestLevel = margin + 75;
    final armholeLevel = margin + 105;
    
    final G = Offset(w - margin - 10, armholeLevel);
    final H = Offset(margin + 25, armholeLevel);
    final I = Offset(w - margin - 10, chestLevel);
    final J = Offset(margin + 70, chestLevel);
    final K = Offset(margin + 55, armholeLevel);
    final L = Offset(margin + 38, armholeLevel - 18);
    
    _drawDashedLine(canvas, C, A);
    _drawDashedLine(canvas, J, I);
    _drawDashedLine(canvas, H, G);
    
    canvas.drawLine(A, B, _linePaint);
    canvas.drawLine(C, D, _linePaint);
    canvas.drawLine(D, E, _linePaint);
    
    final neckPath = Path();
    neckPath.moveTo(E.dx, E.dy);
    neckPath.quadraticBezierTo(E.dx + 25, F.dy - 8, F.dx, F.dy);
    canvas.drawPath(neckPath, _linePaint);
    
    final armholePath = Path();
    armholePath.moveTo(D.dx, D.dy);
    armholePath.quadraticBezierTo(D.dx + 15, D.dy + 20, J.dx, J.dy);
    armholePath.quadraticBezierTo(J.dx - 15, J.dy + 15, L.dx, L.dy);
    armholePath.quadraticBezierTo(L.dx - 8, L.dy + 12, H.dx, H.dy);
    canvas.drawPath(armholePath, _linePaint);
    
    _drawRightAngle(canvas, C, Offset(1, 0), Offset(0, 1), 5);
    _drawRightAngle(canvas, G, Offset(-1, 0), Offset(0, -1), 5);
    
    _drawPoint(canvas, C, 'C', alignRight: true, alignTop: true);
    _drawPoint(canvas, E, 'E', alignTop: true);
    _drawPoint(canvas, A, 'A', alignLeft: true, alignTop: true);
    _drawPoint(canvas, D, 'D', alignRight: true);
    _drawPoint(canvas, F, 'F', alignLeft: true);
    _drawPoint(canvas, J, 'J', alignTop: true);
    _drawPoint(canvas, I, 'I', alignLeft: true);
    _drawPoint(canvas, L, 'L', alignRight: true);
    _drawPoint(canvas, H, 'H', alignRight: true);
    _drawPoint(canvas, K, 'K', alignTop: true);
    _drawPoint(canvas, G, 'G', alignLeft: true);
    _drawPoint(canvas, B, 'B', alignLeft: true, alignBottom: true);
  }

  void _drawFrontStep4(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final margin = 18.0;
    
    final A = Offset(w - margin - 10, margin + 8);
    final B = Offset(w - margin - 10, h - margin - 8);
    final C = Offset(margin + 25, margin + 8);
    final D = Offset(margin + 25, margin + 35);
    final E = Offset(margin + 65, margin + 8);
    final F = Offset(w - margin - 10, margin + 40);
    
    final chestLevel = margin + 75;
    final armholeLevel = margin + 105;
    
    final G = Offset(w - margin - 10, armholeLevel);
    final H = Offset(margin + 25, armholeLevel);
    final I = Offset(w - margin - 10, chestLevel);
    final J = Offset(margin + 70, chestLevel);
    final K = Offset(margin + 55, armholeLevel);
    final L = Offset(margin + 38, armholeLevel - 18);
    
    final waistY = h - margin - 8;
    final M = Offset(margin + 25, waistY);
    final Q = Offset(margin + 45, waistY);
    final N = Offset(w - margin - 55, armholeLevel + 15);
    final P = Offset(w - margin - 65, waistY);
    final O = Offset(w - margin - 45, waistY);
    
    final patternPath = Path();
    patternPath.moveTo(F.dx, F.dy);
    patternPath.quadraticBezierTo(E.dx + 25, F.dy - 8, E.dx, E.dy);
    patternPath.lineTo(D.dx, D.dy);
    patternPath.quadraticBezierTo(D.dx + 15, D.dy + 20, J.dx, J.dy);
    patternPath.quadraticBezierTo(J.dx - 15, J.dy + 15, L.dx, L.dy);
    patternPath.quadraticBezierTo(L.dx - 8, L.dy + 12, H.dx, H.dy);
    patternPath.lineTo(M.dx, M.dy);
    patternPath.lineTo(Q.dx, Q.dy);
    patternPath.lineTo(P.dx, P.dy);
    patternPath.lineTo(N.dx, N.dy);
    patternPath.lineTo(O.dx, O.dy);
    patternPath.lineTo(B.dx, B.dy);
    patternPath.lineTo(A.dx, A.dy);
    patternPath.lineTo(F.dx, F.dy);
    patternPath.close();
    
    canvas.drawPath(patternPath, _fillPaint);
    canvas.drawPath(patternPath, _linePaint);
    
    canvas.drawLine(N, P, _linePaint);
    canvas.drawLine(N, O, _linePaint);
    
    _drawDashedLine(canvas, C, A);
    _drawDashedLine(canvas, J, I);
    _drawDashedLine(canvas, H, G);
    
    _drawPoint(canvas, C, 'C', alignRight: true, alignTop: true);
    _drawPoint(canvas, E, 'E', alignTop: true);
    _drawPoint(canvas, A, 'A', alignLeft: true, alignTop: true);
    _drawPoint(canvas, D, 'D', alignRight: true);
    _drawPoint(canvas, F, 'F', alignLeft: true);
    _drawPoint(canvas, J, 'J', alignTop: true);
    _drawPoint(canvas, I, 'I', alignLeft: true);
    _drawPoint(canvas, L, 'L', alignRight: true);
    _drawPoint(canvas, H, 'H', alignRight: true);
    _drawPoint(canvas, K, 'K', alignTop: true);
    _drawPoint(canvas, G, 'G', alignLeft: true);
    _drawPoint(canvas, N, 'N', alignTop: true);
    _drawPoint(canvas, M, 'M', alignRight: true, alignBottom: true);
    _drawPoint(canvas, Q, 'Q', alignBottom: true);
    _drawPoint(canvas, P, 'P', alignBottom: true);
    _drawPoint(canvas, O, 'O', alignBottom: true);
    _drawPoint(canvas, B, 'B', alignLeft: true, alignBottom: true);
  }

  void _drawGenericDiagram(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(20, 20, size.width - 40, size.height - 40);
    canvas.drawRect(rect, _linePaint);
    
    final textSpan = TextSpan(
      text: 'Rajah',
      style: TextStyle(color: labelColor, fontSize: 12),
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