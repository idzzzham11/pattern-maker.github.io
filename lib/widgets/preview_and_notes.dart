import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/pattern_models.dart';
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
    _tabTitles = [
      'Badan',
    ];
    
    if (widget.styleSelections.collar != null && 
        widget.styleSelections.collar != 'No Collar') {
      _tabTitles.add('Kolar');
    }
    
    if (widget.styleSelections.sleeve != null && 
        widget.styleSelections.sleeve != 'Sleeveless') {
      _tabTitles.add('Lengan');
    }
    
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
      'backLength': widget.measurements.backCenter,
      'frontLength': widget.measurements.frontCenter,
      'armhole': widget.measurements.armhole,
      'sleeveLength': widget.measurements.sleeveLength,
      'bustDistance': widget.measurements.bust / 5,
      'skirtLength': widget.measurements.skirtLength,
    };
  }

  Map<String, String> _getStylesMap() {
    return {
      'neckline': widget.styleSelections.neckline ?? 'Basic Neckline',
      'collar': widget.styleSelections.collar ?? 'No Collar',
      'bodice': widget.styleSelections.bodice ?? 'Basic Fitted',
      'sleeve': widget.styleSelections.sleeve ?? 'Sleeveless',
      'skirt': widget.styleSelections.skirt ?? 'Straight',
    };
  }

  // Get image path based on diagram type
  String _getImagePath(DiagramType type) {
    switch (type) {
      // Back Bodice steps
      case DiagramType.backStep1:
        return 'assets/images/bodices/basic_backbodice_step_1.jpg';
      case DiagramType.backStep2:
        return 'assets/images/bodices/basic_backbodice_step_2.jpg';
      case DiagramType.backStep3:
        return 'assets/images/bodices/basic_backbodice_step_3.jpg';
      case DiagramType.backStep4:
        return 'assets/images/bodices/basic_backbodice_step_4.jpg';
      // Front Bodice steps
      case DiagramType.frontStep1:
        return 'assets/images/bodices/basic_frontbodice_step_1.jpg';
      case DiagramType.frontStep2:
        return 'assets/images/bodices/basic_frontbodice_step_2.jpg';
      case DiagramType.frontStep3:
        return 'assets/images/bodices/basic_frontbodice_step_3.jpg';
      case DiagramType.frontStep4:
        return 'assets/images/bodices/basic_frontbodice_step_4.jpg';
      // Basic sleeve steps
      case DiagramType.sleeveStep1:
        return 'assets/images/sleeves/basic_sleeve_step_1.jpg';
      case DiagramType.sleeveStep2:
        return 'assets/images/sleeves/basic_sleeve_step_2.jpg';
      case DiagramType.sleeveStep3:
        return 'assets/images/sleeves/basic_sleeve_step_3.jpg';
      case DiagramType.sleeveStep4:
        return 'assets/images/sleeves/basic_sleeve_step_4.jpg';
      case DiagramType.sleeveStep5:
        return 'assets/images/sleeves/basic_sleeve_step_5.jpg';
      case DiagramType.sleeveStep6:
        return 'assets/images/sleeves/basic_sleeve_step_6.jpg';
      case DiagramType.sleevePuffStep4:
        return '';
      // Basic skirt steps
      case DiagramType.skirtFrontStep1:
        return 'assets/images/skirts/basic_frontskirt_step_1.jpg';
      case DiagramType.skirtFrontStep2:
        return 'assets/images/skirts/basic_frontskirt_step_2.jpg';
      case DiagramType.skirtBackStep1:
        return 'assets/images/skirts/basic_backskirt_step_1.jpg';
      case DiagramType.skirtBackStep2:
        return 'assets/images/skirts/basic_backskirt_step_2.jpg';
      // 12 Gore Graduated Flare steps
      case DiagramType.skirt12GoreStep1:
        return 'assets/images/skirts/skirt_12goregraduatedflare_step_1.jpg';
      case DiagramType.skirt12GoreStep2:
        return 'assets/images/skirts/skirt_12goregraduatedflare_step_2.jpg';
      case DiagramType.skirt12GoreStep3:
        return 'assets/images/skirts/skirt_12goregraduatedflare_step_3.jpg';
      // Skirts With Yoke steps
      case DiagramType.skirtYokeStep1:
        return 'assets/images/skirts/skirt_skirtswithyokes_step_1.jpg';
      case DiagramType.skirtYokeStep2:
        return 'assets/images/skirts/skirt_skirtswithyokes_step_2.jpg';
      case DiagramType.skirtYokeStep3:
        return 'assets/images/skirts/skirt_skirtswithyokes_step_3.jpg';
      // Tiers steps
      case DiagramType.skirtTiersStep1:
        return 'assets/images/skirts/skirt_tiers_step_1.jpg';
      case DiagramType.skirtTiersStep2:
        return 'assets/images/skirts/skirt_tiers_step_2.jpg';
      // Godets steps
      case DiagramType.skirtGodetsStep1:
        return 'assets/images/skirts/skirt_godets_step_1.jpg';
      case DiagramType.skirtGodetsStep2:
        return 'assets/images/skirts/skirt_godets_step_2.jpg';
      case DiagramType.skirtGodetsStep3:
        return 'assets/images/skirts/skirt_godets_step_3.jpg';
      case DiagramType.skirtGodetsStep4:
        return 'assets/images/skirts/skirt_godets_step_4.jpg';
      case DiagramType.skirtGodetsStep5:
        return 'assets/images/skirts/skirt_godets_step_5.jpg';
      // Full Circle steps
      case DiagramType.skirtCircleStep1:
        return 'assets/images/skirts/skirt_circle_step_1.jpg';
      case DiagramType.skirtCircleStep2:
        return 'assets/images/skirts/skirt_circle_step_2.jpg';
      case DiagramType.skirtMermaidStep1:
        return 'assets/images/skirts/skirt_mermaid_step_1.jpg';
      case DiagramType.skirtMermaidStep2:
        return 'assets/images/skirts/skirt_mermaid_step_2.jpg';
      case DiagramType.skirtMermaidStep3:
        return 'assets/images/skirts/skirt_mermaid_step_3.jpg';
      // Neckline styles
      case DiagramType.necklineBoatStep1:
        return 'assets/images/necklines/neckline_boat_step_1.jpg';
      case DiagramType.necklineCowlStep1:
        return 'assets/images/necklines/neckline_cowl_step_1.jpg';
      case DiagramType.necklineCowlStep2:
        return 'assets/images/necklines/neckline_cowl_step_2.jpg';
      case DiagramType.necklineCowlStep3:
        return 'assets/images/necklines/neckline_cowl_step_3.jpg';
      case DiagramType.necklineCrossoverStep1:
        return 'assets/images/necklines/neckline_crossover_step_1.jpg';
      case DiagramType.necklineCrossoverStep2:
        return 'assets/images/necklines/neckline_crossover_step_2.jpg';
      case DiagramType.necklineCrossoverStep3:
        return 'assets/images/necklines/neckline_crossover_step_3.jpg';
      case DiagramType.necklineCrossoverStep4:
        return 'assets/images/necklines/neckline_crossover_step_4.jpg';
      case DiagramType.necklineDeepScoopStep1:
        return 'assets/images/necklines/neckline_deepscoop_step_1.jpg';
      case DiagramType.necklineVStep1:
        return 'assets/images/necklines/neckline_vshape_step_1.jpg';
      // Collar styles
      case DiagramType.collarMandarinStep1:
        return 'assets/images/collars/collar_mandarin_step_1.jpg';
      case DiagramType.collarShirtStep1:
        return 'assets/images/collars/collar_one_piece_step_1.jpg';
      case DiagramType.collarShirtStep2:
        return 'assets/images/collars/collar_one_piece_step_2.jpg';
      case DiagramType.collarPeterPanStep1:
        return 'assets/images/collars/collar_peter_pan_step_1.jpg';
      case DiagramType.collarPeterPanStep2:
        return 'assets/images/collars/collar_peter_pan_step_2.jpg';
      case DiagramType.collarSailorStep1:
        return 'assets/images/collars/collar_sailor_step_1.jpg';
      case DiagramType.collarShawlStep1:
        return 'assets/images/collars/collar_shawl_step_1.jpg';
      case DiagramType.collarShawlStep2:
        return 'assets/images/collars/collar_shawl_step_2.jpg';
      case DiagramType.collarShawlStep3:
        return 'assets/images/collars/collar_shawl_step_3.jpg';
      case DiagramType.collarShawlStep4:
        return 'assets/images/collars/collar_shawl_step_4.jpg';
      // Bodice styles
      case DiagramType.bodiceBustSemiYokeStep1:
        return 'assets/images/bodices/bodice_bust_semi_yoke_step_1.jpg';
      case DiagramType.bodiceBustSemiYokeStep2:
        return 'assets/images/bodices/bodice_bust_semi_yoke_step_2.jpg';
      case DiagramType.bodiceDartClusterStep1:
        return 'assets/images/bodices/bodice_dart_cluster_step_1.jpg';
      case DiagramType.bodiceDartClusterStep2:
        return 'assets/images/bodices/bodice_dart_cluster_step_2.jpg';
      case DiagramType.bodiceDartClusterStep3:
        return 'assets/images/bodices/bodice_dart_cluster_step_3.jpg';
      case DiagramType.bodiceDoubleShoulderTucksStep1:
        return 'assets/images/bodices/bodice_double_shoulder_tucks_step_1.jpg';
      case DiagramType.bodiceDoubleShoulderTucksStep2:
        return 'assets/images/bodices/bodice_double_shoulder_tucks_step_2.jpg';
      case DiagramType.bodiceDoubleShoulderTucksStep3:
        return 'assets/images/bodices/bodice_double_shoulder_tucks_step_3.jpg';
      case DiagramType.bodiceFlangeInsetStep1:
        return 'assets/images/bodices/bodice_flange_inset_step_1.jpg';
      case DiagramType.bodiceFlangeInsetStep2:
        return 'assets/images/bodices/bodice_flange_inset_step_2.jpg';
      case DiagramType.bodicePinTucksStep1:
        return 'assets/images/bodices/bodice_pin_tucks_step_1.jpg';
      case DiagramType.bodicePinTucksStep2:
        return 'assets/images/bodices/bodice_pin_tucks_step_2.jpg';
      case DiagramType.bodicePinTucksStep3:
        return 'assets/images/bodices/bodice_pin_tucks_step_3.jpg';
      case DiagramType.bodicePrincessLineStep1:
        return 'assets/images/bodices/bodice_princess_line_step_1.jpg';
      case DiagramType.bodicePrincessLineStep2:
        return 'assets/images/bodices/bodice_princess_line_step_2.jpg';
      // Sleeve style steps
      case DiagramType.sleeveCapStep1:
        return 'assets/images/sleeves/sleeve_cap_step_1.jpg';
      case DiagramType.sleeveCapStep2:
        return 'assets/images/sleeves/sleeve_cap_step_2.jpg';
      case DiagramType.sleeveCircularStep1:
        return 'assets/images/sleeves/sleeve_circularhemline_step_1.jpg';
      case DiagramType.sleeveCircularStep2:
        return 'assets/images/sleeves/sleeve_circularhemline_step_2.jpg';
      case DiagramType.sleeveCircularStep3:
        return 'assets/images/sleeves/sleeve_circularhemline_step_3.jpg';
      case DiagramType.sleevePetalStep1:
        return 'assets/images/sleeves/sleeve_petal_step_1.jpg';
      case DiagramType.sleevePetalStep2:
        return 'assets/images/sleeves/sleeve_petal_step_2.jpg';
      case DiagramType.sleevePetalStep3:
        return 'assets/images/sleeves/sleeve_petal_step_3.jpg';
      case DiagramType.sleeveLanternStep1:
        return 'assets/images/sleeves/sleeve_lantern_step_1.jpg';
      case DiagramType.sleeveLanternStep2:
        return 'assets/images/sleeves/sleeve_lantern_step_2.jpg';
      case DiagramType.sleeveLanternStep3:
        return 'assets/images/sleeves/sleeve_lantern_step_3.jpg';
      case DiagramType.sleeveLanternStep4:
        return 'assets/images/sleeves/sleeve_lantern_step_4.jpg';
      case DiagramType.sleevePuffStep1:
        return 'assets/images/sleeves/sleeve_puff_step_1.jpg';
      case DiagramType.sleevePuffStep2:
        return 'assets/images/sleeves/sleeve_puff_step_2.jpg';
      case DiagramType.sleevePuffStep3:
        return 'assets/images/sleeves/sleeve_puff_step_3.jpg';
      default:
        return '';
    }
  }

  List<PatternStep> _getStepsForCurrentTab() {
    final currentTab = _tabTitles[_tabController.index];
    final neckline = widget.styleSelections.neckline ?? 'Basic Neckline';
    final bodice = widget.styleSelections.bodice ?? 'Basic Fitted';
    final collar = widget.styleSelections.collar ?? 'No Collar';
    final sleeve = widget.styleSelections.sleeve ?? 'Sleeveless';
    final skirt = widget.styleSelections.skirt ?? 'Straight';

    switch (currentTab) {
      case 'Badan':
        return [
          ..._instructions.getBackBodiceSteps(),
          ..._instructions.getFrontBodiceSteps(),
          ..._instructions.getNecklineSteps(neckline),
          ..._instructions.getBodiceStyleSteps(bodice),
        ];
      case 'Kolar':
        return _instructions.getCollarSteps(collar);
      case 'Lengan':
        return [
          ..._instructions.getBasicSleeveSteps(),
          ..._instructions.getSleeveSteps(sleeve),
        ];
      case 'Skirt':
        return [
          ..._instructions.getBasicSkirtFrontSteps(),
          ..._instructions.getBasicSkirtBackSteps(),
          ..._instructions.getSkirtSteps(skirt),
        ];
      default:
        return [];
    }
  }

  String _getSectionTitle() {
    final currentTab = _tabTitles[_tabController.index];
    final neckline = widget.styleSelections.neckline ?? 'Basic Neckline';
    final bodice = widget.styleSelections.bodice ?? 'Basic Fitted';
    final collar = widget.styleSelections.collar ?? 'No Collar';
    final sleeve = widget.styleSelections.sleeve ?? 'Sleeveless';
    final skirt = widget.styleSelections.skirt ?? 'Straight';
    switch (currentTab) {
      case 'Badan': return 'Badan - $neckline / $bodice';
      case 'Kolar': return 'Kolar - $collar';
      case 'Lengan': return 'Lengan - $sleeve';
      case 'Skirt': return 'Skirt - $skirt';
      default: return currentTab;
    }
  }

  void _showPrintOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pilih Jenis Cetakan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Color(0xFF8b5cf6)),
                title: const Text('Gambar Sahaja'),
                subtitle: const Text('6 gambar setiap halaman'),
                onTap: () {
                  Navigator.pop(context);
                  _printPhotosOnly();
                },
              ),
              ListTile(
                leading: const Icon(Icons.article, color: Color(0xFF8b5cf6)),
                title: const Text('Gambar & Nota'),
                subtitle: const Text('Gambar dengan arahan langkah demi langkah'),
                onTap: () {
                  Navigator.pop(context);
                  _printPhotosAndNotes();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _printPhotosOnly() async {
    final steps = _getStepsForCurrentTab();
    final stepsWithImages = steps.where((s) => _shouldShowDiagram(s.diagramType)).toList();
    final sectionTitle = _getSectionTitle();

    final pdf = pw.Document();
    const imagesPerPage = 6;
    const cols = 2;
    const rows = 3;

    for (int pageStart = 0; pageStart < stepsWithImages.length; pageStart += imagesPerPage) {
      final pageSteps = stepsWithImages.skip(pageStart).take(imagesPerPage).toList();

      final imageWidgets = await Future.wait(pageSteps.map((step) async {
        final path = _getImagePath(step.diagramType);
        try {
          final bytes = await _loadAssetBytes(path);
          final image = pw.MemoryImage(bytes);
          return pw.Column(
            children: [
              pw.Expanded(
                child: pw.Image(image, fit: pw.BoxFit.contain),
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                'Langkah ${step.stepNumber}: ${step.title}',
                style: const pw.TextStyle(fontSize: 8),
                textAlign: pw.TextAlign.center,
              ),
            ],
          );
        } catch (_) {
          return pw.Container();
        }
      }));

      // Pad to full grid
      while (imageWidgets.length < imagesPerPage) {
        imageWidgets.add(pw.Container());
      }

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(24),
          build: (_) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              if (pageStart == 0) ...[
                pw.Text('Arahan Pembinaan Pola',
                    style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
                pw.Text(sectionTitle,
                    style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
                pw.SizedBox(height: 8),
                pw.Divider(),
                pw.SizedBox(height: 8),
              ],
              pw.Expanded(
                child: pw.GridView(
                  crossAxisCount: cols,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: imageWidgets,
                ),
              ),
            ],
          ),
        ),
      );
    }

    await Printing.layoutPdf(onLayout: (_) async => pdf.save());
  }

  Future<void> _printPhotosAndNotes() async {
    final steps = _getStepsForCurrentTab();
    final sectionTitle = _getSectionTitle();

    // Pre-load all images before building PDF
    final Map<int, pw.MemoryImage?> images = {};
    await Future.wait(steps.map((step) async {
      if (_shouldShowDiagram(step.diagramType)) {
        final path = _getImagePath(step.diagramType);
        if (path.isNotEmpty) {
          try {
            final bytes = await _loadAssetBytes(path);
            images[step.stepNumber] = pw.MemoryImage(bytes);
          } catch (_) {
            images[step.stepNumber] = null;
          }
        }
      }
    }));

    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (_) => [
          pw.Text('Arahan Pembinaan Pola',
              style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
          pw.Text(sectionTitle,
              style: pw.TextStyle(fontSize: 14, color: PdfColors.grey700)),
          pw.SizedBox(height: 16),
          pw.Divider(),
          pw.SizedBox(height: 12),
          ...steps.map((step) {
            final image = images[step.stepNumber];
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Langkah ${step.stepNumber}: ${step.title}',
                  style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 4),
                if (image != null)
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(vertical: 6),
                    child: pw.Center(
                      child: pw.SizedBox(
                        height: 160,
                        child: pw.Image(image, fit: pw.BoxFit.contain),
                      ),
                    ),
                  ),
                ...step.instructions.map((instruction) => pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 12, bottom: 2),
                  child: pw.Text('• $instruction', style: const pw.TextStyle(fontSize: 11)),
                )),
                pw.SizedBox(height: 12),
              ],
            );
          }),
        ],
      ),
    );

    await Printing.layoutPdf(onLayout: (_) async => pdf.save());
  }

  Future<Uint8List> _loadAssetBytes(String assetPath) async {
    final byteData = await DefaultAssetBundle.of(context).load(assetPath);
    return byteData.buffer.asUint8List();
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
              color: Color(0xFF8b5cf6),
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
                    TextButton.icon(
                      onPressed: () => _showPrintOptions(context),
                      icon: const Icon(Icons.print, color: Colors.white, size: 18),
                      label: const Text('Print', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.25),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _buildStyleSummaryChips(isSmallScreen),
              ],
            ),
          ),

          // Tab bar
          Container(
            color: const Color(0xFFf3f0ff),
            child: TabBar(
              controller: _tabController,
              isScrollable: _tabTitles.length > 3,
              labelColor: Colors.white,
              unselectedLabelColor: const Color(0xFF8b5cf6),
              indicator: const BoxDecoration(
                color: Color(0xFF8b5cf6),
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
                      isSmallScreen ? 'Kembali' : 'Kembali Ubah Stail',
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
    final neckline = widget.styleSelections.neckline ?? 'Basic Neckline';
    final bodice = widget.styleSelections.bodice ?? 'Bust Semi Yoke';
    
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
        ..._instructions.getNecklineSteps(neckline).map(
          (step) => _buildStepCard(step, isSmallScreen, showDiagram: true),
        ),
        
        SizedBox(height: isSmallScreen ? 16 : 20),
        
        // Section: Bodice Style Modification
        _buildSectionHeader(
          'PENGUBAHSUAIAN BADAN: ${bodice.toUpperCase()}',
          'Bodice Modification',
          isSmallScreen,
        ),
        ..._instructions.getBodiceStyleSteps(bodice).map(
          (step) => _buildStepCard(step, isSmallScreen, showDiagram: true),
        ),
      ],
    );
  }

  Widget _buildCollarTab(bool isSmallScreen) {
    final collar = widget.styleSelections.collar ?? 'No Collar';
    
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
          (step) => _buildStepCard(step, isSmallScreen, showDiagram: true),
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
        
        // Section: Basic Sleeve Pattern (Pola Asas Lengan)
        _buildSectionHeader('POLA ASAS LENGAN', 'Basic Sleeve Pattern', isSmallScreen),
        ..._instructions.getBasicSleeveSteps().map(
          (step) => _buildStepCard(step, isSmallScreen, showDiagram: true),
        ),
        
        SizedBox(height: isSmallScreen ? 16 : 20),
        
        // Section: Style Modification
        _buildSectionHeader(
          'PENGUBAHSUAIAN LENGAN: ${sleeve.toUpperCase()}',
          'Sleeve Stail Modification',
          isSmallScreen,
        ),
        ..._instructions.getSleeveSteps(sleeve).map(
          (step) => _buildStepCard(step, isSmallScreen, showDiagram: true),
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
        
        // Section: Basic Skirt Front Pattern
        _buildSectionHeader('POLA ASAS SKIRT HADAPAN', 'Basic Front Skirt Pattern', isSmallScreen),
        ..._instructions.getBasicSkirtFrontSteps().map(
          (step) => _buildStepCard(step, isSmallScreen, showDiagram: true),
        ),
        
        SizedBox(height: isSmallScreen ? 16 : 20),
        
        // Section: Basic Skirt Back Pattern
        _buildSectionHeader('POLA ASAS SKIRT BELAKANG', 'Basic Back Skirt Pattern', isSmallScreen),
        ..._instructions.getBasicSkirtBackSteps().map(
          (step) => _buildStepCard(step, isSmallScreen, showDiagram: true),
        ),
        
        SizedBox(height: isSmallScreen ? 16 : 20),
        
        // Section: Style Modification
        _buildSectionHeader(
          'PENGUBAHSUAIAN SKIRT: ${skirt.toUpperCase()}',
          'Skirt Stail Modification',
          isSmallScreen,
        ),
        ..._instructions.getSkirtSteps(skirt).map(
          (step) => _buildStepCard(step, isSmallScreen, showDiagram: true),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String subtitle, bool isSmallScreen) {
    return Container(
      margin: EdgeInsets.only(bottom: isSmallScreen ? 12 : 16),
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      decoration: BoxDecoration(
        color: const Color(0xFF8b5cf6),
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
              color: const Color(0xFFe5dbff),
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
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF8b5cf6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Saiz ${widget.measurements.selectedSize}',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 11 : 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              _measurementTag('Dada: ${widget.measurements.bust.toStringAsFixed(0)} cm', isSmallScreen),
              _measurementTag('Pinggang: ${widget.measurements.waist.toStringAsFixed(0)} cm', isSmallScreen),
              _measurementTag('Pinggul: ${widget.measurements.hip.toStringAsFixed(0)} cm', isSmallScreen),
              _measurementTag('Bahu: ${widget.measurements.shoulder.toStringAsFixed(0)} cm', isSmallScreen),
              _measurementTag('Lubang Lengan: ${widget.measurements.armhole.toStringAsFixed(0)} cm', isSmallScreen),
              _measurementTag('Labuh Lengan: ${widget.measurements.sleeveLength.toStringAsFixed(0)} cm', isSmallScreen),
              _measurementTag('Labuh Skirt: ${widget.measurements.skirtLength.toStringAsFixed(0)} cm', isSmallScreen),
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
          color: const Color(0xFF8b5cf6),
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
        border: Border.all(color: const Color(0xFFe5dbff)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8b5cf6).withOpacity(0.08),
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
              color: Color(0xFFf3f0ff),
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
                    color: Color(0xFF8b5cf6),
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
                      color: const Color(0xFF6b21a8),
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
                      // Image on top for mobile - BIGGER SIZE - TAPPABLE
                      Center(
                        child: GestureDetector(
                          onTap: () => _showFullScreenImage(
                            context,
                            _getImagePath(step.diagramType),
                            step.title,
                          ),
                          child: Container(
                            width: 220,
                            height: 240,
                            decoration: BoxDecoration(
                              color: const Color(0xFFf9f5ff),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0xFFe5dbff)),
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Image.asset(
                                    _getImagePath(step.diagramType),
                                    fit: BoxFit.contain,
                                    width: 220,
                                    height: 240,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.image, color: Colors.grey.shade400, size: 30),
                                            const SizedBox(height: 4),
                                            Text(
                                              'Rajah ${step.stepNumber}',
                                              style: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                // Zoom icon hint
                                Positioned(
                                  right: 6,
                                  bottom: 6,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Icon(
                                      Icons.zoom_in,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                      // Image on left for desktop - BIGGER SIZE - TAPPABLE
                      if (shouldShowDiagram)
                        GestureDetector(
                          onTap: () => _showFullScreenImage(
                            context,
                            _getImagePath(step.diagramType),
                            step.title,
                          ),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              width: isSmallScreen ? 180 : 240,
                              height: isSmallScreen ? 200 : 260,
                              margin: const EdgeInsets.only(right: 14),
                              decoration: BoxDecoration(
                                color: const Color(0xFFf9f5ff),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: const Color(0xFFe5dbff)),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: Image.asset(
                                      _getImagePath(step.diagramType),
                                      fit: BoxFit.contain,
                                      width: isSmallScreen ? 180 : 240,
                                      height: isSmallScreen ? 200 : 260,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.image, color: Colors.grey.shade400, size: 30),
                                              const SizedBox(height: 4),
                                              Text(
                                                'Rajah ${step.stepNumber}',
                                                style: TextStyle(
                                                  color: Colors.grey.shade500,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  // Zoom icon hint
                                  Positioned(
                                    right: 6,
                                    bottom: 6,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Icon(
                                        Icons.zoom_in,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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

  // Show full screen image dialog with zoom and pan
  void _showFullScreenImage(BuildContext context, String imagePath, String title) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            // Image with zoom and pan
            Positioned.fill(
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 4.0,
                child: Center(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.white54,
                          size: 64,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            
            // Title bar at top
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            
            // Close button
            Positioned(
              top: 8,
              right: 8,
              child: SafeArea(
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
            
            // Hint text at bottom
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Cubit untuk zum • Ketuk untuk tutup',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
              color: Color(0xFF8b5cf6),
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
    return // Basic Sleeve steps
           type == DiagramType.sleeveStep1 ||
           type == DiagramType.sleeveStep2 ||
           type == DiagramType.sleeveStep3 ||
           type == DiagramType.sleeveStep4 ||
           type == DiagramType.sleeveStep5 ||
           type == DiagramType.sleeveStep6 ||
           // Basic Back Bodice steps
           type == DiagramType.backStep1 ||
           type == DiagramType.backStep2 ||
           type == DiagramType.backStep3 ||
           type == DiagramType.backStep4 ||
           // Basic Front Bodice steps
           type == DiagramType.frontStep1 ||
           type == DiagramType.frontStep2 ||
           type == DiagramType.frontStep3 ||
           type == DiagramType.frontStep4 ||
           // Basic Skirt steps
           type == DiagramType.skirtFrontStep1 ||
           type == DiagramType.skirtFrontStep2 ||
           type == DiagramType.skirtBackStep1 ||
           type == DiagramType.skirtBackStep2 ||
           // 12 Gore Graduated Flare steps
           type == DiagramType.skirt12GoreStep1 ||
           type == DiagramType.skirt12GoreStep2 ||
           type == DiagramType.skirt12GoreStep3 ||
           // Skirts With Yoke steps
           type == DiagramType.skirtYokeStep1 ||
           type == DiagramType.skirtYokeStep2 ||
           type == DiagramType.skirtYokeStep3 ||
           // Tiers steps
           type == DiagramType.skirtTiersStep1 ||
           type == DiagramType.skirtTiersStep2 ||
           // Godets steps
           type == DiagramType.skirtGodetsStep1 ||
           type == DiagramType.skirtGodetsStep2 ||
           type == DiagramType.skirtGodetsStep3 ||
           type == DiagramType.skirtGodetsStep4 ||
           type == DiagramType.skirtGodetsStep5 ||
           // Full Circle steps
           type == DiagramType.skirtCircleStep1 ||
           type == DiagramType.skirtCircleStep2 ||
           // Mermaid steps
           type == DiagramType.skirtMermaidStep1 ||
           type == DiagramType.skirtMermaidStep2 ||
           type == DiagramType.skirtMermaidStep3 ||
           // Neckline styles with images
           type == DiagramType.necklineBoatStep1 ||
           type == DiagramType.necklineCowlStep1 ||
           type == DiagramType.necklineCowlStep2 ||
           type == DiagramType.necklineCowlStep3 ||
           type == DiagramType.necklineCrossoverStep1 ||
           type == DiagramType.necklineCrossoverStep2 ||
           type == DiagramType.necklineCrossoverStep3 ||
           type == DiagramType.necklineCrossoverStep4 ||
           type == DiagramType.necklineDeepScoopStep1 ||
           type == DiagramType.necklineVStep1 ||
           // Collar styles with images
           type == DiagramType.collarMandarinStep1 ||
           type == DiagramType.collarShirtStep1 ||
           type == DiagramType.collarShirtStep2 ||
           type == DiagramType.collarPeterPanStep1 ||
           type == DiagramType.collarPeterPanStep2 ||
           type == DiagramType.collarSailorStep1 ||
           type == DiagramType.collarShawlStep1 ||
           type == DiagramType.collarShawlStep2 ||
           type == DiagramType.collarShawlStep3 ||
           type == DiagramType.collarShawlStep4 ||
           // Bodice styles with images
           type == DiagramType.bodiceBustSemiYokeStep1 ||
           type == DiagramType.bodiceBustSemiYokeStep2 ||
           type == DiagramType.bodiceDartClusterStep1 ||
           type == DiagramType.bodiceDartClusterStep2 ||
           type == DiagramType.bodiceDartClusterStep3 ||
           type == DiagramType.bodiceDoubleShoulderTucksStep1 ||
           type == DiagramType.bodiceDoubleShoulderTucksStep2 ||
           type == DiagramType.bodiceDoubleShoulderTucksStep3 ||
           type == DiagramType.bodiceFlangeInsetStep1 ||
           type == DiagramType.bodiceFlangeInsetStep2 ||
           type == DiagramType.bodicePinTucksStep1 ||
           type == DiagramType.bodicePinTucksStep2 ||
           type == DiagramType.bodicePinTucksStep3 ||
           type == DiagramType.bodicePrincessLineStep1 ||
           type == DiagramType.bodicePrincessLineStep2 ||
           // Sleeve style steps
           type == DiagramType.sleeveCapStep1 ||
           type == DiagramType.sleeveCapStep2 ||
           type == DiagramType.sleeveCircularStep1 ||
           type == DiagramType.sleeveCircularStep2 ||
           type == DiagramType.sleeveCircularStep3 ||
           type == DiagramType.sleevePetalStep1 ||
           type == DiagramType.sleevePetalStep2 ||
           type == DiagramType.sleevePetalStep3 ||
           type == DiagramType.sleeveLanternStep1 ||
           type == DiagramType.sleeveLanternStep2 ||
           type == DiagramType.sleeveLanternStep3 ||
           type == DiagramType.sleeveLanternStep4 ||
           type == DiagramType.sleevePuffStep1 ||
           type == DiagramType.sleevePuffStep2 ||
           type == DiagramType.sleevePuffStep3;
  }
}