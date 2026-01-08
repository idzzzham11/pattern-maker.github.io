import 'package:flutter/material.dart';
import '../models/pattern_models.dart';
import '../painters/garment_preview_painter.dart';

class FullGarmentPreviewScreen extends StatefulWidget {
  final Measurements measurements;
  final StyleSelections styleSelections;

  const FullGarmentPreviewScreen({
    super.key,
    required this.measurements,
    required this.styleSelections,
  });

  @override
  State<FullGarmentPreviewScreen> createState() => _FullGarmentPreviewScreenState();
}

class _FullGarmentPreviewScreenState extends State<FullGarmentPreviewScreen> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f3ff),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1f2937)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Garment Preview',
          style: TextStyle(
            color: Color(0xFF1f2937),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.zoom_in, color: Color(0xFF1f2937)),
            onPressed: () {
              setState(() {
                _scale = (_scale + 0.2).clamp(0.5, 3.0);
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.zoom_out, color: Color(0xFF1f2937)),
            onPressed: () {
              setState(() {
                _scale = (_scale - 0.2).clamp(0.5, 3.0);
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Color(0xFF1f2937)),
            onPressed: () {
              setState(() {
                _scale = 1.0;
              });
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Style Summary Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Wrap(
                spacing: 16,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  _buildStyleChip('Neckline', widget.styleSelections.neckline ?? ''),
                  _buildStyleChip('Collar', widget.styleSelections.collar ?? ''),
                  _buildStyleChip('Bodice', widget.styleSelections.bodice ?? ''),
                  _buildStyleChip('Sleeve', widget.styleSelections.sleeve ?? ''),
                  _buildStyleChip('Skirt', widget.styleSelections.skirt ?? ''),
                ],
              ),
            ),

            // Main Preview Area
            Expanded(
              child: Center(
                child: InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 3.0,
                  child: Transform.scale(
                    scale: _scale,
                    child: Container(
                      width: 600,
                      height: 800,
                      margin: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CustomPaint(
                          painter: GarmentPreviewPainter(
                            measurements: widget.measurements,
                            styleSelections: widget.styleSelections,
                          ),
                          size: const Size(600, 800),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Bottom Info Bar
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.info_outline, size: 16, color: Color(0xFF6b7280)),
                  const SizedBox(width: 8),
                  Text(
                    'Zoom: ${(_scale * 100).toInt()}% | Pinch to zoom | Drag to pan',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6b7280),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStyleChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFf5f3ff),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFa78bfa),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF7c3aed),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF374151),
            ),
          ),
        ],
      ),
    );
  }
}