import 'package:flutter/material.dart';
import '../utils/pattern_drafting_instructions.dart';
import '../painters/pattern_diagram_painter.dart';

class PreviewAndNotes extends StatefulWidget {
  final Map<String, double> measurements;
  final Map<String, String> styleSelections;

  const PreviewAndNotes({
    super.key,
    required this.measurements,
    required this.styleSelections,
  });

  @override
  State<PreviewAndNotes> createState() => _PreviewAndNotesState();
}

class _PreviewAndNotesState extends State<PreviewAndNotes> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PatternDraftingInstructions _instructions;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _instructions = PatternDraftingInstructions(
      measurements: widget.measurements,
      styles: widget.styleSelections,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tab bar
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.brown.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.brown.shade700,
            indicator: BoxDecoration(
              color: Colors.brown.shade600,
              borderRadius: BorderRadius.circular(10),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: 'Badan Belakang'),
              Tab(text: 'Badan Hadapan'),
              Tab(text: 'Pengubahsuaian'),
            ],
          ),
        ),
        
        // Tab content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildBackBodiceTab(),
              _buildFrontBodiceTab(),
              _buildModificationsTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackBodiceTab() {
    final steps = _instructions.getBackBodiceSteps();
    return _buildStepsList(
      title: 'POLA ASAS BADAN BELAKANG',
      subtitle: 'Basic Back Bodice Pattern',
      steps: steps,
    );
  }

  Widget _buildFrontBodiceTab() {
    final steps = _instructions.getFrontBodiceSteps();
    return _buildStepsList(
      title: 'POLA ASAS BADAN HADAPAN',
      subtitle: 'Basic Front Bodice Pattern',
      steps: steps,
    );
  }

  Widget _buildModificationsTab() {
    final modifications = _instructions.getStyleModifications();
    return _buildStepsList(
      title: 'PENGUBAHSUAIAN STAIL',
      subtitle: 'Style Modifications',
      steps: modifications,
      showDiagram: false,
    );
  }

  Widget _buildStepsList({
    required String title,
    required String subtitle,
    required List<PatternStep> steps,
    bool showDiagram = true,
  }) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.brown.shade700, Colors.brown.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.brown.shade100,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Measurements summary
        _buildMeasurementsSummary(),
        
        const SizedBox(height: 16),
        
        // Steps
        ...steps.map((step) => _buildStepCard(step, showDiagram: showDiagram)),
      ],
    );
  }

  Widget _buildMeasurementsSummary() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.amber.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.straighten, size: 18, color: Colors.amber.shade700),
              const SizedBox(width: 8),
              Text(
                'Ukuran Anda',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: widget.measurements.entries.map((entry) {
              final label = _getMeasurementLabel(entry.key);
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '$label: ${entry.value.toStringAsFixed(1)} cm',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.brown.shade700,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  String _getMeasurementLabel(String key) {
    final labels = {
      'bust': 'Dada',
      'waist': 'Pinggang',
      'hip': 'Pinggul',
      'shoulderLength': 'Bahu',
      'backLength': 'Labuh Belakang',
      'frontLength': 'Labuh Depan',
      'armhole': 'Lubang Lengan',
      'sleeveLength': 'Panjang Lengan',
      'bustDistance': 'Jarak Dada',
      'skirtLength': 'Panjang Skirt',
    };
    return labels[key] ?? key;
  }

  Widget _buildStepCard(PatternStep step, {bool showDiagram = true}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.brown.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade600,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${step.stepNumber}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    step.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Step content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Diagram
                if (showDiagram && _shouldShowDiagram(step.diagramType))
                  Container(
                    width: 140,
                    height: 160,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: CustomPaint(
                        size: const Size(140, 160),
                        painter: PatternDiagramPainter(
                          diagramType: step.diagramType,
                          measurements: widget.measurements,
                        ),
                      ),
                    ),
                  ),
                
                // Instructions
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: step.instructions.asMap().entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              margin: const EdgeInsets.only(top: 6, right: 8),
                              decoration: BoxDecoration(
                                color: Colors.brown.shade400,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                entry.value,
                                style: TextStyle(
                                  fontSize: 13,
                                  height: 1.4,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _shouldShowDiagram(DiagramType type) {
    // Only show diagrams for main bodice construction steps
    return type == DiagramType.backStep1 ||
           type == DiagramType.backStep2 ||
           type == DiagramType.backStep3 ||
           type == DiagramType.backStep4 ||
           type == DiagramType.frontStep1 ||
           type == DiagramType.frontStep2 ||
           type == DiagramType.frontStep3 ||
           type == DiagramType.frontStep4;
  }
}