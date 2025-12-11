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

  StyleOption({required this.name, required this.description});
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
  static final List<StyleOption> necklines = [
    StyleOption(name: 'Round', description: 'Leher bulat standard'),
    StyleOption(name: 'V-Neck', description: 'Leher berbentuk V'),
    StyleOption(name: 'Square', description: 'Leher segi empat'),
    StyleOption(name: 'Sweetheart', description: 'Leher bentuk hati'),
    StyleOption(name: 'Boat', description: 'Leher melebar horizontal'),
    StyleOption(name: 'Scoop', description: 'Leher U dalam'),
  ];

  static final List<StyleOption> collars = [
    StyleOption(name: 'No Collar', description: 'Tiada kolar'),
    StyleOption(name: 'Shirt Collar', description: 'Kolar kemeja standard'),
    StyleOption(name: 'Peter Pan', description: 'Kolar bulat lembut'),
    StyleOption(name: 'Mandarin', description: 'Kolar tegak Cina'),
    StyleOption(name: 'Shawl', description: 'Kolar selendang'),
  ];

  static final List<StyleOption> bodices = [
    StyleOption(name: 'Basic Fitted', description: 'Badan fitted standard'),
    StyleOption(name: 'Dart Front', description: 'Dengan dart depan'),
    StyleOption(name: 'Princess Line', description: 'Panel princess seam'),
    StyleOption(name: 'Wrap Style', description: 'Style bersilang'),
    StyleOption(name: 'Peplum', description: 'Dengan peplum di pinggang'),
  ];

  static final List<StyleOption> sleeves = [
    StyleOption(name: 'Sleeveless', description: 'Tanpa lengan'),
    StyleOption(name: 'Short', description: 'Lengan pendek'),
    StyleOption(name: 'Long', description: 'Lengan panjang'),
    StyleOption(name: 'Puff', description: 'Lengan puff'),
    StyleOption(name: 'Bell', description: 'Lengan bell melebar'),
    StyleOption(name: 'Cap', description: 'Lengan cap kecil'),
  ];

  static final List<StyleOption> skirts = [
    StyleOption(name: 'Straight', description: 'Skirt lurus'),
    StyleOption(name: 'A-Line', description: 'Skirt A melebar'),
    StyleOption(name: 'Flared', description: 'Skirt berkembang'),
    StyleOption(name: 'Pleated', description: 'Skirt berlipit'),
    StyleOption(name: 'Gathered', description: 'Skirt berkumpul'),
    StyleOption(name: 'Pencil', description: 'Skirt pensil ketat'),
  ];
}
