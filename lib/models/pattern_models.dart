class SizeChart {
  static const Map<String, Map<String, double>> data = {
    'S': {
      'shoulder': 37,
      'bust': 86,
      'waist': 66,
      'hip': 92,
      'armhole': 41,
      'sleeveLength': 56,
      'frontCenter': 41,
      'backCenter': 41,
      'skirtLength': 58,
    },
    'M': {
      'shoulder': 39,
      'bust': 92,
      'waist': 72,
      'hip': 98,
      'armhole': 43,
      'sleeveLength': 58,
      'frontCenter': 43,
      'backCenter': 43,
      'skirtLength': 62,
    },
    'L': {
      'shoulder': 41,
      'bust': 98,
      'waist': 78,
      'hip': 104,
      'armhole': 45,
      'sleeveLength': 60,
      'frontCenter': 45,
      'backCenter': 45,
      'skirtLength': 66,
    },
  };

  static const List<String> rowLabels = [
    'Bahu',
    'Dada',
    'Pinggang',
    'Pinggul',
    'Lubang Lengan',
    'Labuh Lengan',
    'Garis Tengah Hadapan',
    'Garis Tengah Belakang',
    'Labuh Skirt',
  ];

  static const List<String> rowKeys = [
    'shoulder',
    'bust',
    'waist',
    'hip',
    'armhole',
    'sleeveLength',
    'frontCenter',
    'backCenter',
    'skirtLength',
  ];
}

class Measurements {
  String name;
  String selectedSize;
  double bust;
  double waist;
  double hip;
  double shoulder;
  double backCenter;
  double frontCenter;
  double sleeveLength;
  double armhole;
  double skirtLength;

  Measurements({
    this.name = '',
    this.selectedSize = '',
    this.bust = 0,
    this.waist = 0,
    this.hip = 0,
    this.shoulder = 0,
    this.backCenter = 0,
    this.frontCenter = 0,
    this.sleeveLength = 0,
    this.armhole = 0,
    this.skirtLength = 0,
  });

  void applySize(String size) {
    final d = SizeChart.data[size];
    if (d == null) return;
    selectedSize = size;
    shoulder = d['shoulder']!;
    bust = d['bust']!;
    waist = d['waist']!;
    hip = d['hip']!;
    armhole = d['armhole']!;
    sleeveLength = d['sleeveLength']!;
    frontCenter = d['frontCenter']!;
    backCenter = d['backCenter']!;
    skirtLength = d['skirtLength']!;
  }

  bool isValid() {
    return selectedSize.isNotEmpty;
  }
}

class StyleOption {
  final String name;
  final String description;
  final String? imagePath; // Optional image path for styles with images

  StyleOption({
    required this.name,
    required this.description,
    this.imagePath,
  });
}

class StyleSelections {
  String? neckline;
  String? collar;
  String? bodice;
  String? sleeve;
  String? skirt;

  bool isComplete() {
    return neckline != null &&
        collar != null &&
        bodice != null &&
        sleeve != null &&
        skirt != null;
  }

  Map<String, String> toMap() {
    return {
      'neckline': neckline ?? '',
      'collar': collar ?? '',
      'bodice': bodice ?? '',
      'sleeve': sleeve ?? '',
      'skirt': skirt ?? '',
    };
  }
}

class StyleOptions {
  // Necklines - 6 styles with images
  static final List<StyleOption> necklines = [
    StyleOption(
      name: 'Basic Neckline',
      description: 'Leher asas standard',
      imagePath: 'assets/images/necklines/basic_neckline.jpg',
    ),
    StyleOption(
      name: 'Boat Neckline',
      description: 'Leher melebar horizontal',
      imagePath: 'assets/images/necklines/boat_neckline.jpg',
    ),
    StyleOption(
      name: 'Cowl Neckline',
      description: 'Leher drape jatuh',
      imagePath: 'assets/images/necklines/cowl_neckline.jpg',
    ),
    StyleOption(
      name: 'Crossover Neckline',
      description: 'Leher bersilang',
      imagePath: 'assets/images/necklines/crossover_neckline.jpg',
    ),
    StyleOption(
      name: 'Deep Scoop Neckline',
      description: 'Leher U dalam',
      imagePath: 'assets/images/necklines/deep_scoop_neckline.jpg',
    ),
    StyleOption(
      name: 'V Neckline',
      description: 'Leher berbentuk V',
      imagePath: 'assets/images/necklines/v_neckline.jpg',
    ),
  ];

