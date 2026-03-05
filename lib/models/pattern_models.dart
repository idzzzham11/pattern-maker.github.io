class Measurements {
  String name;
  String unit;
  double bust;
  double waist;
  double hip;
  double shoulder;
  double backLength;
  double sleeveLength;
  double armhole;

  Measurements({
    this.name = '',
    this.unit = 'cm',
    this.bust = 0,
    this.waist = 0,
    this.hip = 0,
    this.shoulder = 0,
    this.backLength = 0,
    this.sleeveLength = 0,
    this.armhole = 0,
  });

  bool isValid() {
    return name.isNotEmpty && bust > 0 && waist > 0 && hip > 0;
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
  static final List<StyleOption> sleeves = [
    StyleOption(name: 'Sleeveless', description: 'Tanpa lengan'),
    StyleOption(name: 'Short', description: 'Lengan pendek'),
    StyleOption(name: 'Long', description: 'Lengan panjang'),
    StyleOption(name: 'Puff', description: 'Lengan puff'),
    StyleOption(name: 'Bell', description: 'Lengan bell melebar'),
    StyleOption(name: 'Cap', description: 'Lengan cap kecil'),
  ];

  // Skirts - 6 styles
  static final List<StyleOption> skirts = [
    StyleOption(name: 'Straight', description: 'Skirt lurus'),
    StyleOption(name: 'A-Line', description: 'Skirt A melebar'),
    StyleOption(name: 'Flared', description: 'Skirt berkembang'),
    StyleOption(name: 'Pleated', description: 'Skirt berlipit'),
    StyleOption(name: 'Gathered', description: 'Skirt berkumpul'),
    StyleOption(name: 'Pencil', description: 'Skirt pensil ketat'),
  ];
}