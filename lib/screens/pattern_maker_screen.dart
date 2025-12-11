import 'package:flutter/material.dart';
import '../models/pattern_models.dart';
import '../widgets/step_indicator.dart';
import '../widgets/measurement_form.dart';
import '../widgets/style_selection.dart';
import '../widgets/preview_and_notes.dart';

class PatternMakerScreen extends StatefulWidget {
  const PatternMakerScreen({super.key});

  @override
  State<PatternMakerScreen> createState() => _PatternMakerScreenState();
}

class _PatternMakerScreenState extends State<PatternMakerScreen> {
  int _currentStep = 0;
  final Measurements _measurements = Measurements();
  final StyleSelections _styleSelections = StyleSelections();
  final PageController _pageController = PageController();

  void _goToStep(int step) {
    setState(() {
      _currentStep = step;
    });
    _pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFF8b5cf6),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  bool _validateMeasurements() {
    if (!_measurements.isValid()) {
      _showToast('Sila lengkapkan semua ukuran penting');
      return false;
    }
    return true;
  }

  bool _validateStyles() {
    if (!_styleSelections.isComplete()) {
      _showToast('Sila pilih semua style (neckline, collar, bodice, sleeve, skirt)');
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFfef3c7),
            Color(0xFFfce7f3),
            Color(0xFFddd6fe),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.width < 600 ? 70 : 80,
          title: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isSmallScreen = MediaQuery.of(context).size.width < 600;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.home,
                          color: Theme.of(context).primaryColor,
                          size: isSmallScreen ? 20 : 28,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            'Pattern Maker Studio',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 18 : 28,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    if (!isSmallScreen) ...[
                      const SizedBox(height: 4),
                      const Text(
                        'Sistem Drafting Pola Pakaian untuk Pelajar',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.3),
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.3),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final screenHeight = constraints.maxHeight;
              final isSmallScreen = screenWidth < 600;
              final padding = isSmallScreen ? 12.0 : 24.0;

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    children: [
                      // Step Indicator
                      StepIndicator(
                        currentStep: _currentStep,
                        steps: const ['Ukuran', 'Style', 'Preview'],
                      ),
                      SizedBox(height: isSmallScreen ? 16 : 24),

                      // Content
                      SizedBox(
                        height: screenHeight - (isSmallScreen ? 120 : 150),
                        child: PageView(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            // Step 1: Measurements
                            MeasurementForm(
                              measurements: _measurements,
                              onNext: () {
                                if (_validateMeasurements()) {
                                  _goToStep(1);
                                }
                              },
                            ),

                            // Step 2: Style Selection
                            StyleSelection(
                              styleSelections: _styleSelections,
                              onBack: () => _goToStep(0),
                              onNext: () {
                                if (_validateStyles()) {
                                  _goToStep(2);
                                }
                              },
                            ),

                            // Step 3: Preview & Notes
                            PreviewAndNotes(
                              measurements: _measurements,
                              styleSelections: _styleSelections,
                              onBack: () => _goToStep(1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