  // Collars - 6 styles with images
  static final List<StyleOption> collars = [
    StyleOption(
      name: 'No Collar',
      description: 'Tiada kolar',
      imagePath: 'assets/images/collars/no_collar.jpg',
    ),
    StyleOption(
      name: 'Mandarin Collar',
      description: 'Kolar tegak Cina',
      imagePath: 'assets/images/collars/mandarin_collar.jpg',
    ),
    StyleOption(
      name: 'One Piece Shirt Collar',
      description: 'Kolar kemeja satu keping',
      imagePath: 'assets/images/collars/one_piece_shirt_collar.jpg',
    ),
    StyleOption(
      name: 'Peter Pan Collar',
      description: 'Kolar bulat lembut',
      imagePath: 'assets/images/collars/peter_pan_collar.jpg',
    ),
    StyleOption(
      name: 'Sailor Collar',
      description: 'Kolar pelaut',
      imagePath: 'assets/images/collars/sailor_collar.jpg',
    ),
    StyleOption(
      name: 'Shawl Collar',
      description: 'Kolar selendang',
      imagePath: 'assets/images/collars/shawl_collar.jpg',
    ),
  ];

  // Bodices - 6 styles with images
  static final List<StyleOption> bodices = [
    StyleOption(
      name: 'Bust Semi Yoke',
      description: 'Yoke separuh di bahagian dada',
      imagePath: 'assets/images/bodices/bust_semi_yoke_bodice.jpg',
    ),
    StyleOption(
      name: 'Dart Cluster',
      description: 'Kumpulan dart di dada',
      imagePath: 'assets/images/bodices/dart_cluster_bodice.jpg',
    ),
    StyleOption(
      name: 'Double Shoulder Tucks',
      description: 'Lipatan berganda di bahu',
      imagePath: 'assets/images/bodices/double_shoulders_tucks_bodice.jpg',
    ),
    StyleOption(
      name: 'Flange Inset',
      description: 'Sisipan flange di bahu',
      imagePath: 'assets/images/bodices/flange_inset_bodice.jpg',
    ),
    StyleOption(
      name: 'Pin Tucks',
      description: 'Lipatan kecil hiasan',
      imagePath: 'assets/images/bodices/pin_tucks_bodice.jpg',
    ),
    StyleOption(
      name: 'Princess Line',
      description: 'Panel princess seam',
      imagePath: 'assets/images/bodices/princess_line_bodice.jpg',
    ),
  ];

  // Sleeves - 6 styles
  // Sleeves - 6 styles with images
  static final List<StyleOption> sleeves = [
    StyleOption(
      name: 'Sleeveless',
      description: 'Tanpa lengan',
      imagePath: 'assets/images/sleeves/sleeveless_sleeve.jpg',
    ),
    StyleOption(
      name: 'Cap Sleeve',
      description: 'Lengan cap kecil',
      imagePath: 'assets/images/sleeves/cap_sleeve.jpg',
    ),
    StyleOption(
      name: 'Circular Hemline Sleeve',
      description: 'Lengan hemline bulat',
      imagePath: 'assets/images/sleeves/circular_hemline_sleeve.jpg',
    ),
    StyleOption(
      name: 'Lantern Sleeve',
      description: 'Lengan tanglung',
      imagePath: 'assets/images/sleeves/lantern_sleeve.jpg',
    ),
    StyleOption(
      name: 'Puff Sleeve',
      description: 'Lengan puff',
      imagePath: 'assets/images/sleeves/puff_sleeve.jpg',
    ),
    StyleOption(
      name: 'Petal Sleeve',
      description: 'Lengan petal',
      imagePath: 'assets/images/sleeves/petal_sleeve.jpg',
    ),
  ];

  // Skirts - 6 styles with images
  static final List<StyleOption> skirts = [
    StyleOption(
      name: '12 Gore Graduated Flare',
      description: 'Skirt 12 gore kembang bergraduat',
      imagePath: 'assets/images/skirts/12_gore_graduated_flare_skirt.jpg',
    ),
    StyleOption(
      name: 'Full Circle',
      description: 'Skirt bulatan penuh',
      imagePath: 'assets/images/skirts/full_circle_skirt.jpg',
    ),
    StyleOption(
      name: 'Godets',
      description: 'Skirt godets',
      imagePath: 'assets/images/skirts/godets_skirt.jpg',
    ),
    StyleOption(
      name: 'Mermaid',
      description: 'Skirt mermaid',
      imagePath: 'assets/images/skirts/mermaid_skirt.jpg',
    ),
    StyleOption(
      name: 'Skirts With Yoke',
      description: 'Skirt dengan yoke',
      imagePath: 'assets/images/skirts/skirts_with_yoke.jpg',
    ),
    StyleOption(
      name: 'Tiers',
      description: 'Skirt bertingkat',
      imagePath: 'assets/images/skirts/tiers_skirt.jpg',
    ),
  ];
}