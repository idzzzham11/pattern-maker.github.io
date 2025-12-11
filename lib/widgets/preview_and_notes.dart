import 'package:flutter/material.dart';
import '../models/pattern_models.dart';
import '../painters/garment_preview_painter.dart';
import '../utils/pattern_instructions.dart';

class PreviewAndNotes extends StatelessWidget {
  final Measurements measurements;
  final StyleSelections styleSelections;
  final VoidCallback onBack;

  const PreviewAndNotes({
    super.key,
    required this.measurements,
    required this.styleSelections,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 900;

    return isSmallScreen
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Preview Section
              Expanded(
                flex: 2,
                child: _buildPreviewSection(context, isSmallScreen),
              ),
              const SizedBox(height: 16),
              // Notes Section
              Expanded(
                flex: 3,
                child: _buildNotesSection(context, isSmallScreen),
              ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 3D Preview
              Expanded(
                child: _buildPreviewSection(context, isSmallScreen),
              ),
              const SizedBox(width: 24),
              // Pattern Notes
              Expanded(
                child: _buildNotesSection(context, isSmallScreen),
              ),
            ],
          );
  }

  Widget _buildPreviewSection(BuildContext context, bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 16 : 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '🎨',
                style: TextStyle(fontSize: isSmallScreen ? 22 : 28),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Preview Pola 2D',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1f2937),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isSmallScreen ? 16 : 24),


          // Canvas Preview
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFfaf5ff),
                    Color(0xFFf3e8ff),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFa78bfa).withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.all(isSmallScreen ? 8 : 16),
              child: CustomPaint(
                painter: GarmentPreviewPainter(
                  measurements: measurements,
                  styleSelections: styleSelections,
                ),
                size: Size.infinite,
              ),
            ),
          ),

          SizedBox(height: isSmallScreen ? 16 : 24),


          // Style Summary
          Container(
            padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
            decoration: BoxDecoration(
              color: const Color(0xFFf5f3ff),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ringkasan Style:',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 12 : 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF7c3aed),
                  ),
                ),
                SizedBox(height: isSmallScreen ? 8 : 12),
                _buildSummaryRow('Neckline', styleSelections.neckline ?? ''),
                _buildSummaryRow('Collar', styleSelections.collar ?? ''),
                _buildSummaryRow('Bodice', styleSelections.bodice ?? ''),
                _buildSummaryRow('Sleeve', styleSelections.sleeve ?? ''),
                _buildSummaryRow('Skirt', styleSelections.skirt ?? ''),
                const SizedBox(height: 8),
                Text(
                  'Bust: ${measurements.bust}${measurements.unit} | '
                  'Waist: ${measurements.waist}${measurements.unit} | '
                  'Hip: ${measurements.hip}${measurements.unit}',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 10 : 11,
                    color: const Color(0xFF6b7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesSection(BuildContext context, bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 16 : 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '📝',
                style: TextStyle(fontSize: isSmallScreen ? 22 : 28),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Nota Pola Step-by-Step',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1f2937),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isSmallScreen ? 16 : 24),

          // Pattern Instructions
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: PatternInstructions.generateInstructions(
                  measurements,
                  styleSelections,
                ),
              ),
            ),
          ),

          SizedBox(height: isSmallScreen ? 16 : 24),
          SizedBox(
            width: double.infinity,
            height: isSmallScreen ? 48 : 56,
            child: OutlinedButton(
              onPressed: onBack,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFe5e7eb), width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_back, color: Color(0xFF6b7280)),
                  const SizedBox(width: 8),
                  Text(
                    isSmallScreen ? 'Kembali' : 'Kembali Ubah Style',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF6b7280),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF374151),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6b7280),
            ),
          ),
        ],
      ),
    );
  }
}
