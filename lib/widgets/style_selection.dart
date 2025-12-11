import 'package:flutter/material.dart';
import '../models/pattern_models.dart';
import '../painters/style_icon_painter.dart';

class StyleSelection extends StatefulWidget {
  final StyleSelections styleSelections;
  final VoidCallback onBack;
  final VoidCallback onNext;

  const StyleSelection({
    super.key,
    required this.styleSelections,
    required this.onBack,
    required this.onNext,
  });

  @override
  State<StyleSelection> createState() => _StyleSelectionState();
}

class _StyleSelectionState extends State<StyleSelection> {
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
              Text(
                '✨',
                style: TextStyle(fontSize: isSmallScreen ? 24 : 32),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Langkah 2: Pilih Style Pakaian',
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
                  _buildStyleSection(
                    'A. Neckline (Leher)',
                    StyleOptions.necklines,
                    widget.styleSelections.neckline,
                    (value) => setState(() => widget.styleSelections.neckline = value),
                    'neckline',
                    isSmallScreen,
                    isMediumScreen,
                  ),
                  SizedBox(height: isSmallScreen ? 16 : 24),

                  _buildStyleSection(
                    'B. Collar (Kolar)',
                    StyleOptions.collars,
                    widget.styleSelections.collar,
                    (value) => setState(() => widget.styleSelections.collar = value),
                    'collar',
                    isSmallScreen,
                    isMediumScreen,
                  ),
                  SizedBox(height: isSmallScreen ? 16 : 24),

                  _buildStyleSection(
                    'C. Bodice (Badan)',
                    StyleOptions.bodices,
                    widget.styleSelections.bodice,
                    (value) => setState(() => widget.styleSelections.bodice = value),
                    'bodice',
                    isSmallScreen,
                    isMediumScreen,
                  ),
                  SizedBox(height: isSmallScreen ? 16 : 24),

                  _buildStyleSection(
                    'D. Sleeve (Lengan)',
                    StyleOptions.sleeves,
                    widget.styleSelections.sleeve,
                    (value) => setState(() => widget.styleSelections.sleeve = value),
                    'sleeve',
                    isSmallScreen,
                    isMediumScreen,
                  ),
                  SizedBox(height: isSmallScreen ? 16 : 24),

                  _buildStyleSection(
                    'E. Skirt (Skirt/Bahagian Bawah)',
                    StyleOptions.skirts,
                    widget.styleSelections.skirt,
                    (value) => setState(() => widget.styleSelections.skirt = value),
                    'skirt',
                    isSmallScreen,
                    isMediumScreen,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: OutlinedButton(
                    onPressed: widget.onBack,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFe5e7eb), width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back, color: Color(0xFF6b7280)),
                        SizedBox(width: 8),
                        Text(
                          'Kembali',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6b7280),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: SizedBox(
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
                          'Teruskan ke Preview & Nota Pola',
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
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStyleSection(
    String title,
    List<StyleOption> options,
    String? selectedValue,
    Function(String) onSelect,
    String category,
    bool isSmallScreen,
    bool isMediumScreen,
  ) {
    final crossAxisCount = isSmallScreen ? 2 : isMediumScreen ? 3 : 4;
    final childAspectRatio = isSmallScreen ? 0.75 : isMediumScreen ? 0.8 : 0.85;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isSmallScreen ? 16 : 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFa78bfa),
          ),
        ),
        SizedBox(height: isSmallScreen ? 12 : 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: isSmallScreen ? 12 : 16,
            mainAxisSpacing: isSmallScreen ? 12 : 16,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: options.length,
          itemBuilder: (context, index) {
            final option = options[index];
            final isSelected = selectedValue == option.name;

            return _StyleCard(
              option: option,
              category: category,
              isSelected: isSelected,
              onTap: () => onSelect(option.name),
            );
          },
        ),
      ],
    );
  }
}

class _StyleCard extends StatefulWidget {
  final StyleOption option;
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  const _StyleCard({
    required this.option,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_StyleCard> createState() => _StyleCardState();
}

class _StyleCardState extends State<_StyleCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? const Color(0xFFf5f3ff)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.isSelected
                  ? const Color(0xFFa78bfa)
                  : Colors.transparent,
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.isSelected
                    ? const Color(0xFFa78bfa).withOpacity(0.3)
                    : _isHovered
                        ? Colors.black.withOpacity(0.1)
                        : Colors.black.withOpacity(0.05),
                blurRadius: widget.isSelected || _isHovered ? 12 : 4,
                offset: Offset(0, widget.isSelected || _isHovered ? 4 : 2),
              ),
            ],
          ),
          transform: Matrix4.translationValues(
            0,
            _isHovered && !widget.isSelected ? -2 : 0,
            0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              Expanded(
                child: CustomPaint(
                  size: const Size(100, 100),
                  painter: StyleIconPainter(
                    styleName: widget.option.name,
                    category: widget.category,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              
              // Name
              Text(
                widget.option.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1f2937),
                ),
              ),
              const SizedBox(height: 4),
              
              // Description
              Text(
                widget.option.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xFF6b7280),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
