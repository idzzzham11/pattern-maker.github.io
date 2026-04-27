import 'package:flutter/material.dart';
import '../models/pattern_models.dart';

class MeasurementForm extends StatefulWidget {
  final Measurements measurements;
  final VoidCallback onNext;

  const MeasurementForm({
    super.key,
    required this.measurements,
    required this.onNext,
  });

  @override
  State<MeasurementForm> createState() => _MeasurementFormState();
}

class _MeasurementFormState extends State<MeasurementForm> {
  @override
  void dispose() {
    super.dispose();
  }

  void _selectSize(String size) {
    setState(() {
      widget.measurements.applySize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 1024;

    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 16 : isMediumScreen ? 24 : 32),
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
              Text('📏', style: TextStyle(fontSize: isSmallScreen ? 24 : 32)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Langkah 1: Pilih Saiz',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 18 : isMediumScreen ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1f2937),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isSmallScreen ? 16 : 24),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Size selector
                  Text(
                    'Pilih Saiz',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF374151),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildSizeCards(isSmallScreen),

                  // Measurement table (shows when size selected)
                  if (widget.measurements.selectedSize.isNotEmpty) ...[
                    SizedBox(height: isSmallScreen ? 20 : 28),
                    _buildMeasurementTable(isSmallScreen),
                  ],
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: widget.onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFa78bfa),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Teruskan ke Pemilihan Style',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeCards(bool isSmallScreen) {
    return Row(
      children: ['S', 'M', 'L'].map((size) {
        final isSelected = widget.measurements.selectedSize == size;
        return Expanded(
          child: GestureDetector(
            onTap: () => _selectSize(size),
            child: Container(
              margin: EdgeInsets.only(
                right: size != 'L' ? 12 : 0,
              ),
              padding: EdgeInsets.symmetric(
                vertical: isSmallScreen ? 20 : 28,
              ),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFa78bfa) : const Color(0xFFf9f5ff),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? const Color(0xFF8b5cf6) : const Color(0xFFe5dbff),
                  width: isSelected ? 2.5 : 1.5,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: const Color(0xFFa78bfa).withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: Column(
                children: [
                  Text(
                    size,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : const Color(0xFF8b5cf6),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    size == 'S'
                        ? 'Small'
                        : size == 'M'
                            ? 'Medium'
                            : 'Large',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 11 : 13,
                      color: isSelected ? Colors.white70 : const Color(0xFF9ca3af),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMeasurementTable(bool isSmallScreen) {
    final size = widget.measurements.selectedSize;
    final data = SizeChart.data[size]!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFe5dbff)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Table header
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 12 : 16,
              vertical: isSmallScreen ? 10 : 12,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF8b5cf6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(11),
                topRight: Radius.circular(11),
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Ukuran',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                Text(
                  'Saiz $size',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          // Table rows
          ...List.generate(SizeChart.rowLabels.length, (i) {
            final label = SizeChart.rowLabels[i];
            final key = SizeChart.rowKeys[i];
            final value = data[key]!;
            final isEven = i % 2 == 0;

            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 12 : 16,
                vertical: isSmallScreen ? 8 : 10,
              ),
              decoration: BoxDecoration(
                color: isEven ? Colors.white : const Color(0xFFfaf5ff),
                borderRadius: i == SizeChart.rowLabels.length - 1
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(11),
                        bottomRight: Radius.circular(11),
                      )
                    : null,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 13,
                        color: const Color(0xFF374151),
                      ),
                    ),
                  ),
                  Text(
                    '${value.toStringAsFixed(0)} cm',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 13,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF8b5cf6),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
