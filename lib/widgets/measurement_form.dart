import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final _formKey = GlobalKey<FormState>();

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
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '📏',
                  style: TextStyle(fontSize: isSmallScreen ? 24 : 32),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Langkah 1: Masukkan Ukuran Badan',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 18 : isMediumScreen ? 20 : 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1f2937),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: isSmallScreen ? 16 : isMediumScreen ? 24 : 32),
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    isSmallScreen
                        ? Column(
                            children: [
                              _buildTextField(
                                label: 'Nama Profile',
                                onChanged: (value) => widget.measurements.name = value,
                                isRequired: true,
                              ),
                              const SizedBox(height: 16),
                              _buildDropdown(
                                label: 'Unit Ukuran',
                                value: widget.measurements.unit,
                                items: const ['cm', 'inch'],
                                onChanged: (value) {
                                  setState(() {
                                    widget.measurements.unit = value!;
                                  });
                                },
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: _buildTextField(
                                  label: 'Nama Profile',
                                  onChanged: (value) => widget.measurements.name = value,
                                  isRequired: true,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildDropdown(
                                  label: 'Unit Ukuran',
                                  value: widget.measurements.unit,
                                  items: const ['cm', 'inch'],
                                  onChanged: (value) {
                                    setState(() {
                                      widget.measurements.unit = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                    SizedBox(height: isSmallScreen ? 16 : 24),

                    _buildMeasurementGrid(isSmallScreen, isMediumScreen),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
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
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeasurementGrid(bool isSmallScreen, bool isMediumScreen) {
    final crossAxisCount = isSmallScreen ? 1 : isMediumScreen ? 2 : 3;
    final childAspectRatio = isSmallScreen ? 4.0 : isMediumScreen ? 3.0 : 2.5;

    return GridView.count(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: childAspectRatio,
      children: [
        _buildNumberField(
          label: 'Bust',
          onChanged: (value) => widget.measurements.bust = value,
          isRequired: true,
        ),
        _buildNumberField(
          label: 'Waist (Pinggang)',
          onChanged: (value) => widget.measurements.waist = value,
          isRequired: true,
        ),
        _buildNumberField(
          label: 'Hip (Pinggul)',
          onChanged: (value) => widget.measurements.hip = value,
          isRequired: true,
        ),
        _buildNumberField(
          label: 'Shoulder Width',
          initialValue: widget.measurements.shoulder,
          onChanged: (value) => widget.measurements.shoulder = value,
        ),
        _buildNumberField(
          label: 'Back Length',
          initialValue: widget.measurements.backLength,
          onChanged: (value) => widget.measurements.backLength = value,
        ),
        _buildNumberField(
          label: 'Sleeve Length',
          initialValue: widget.measurements.sleeveLength,
          onChanged: (value) => widget.measurements.sleeveLength = value,
        ),
        _buildNumberField(
          label: 'Armhole Depth',
          initialValue: widget.measurements.armhole,
          onChanged: (value) => widget.measurements.armhole = value,
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required Function(String) onChanged,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFe5e7eb), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFe5e7eb), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFa78bfa), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          onChanged: onChanged,
          validator: isRequired
              ? (value) => value?.isEmpty ?? true ? 'Required' : null
              : null,
        ),
      ],
    );
  }

  Widget _buildNumberField({
    required String label,
    required Function(double) onChanged,
    double? initialValue,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue != null && initialValue > 0
              ? initialValue.toString()
              : null,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFe5e7eb), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFe5e7eb), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFa78bfa), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          onChanged: (value) {
            final number = double.tryParse(value);
            if (number != null) {
              onChanged(number);
            }
          },
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFe5e7eb), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFe5e7eb), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFa78bfa), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item == 'cm' ? 'Sentimeter (cm)' : 'Inci (inch)'),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
