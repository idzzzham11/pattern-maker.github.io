import 'package:flutter/material.dart';
import '../models/pattern_models.dart';
import '../painters/pattern_diagram_painter.dart';
import '../utils/pattern_drafting_instructions.dart';

class PreviewAndNotes extends StatefulWidget {
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
  State<PreviewAndNotes> createState() => _PreviewAndNotesState();
}

class _PreviewAndNotesState extends State<PreviewAndNotes> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PatternDraftingInstructions _instructions;
  late List<String> _tabTitles;

  @override
  void initState() {
    super.initState();
    _buildTabs();
    _instructions = PatternDraftingInstructions(
      measurements: _getMeasurementsMap(),
      styles: _getStylesMap(),
    );
  }

  void _buildTabs() {
    // Build tabs based on selected styles
    _tabTitles = [
      'Badan', // Always show bodice (front & back)
    ];
    
    // Add collar tab if selected
    if (widget.styleSelections.collar != null && 
        widget.styleSelections.collar != 'No Collar') {
      _tabTitles.add('Kolar');
    }
    
    // Add sleeve tab if selected
    if (widget.styleSelections.sleeve != null && 
        widget.styleSelections.sleeve != 'Sleeveless') {
      _tabTitles.add('Lengan');
    }
    
    // Add skirt tab
    if (widget.styleSelections.skirt != null) {
      _tabTitles.add('Skirt');
    }
    
    _tabController = TabController(length: _tabTitles.length, vsync: this);
  }

  Map<String, double> _getMeasurementsMap() {
    return {
      'bust': widget.measurements.bust,
      'waist': widget.measurements.waist,
      'hip': widget.measurements.hip,
      'shoulderLength': widget.measurements.shoulder,
      'backLength': widget.measurements.backLength,
      'frontLength': widget.measurements.backLength + 3,
      'armhole': widget.measurements.armhole,
      'sleeveLength': widget.measurements.sleeveLength,
      'bustDistance': widget.measurements.bust / 5,
      'skirtLength': 60,
    };
  }

  Map<String, String> _getStylesMap() {
    return {
      'neckline': widget.styleSelections.neckline ?? 'Round',
      'collar': widget.styleSelections.collar ?? 'No Collar',
      'bodice': widget.styleSelections.bodice ?? 'Basic Fitted',
      'sleeve': widget.styleSelections.sleeve ?? 'Sleeveless',
      'skirt': widget.styleSelections.skirt ?? 'Straight',
    };
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
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
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
            decoration: const BoxDecoration(
              color: Color(0xFF5d4037),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '📐',
                      style: TextStyle(fontSize: isSmallScreen ? 20 : 26),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Arahan Pembinaan Pola',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 16 : 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Style summary chips
                _buildStyleSummaryChips(isSmallScreen),
              ],
            ),
          ),

          // Tab bar
          Container(
            color: const Color(0xFFefebe9),
            child: TabBar(
              controller: _tabController,
              isScrollable: _tabTitles.length > 3,
              labelColor: Colors.white,
              unselectedLabelColor: const Color(0xFF5d4037),
              indicator: const BoxDecoration(
                color: Color(0xFF5d4037),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                fontSize: isSmallScreen ? 12 : 14,
                fontWeight: FontWeight.w600,
              ),
              tabs: _tabTitles.map((title) => Tab(text: title)).toList(),
            ),
          ),

          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _buildTabContents(isSmallScreen),
            ),
          ),

          // Back button
          Container(
            padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
            child: SizedBox(
              width: double.infinity,
              height: isSmallScreen ? 44 : 50,
              child: OutlinedButton(
                onPressed: widget.onBack,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFe5e7eb), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.arrow_back, color: Color(0xFF6b7280), size: 20),
                    const SizedBox(width: 8),
                    Text(
                      isSmallScreen ? 'Kembali' : 'Kembali Ubah Style',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 13 : 15,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF6b7280),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStyleSummaryChips(bool isSmallScreen) {
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: [
        _styleChip('${widget.styleSelections.neckline}', isSmallScreen),
        if (widget.styleSelections.collar != 'No Collar')
          _styleChip('${widget.styleSelections.collar}', isSmallScreen),
        _styleChip('${widget.styleSelections.bodice}', isSmallScreen),
        if (widget.styleSelections.sleeve != 'Sleeveless')
          _styleChip('${widget.styleSelections.sleeve}', isSmallScreen),
        _styleChip('${widget.styleSelections.skirt}', isSmallScreen),
      ],
    );
  }

  Widget _styleChip(String label, bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 8 : 10,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: isSmallScreen ? 10 : 11,
          color: Colors.white,
        ),
      ),
    );
  }

  List<Widget> _buildTabContents(bool isSmallScreen) {
    List<Widget> contents = [];
    
    for (String title in _tabTitles) {
      switch (title) {
        case 'Badan':
          contents.add(_buildBodiceTab(isSmallScreen));
          break;
        case 'Kolar':
          contents.add(_buildCollarTab(isSmallScreen));
          break;
        case 'Lengan':
          contents.add(_buildSleeveTab(isSmallScreen));
          break;
        case 'Skirt':
          contents.add(_buildSkirtTab(isSmallScreen));
          break;
      }
    }
    
    return contents;
  }

  Widget _buildBodiceTab(bool isSmallScreen) {
    final neckline = widget.styleSelections.neckline ?? 'Round';
    final bodice = widget.styleSelections.bodice ?? 'Basic Fitted';
    
    return ListView(
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      children: [
        _buildMeasurementsSummary(isSmallScreen),
        SizedBox(height: isSmallScreen ? 12 : 16),
        
        // Section: Back Bodice
        _buildSectionHeader('POLA BADAN BELAKANG', 'Back Bodice Pattern', isSmallScreen),
        ..._instructions.getBackBodiceSteps().map(
          (step) => _buildStepCard(step, isSmallScreen),
        ),
        
        SizedBox(height: isSmallScreen ? 16 : 20),
        
        // Section: Front Bodice
        _buildSectionHeader('POLA BADAN HADAPAN', 'Front Bodice Pattern', isSmallScreen),
        ..._instructions.getFrontBodiceSteps().map(
          (step) => _buildStepCard(step, isSmallScreen),
        ),
        
        SizedBox(height: isSmallScreen ? 16 : 20),
        
        // Section: Neckline Modification
        _buildSectionHeader(
          'PENGUBAHSUAIAN GARIS LEHER: ${neckline.toUpperCase()}',
          'Neckline Modification',
          isSmallScreen,
        ),
        _buildStepCard(_instructions.getNecklineSteps(neckline), isSmallScreen, showDiagram: false),
        
        // Section: Bodice Style Modification (if not basic)
        if (bodice != 'Basic Fitted') ...[
          SizedBox(height: isSmallScreen ? 16 : 20),
          _buildSectionHeader(
            'PENGUBAHSUAIAN BADAN: ${bodice.toUpperCase()}',
            'Bodice Modification',
            isSmallScreen,
          ),
          _buildStepCard(_instructions.getBodiceStyleSteps(bodice), isSmallScreen, showDiagram: false),
        ],
      ],
    );
  }

  Widget _buildCollarTab(bool isSmallScreen) {
    final collar = widget.styleSelections.collar ?? 'Shirt Collar';
    
    return ListView(
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      children: [
        _buildMeasurementsSummary(isSmallScreen),
        SizedBox(height: isSmallScreen ? 12 : 16),
        
        _buildSectionHeader(
          'POLA KOLAR: ${collar.toUpperCase()}',
          'Collar Pattern',
          isSmallScreen,
        ),
        ..._instructions.getCollarSteps(collar).map(
          (step) => _buildStepCard(step, isSmallScreen, showDiagram: false),
        ),
      ],
    );
  }

  Widget _buildSleeveTab(bool isSmallScreen) {
    final sleeve = widget.styleSelections.sleeve ?? 'Short';
    
    return ListView(
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      children: [
        _buildMeasurementsSummary(isSmallScreen),
        SizedBox(height: isSmallScreen ? 12 : 16),
        
        _buildSectionHeader(
          'POLA LENGAN: ${sleeve.toUpperCase()}',
          'Sleeve Pattern',
          isSmallScreen,
        ),
        ..._instructions.getSleeveSteps(sleeve).map(
          (step) => _buildStepCard(step, isSmallScreen, showDiagram: false),
        ),
      ],
    );
  }

  Widget _buildSkirtTab(bool isSmallScreen) {
    final skirt = widget.styleSelections.skirt ?? 'Straight';
    
    return ListView(
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      children: [
        _buildMeasurementsSummary(isSmallScreen),
        SizedBox(height: isSmallScreen ? 12 : 16),
        
        _buildSectionHeader(
          'POLA SKIRT: ${skirt.toUpperCase()}',
          'Skirt Pattern',
          isSmallScreen,
        ),
        ..._instructions.getSkirtSteps(skirt).map(
          (step) => _buildStepCard(step, isSmallScreen, showDiagram: false),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String subtitle, bool isSmallScreen) {
    return Container(
      margin: EdgeInsets.only(bottom: isSmallScreen ? 12 : 16),
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.brown.shade700, Colors.brown.shade500],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isSmallScreen ? 13 : 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: isSmallScreen ? 10 : 12,
              color: Colors.brown.shade100,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMeasurementsSummary(bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 10 : 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFFCA28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.straighten, size: isSmallScreen ? 16 : 18, color: const Color(0xFFF57F17)),
              const SizedBox(width: 8),
              Text(
                'Ukuran Anda',
                style: TextStyle(
                  fontSize: isSmallScreen ? 12 : 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFF57F17),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              _measurementTag('Dada: ${widget.measurements.bust} ${widget.measurements.unit}', isSmallScreen),
              _measurementTag('Pinggang: ${widget.measurements.waist} ${widget.measurements.unit}', isSmallScreen),
              _measurementTag('Pinggul: ${widget.measurements.hip} ${widget.measurements.unit}', isSmallScreen),
              _measurementTag('Bahu: ${widget.measurements.shoulder} ${widget.measurements.unit}', isSmallScreen),
              _measurementTag('Labuh Belakang: ${widget.measurements.backLength} ${widget.measurements.unit}', isSmallScreen),
            ],
          ),
        ],
      ),
    );
  }

  Widget _measurementTag(String text, bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 8 : 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isSmallScreen ? 10 : 12,
          color: const Color(0xFF5d4037),
        ),
      ),
    );
  }

  Widget _buildStepCard(PatternStep step, bool isSmallScreen, {bool showDiagram = true}) {
    final shouldShowDiagram = showDiagram && _shouldShowDiagram(step.diagramType);
    
    return Container(
      margin: EdgeInsets.only(bottom: isSmallScreen ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step header
          Container(
            padding: EdgeInsets.all(isSmallScreen ? 10 : 12),
            decoration: const BoxDecoration(
              color: Color(0xFFEFEBE9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(11),
                topRight: Radius.circular(11),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: isSmallScreen ? 26 : 32,
                  height: isSmallScreen ? 26 : 32,
                  decoration: const BoxDecoration(
                    color: Color(0xFF5d4037),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${step.stepNumber}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: isSmallScreen ? 12 : 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    step.title,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4E342E),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Step content
          Padding(
            padding: EdgeInsets.all(isSmallScreen ? 10 : 14),
            child: isSmallScreen && shouldShowDiagram
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Diagram on top for mobile
                      Center(
                        child: Container(
                          width: 140,
                          height: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFE0E0E0)),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: CustomPaint(
                                  size: const Size(140, 150),
                                  painter: PatternDiagramPainter(
                                    diagramType: step.diagramType,
                                    measurements: _getMeasurementsMap(),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 4,
                                left: 4,
                                child: Text(
                                  '✓',
                                  style: TextStyle(
                                    color: Colors.green.shade600,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...step.instructions.map((instruction) => _buildInstructionItem(instruction, isSmallScreen)),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Diagram on left for desktop
                      if (shouldShowDiagram)
                        Container(
                          width: isSmallScreen ? 120 : 150,
                          height: isSmallScreen ? 140 : 170,
                          margin: const EdgeInsets.only(right: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFE0E0E0)),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: CustomPaint(
                                  size: Size(isSmallScreen ? 120 : 150, isSmallScreen ? 140 : 170),
                                  painter: PatternDiagramPainter(
                                    diagramType: step.diagramType,
                                    measurements: _getMeasurementsMap(),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 6,
                                left: 6,
                                child: Text(
                                  '✓',
                                  style: TextStyle(
                                    color: Colors.green.shade600,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      // Instructions
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: step.instructions
                              .map((instruction) => _buildInstructionItem(instruction, isSmallScreen))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructionItem(String instruction, bool isSmallScreen) {
    return Padding(
      padding: EdgeInsets.only(bottom: isSmallScreen ? 6 : 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 5,
            height: 5,
            margin: EdgeInsets.only(top: isSmallScreen ? 5 : 6, right: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF8D6E63),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              instruction,
              style: TextStyle(
                fontSize: isSmallScreen ? 11 : 13,
                height: 1.4,
                color: const Color(0xFF424242),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _shouldShowDiagram(DiagramType type) {
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