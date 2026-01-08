import 'package:flutter/material.dart';
import 'dart:math';

/// Generates step-by-step pattern drafting instructions based on measurements and style selections
class PatternDraftingInstructions {
  final Map<String, double> measurements;
  final Map<String, String> styles;

  PatternDraftingInstructions({
    required this.measurements,
    required this.styles,
  });

  /// Get back bodice (badan belakang) instructions
  List<PatternStep> getBackBodiceSteps() {
    final bust = measurements['bust'] ?? 88;
    final waist = measurements['waist'] ?? 68;
    final shoulderLength = measurements['shoulderLength'] ?? 12;
    final backLength = measurements['backLength'] ?? 40;
    final frontLength = measurements['frontLength'] ?? 43;
    final armhole = measurements['armhole'] ?? 20;

    return [
      PatternStep(
        stepNumber: 1,
        title: 'Langkah 1 - Garis Asas',
        instructions: [
          'AB – Labuh bahu ke pinggang = ${backLength.toStringAsFixed(1)} cm. Tandakan garisan ini.',
          'AC – ½ lebar bahu + 1 cm = ${(shoulderLength / 2 + 1).toStringAsFixed(1)} cm. Tandakan garisan dari A ke C.',
          'CD – 5 cm. Tandakan garisan ke bawah dari C ke D.',
        ],
        diagramType: DiagramType.backStep1,
      ),
      PatternStep(
        stepNumber: 2,
        title: 'Langkah 2 - Garis Leher',
        instructions: [
          'DE – Garisan bahu. DE bertemu AC di titik E.',
          'BF – Labuh tengah belakang. Tandakan titik F pada AB.',
          'EF – Lengkungkan garisan dari E ke F untuk membentuk garis leher belakang.',
        ],
        diagramType: DiagramType.backStep2,
      ),
      PatternStep(
        stepNumber: 3,
        title: 'Langkah 3 - Lubang Lengan',
        instructions: [
          'FG – ½ BF + 3 cm = ${(backLength / 2 + 3).toStringAsFixed(1)} cm.',
          'GH – ¼ ukuran pinggang + 1.25 cm = ${(waist / 4 + 1.25).toStringAsFixed(1)} cm untuk basi.',
          'Tegakkan garisan melintang dari G.',
          'FI – ½ FG = ${(backLength / 4 + 1.5).toStringAsFixed(1)} cm.',
          'J – ½ CK. Tanda garisan IJ.',
          'GK – Sama dengan IJ.',
          'KL – Lukis garisan pepenjuru dari K ke L berukuran 3 cm.',
          'DH – Sambungkan D ke J, J ke L, dan L ke H untuk membentuk lubang lengan.',
        ],
        diagramType: DiagramType.backStep3,
      ),
      PatternStep(
        stepNumber: 4,
        title: 'Langkah 4 - Dart & Pinggang',
        instructions: [
          'BM – ¼ ukuran pinggang + 4.5 cm = ${(waist / 4 + 4.5).toStringAsFixed(1)} cm.',
          '(4 cm untuk dart dan 0.5 cm untuk basi).',
          'GN – ½ GK.',
          'BO – GN − 2 cm.',
          'OP – 4 cm. Sambungkan N ke O dan N ke P untuk membentuk dart.',
          'HQ – Panjang jahitan sisi.',
          'Lukis garisan dari H melalui M ke Q.',
          'QP – Lengkungkan Q ke P secara lembut untuk melengkapkan garis pinggang.',
          'Pola badan belakang kini sedia.',
        ],
        diagramType: DiagramType.backStep4,
      ),
    ];
  }

  /// Get front bodice (badan hadapan) instructions
  List<PatternStep> getFrontBodiceSteps() {
    final bust = measurements['bust'] ?? 88;
    final waist = measurements['waist'] ?? 68;
    final shoulderLength = measurements['shoulderLength'] ?? 12;
    final backLength = measurements['backLength'] ?? 40;
    final frontLength = measurements['frontLength'] ?? 43;
    final armhole = measurements['armhole'] ?? 20;
    final bustDistance = measurements['bustDistance'] ?? 18;

    return [
      PatternStep(
        stepNumber: 1,
        title: 'Langkah 1 - Garis Asas',
        instructions: [
          'AB – Labuh bahu ke pinggang = ${frontLength.toStringAsFixed(1)} cm. Tandakan garisan ini.',
          'AC – ½ lebar bahu + 1 cm = ${(shoulderLength / 2 + 1).toStringAsFixed(1)} cm.',
          'Tandakan garisan dari A ke C.',
          'CD – 4 cm. Tandakan garisan ke bawah dari C ke D.',
        ],
        diagramType: DiagramType.frontStep1,
      ),
      PatternStep(
        stepNumber: 2,
        title: 'Langkah 2 - Garis Leher',
        instructions: [
          'DE – Garisan bahu. DE bertemu AC di titik E.',
          'BF – Labuh tengah hadapan. Tandakan titik F pada AB.',
          'AG – Sama dengan AE + 1 cm.',
          'Lukis satu garisan pepenjuru.',
          'EF – Tegakkan garisan melintang dari F.',
          'Sambungkan E ke F melalui G untuk membentuk garis leher depan yang melengkung.',
        ],
        diagramType: DiagramType.frontStep2,
      ),
      PatternStep(
        stepNumber: 3,
        title: 'Langkah 3 - Lubang Lengan',
        instructions: [
          'BH – Sama dengan ½ AB = ${(frontLength / 2).toStringAsFixed(1)} cm.',
          'HI – ¼ ukuran pinggang + 1.25 cm = ${(waist / 4 + 1.25).toStringAsFixed(1)} cm untuk basi.',
          'Tandakan garisan melintang dari H.',
          'FJ – ½ FH.',
          'JK – ½ ukuran lebar dada hadapan = ${(bustDistance / 2).toStringAsFixed(1)} cm.',
          'Tegakkan garisan di J.',
          'HL – Sama dengan JK.',
          'LM – Lukis garisan pepenjuru dari L ke M berukuran 2.5 cm.',
          'DI – Sambungkan D ke K, K ke M dan M ke I untuk membentuk lubang lengan.',
        ],
        diagramType: DiagramType.frontStep3,
      ),
      PatternStep(
        stepNumber: 4,
        title: 'Langkah 4 - Dart & Pinggang',
        instructions: [
          'HN – 5 cm. Tandakan N pada AB.',
          'NO – HI + 1 cm = ${(waist / 4 + 2.25).toStringAsFixed(1)} cm.',
          'IP – Panjang jahitan sisi. Lukis garisan dari I melalui O ke P.',
          'NQ – ½ JK + 1.25 cm.',
          'BR – NQ − 2 cm. Tegakkan garisan di B.',
          'BS – BR + 4.5 cm.',
          'PS – Sambungkan S ke P untuk melengkapkan garis pinggang.',
          'ST – 4.5 cm. Sambungkan Q ke R dan Q ke T untuk membentuk dart.',
          'Kedalaman dart boleh diubah suai bagi membetulkan ukuran pinggang jika perlu.',
        ],
        diagramType: DiagramType.frontStep4,
      ),
    ];
  }

  /// Get style-specific modifications based on selected styles
  List<PatternStep> getStyleModifications() {
    List<PatternStep> modifications = [];
    
    // Neckline modifications
    final neckline = styles['neckline'] ?? 'Round';
    modifications.add(_getNecklineModification(neckline));
    
    // Collar modifications
    final collar = styles['collar'] ?? 'No Collar';
    if (collar != 'No Collar') {
      modifications.add(_getCollarModification(collar));
    }
    
    // Bodice modifications
    final bodice = styles['bodice'] ?? 'Basic Fitted';
    if (bodice != 'Basic Fitted') {
      modifications.add(_getBodiceModification(bodice));
    }
    
    // Sleeve modifications
    final sleeve = styles['sleeve'] ?? 'Sleeveless';
    if (sleeve != 'Sleeveless') {
      modifications.add(_getSleeveModification(sleeve));
    }
    
    // Skirt modifications
    final skirt = styles['skirt'] ?? 'Straight';
    modifications.add(_getSkirtModification(skirt));
    
    return modifications;
  }

  PatternStep _getNecklineModification(String neckline) {
    Map<String, List<String>> necklineInstructions = {
      'Round': [
        'Garis leher bulat standard.',
        'Tiada pengubahsuaian diperlukan pada pola asas.',
      ],
      'V-Neck': [
        'Tandakan kedalaman V pada tengah hadapan.',
        'Kedalaman standard: 15-20 cm dari titik bahu.',
        'Lukis garisan lurus dari titik bahu ke kedalaman V.',
        'Pastikan kedua-dua sisi simetri.',
      ],
      'Square': [
        'Tandakan lebar garis leher segi empat.',
        'Kedalaman standard: 8-10 cm dari titik bahu.',
        'Lukis garisan mendatar untuk bahagian atas.',
        'Lukis garisan menegak di kedua-dua sisi.',
      ],
      'Sweetheart': [
        'Lukis bentuk hati di tengah hadapan.',
        'Tandakan dua lengkungan simetri.',
        'Kedalaman standard: 12-15 cm.',
        'Halus semua lengkungan dengan French curve.',
      ],
      'Boat': [
        'Lebarkan garis leher ke arah bahu.',
        'Kedalaman minimum di tengah (2-3 cm).',
        'Lukis garisan hampir mendatar dari bahu ke bahu.',
      ],
      'Scoop': [
        'Lukis lengkungan U dalam.',
        'Kedalaman standard: 12-18 cm.',
        'Pastikan lengkungan lancar dan simetri.',
      ],
    };

    return PatternStep(
      stepNumber: 1,
      title: 'Pengubahsuaian Garis Leher: $neckline',
      instructions: necklineInstructions[neckline] ?? ['Tiada pengubahsuaian.'],
      diagramType: DiagramType.necklineModification,
    );
  }

  PatternStep _getCollarModification(String collar) {
    Map<String, List<String>> collarInstructions = {
      'Shirt Collar': [
        'Ukur panjang garis leher dari pola.',
        'Lebar kolar standard: 6-8 cm.',
        'Lukis stand kolar (2.5-3 cm tinggi).',
        'Lukis fall kolar di atas stand.',
        'Tambah 1.5 cm untuk pertindihan di tengah hadapan.',
      ],
      'Peter Pan': [
        'Ukur panjang garis leher dari pola.',
        'Lebar kolar: 5-7 cm.',
        'Lukis bentuk bulat lembut.',
        'Kolar rata tanpa stand.',
        'Potong 2 helai (kanan dan kiri).',
      ],
      'Mandarin': [
        'Ukur panjang garis leher dari pola.',
        'Tinggi kolar: 3-4 cm.',
        'Lukis segi empat tepat.',
        'Tambah keluk sedikit untuk keselesaan.',
        'Kolar berdiri tegak.',
      ],
      'Shawl': [
        'Sambungkan garis leher belakang ke hadapan.',
        'Lebar shawl: 8-12 cm.',
        'Lukis lapel yang melengkung.',
        'Roll line pada 2-3 cm dari tepi.',
      ],
    };

    return PatternStep(
      stepNumber: 2,
      title: 'Pola Kolar: $collar',
      instructions: collarInstructions[collar] ?? ['Tiada pengubahsuaian.'],
      diagramType: DiagramType.collarModification,
    );
  }

  PatternStep _getBodiceModification(String bodice) {
    final bust = measurements['bust'] ?? 88;
    final waist = measurements['waist'] ?? 68;
    final bustDistance = measurements['bustDistance'] ?? 18;
    
    Map<String, List<String>> bodiceInstructions = {
      'Dart Front': [
        'Tandakan titik bust: ${(bustDistance / 2).toStringAsFixed(1)} cm dari tengah hadapan.',
        'Lukis dart dari titik bust ke garis pinggang.',
        'Lebar dart di pinggang: 3-4 cm.',
        'Dart tidak sampai ke titik bust (berhenti 2 cm sebelum).',
      ],
      'Princess Line': [
        'Lukis garisan princess dari pertengahan bahu.',
        'Garisan melalui titik bust ke hem.',
        'Potong pola mengikut garisan princess.',
        'Tambah kelim jahitan 1.5 cm di setiap sisi.',
        'Hasilkan 2 panel: panel tengah dan panel sisi.',
      ],
      'Wrap Style': [
        'Tambah lebar pertindihan: 8-10 cm.',
        'Lukis garisan wrap dari bahu ke pinggang.',
        'Tandakan kedudukan butang/tali.',
        'Pastikan pertindihan cukup untuk menutup.',
      ],
      'Peplum': [
        'Pendekkan badan di garis pinggang.',
        'Ukur panjang peplum: 15-20 cm.',
        'Lebar peplum di hem: 1.5x lebar pinggang.',
        'Lukis pola peplum separuh bulatan atau flared.',
      ],
    };

    return PatternStep(
      stepNumber: 3,
      title: 'Pengubahsuaian Badan: $bodice',
      instructions: bodiceInstructions[bodice] ?? ['Tiada pengubahsuaian.'],
      diagramType: DiagramType.bodiceModification,
    );
  }

  PatternStep _getSleeveModification(String sleeve) {
    final armhole = measurements['armhole'] ?? 40;
    final sleeveLength = measurements['sleeveLength'] ?? 58;
    
    Map<String, List<String>> sleeveInstructions = {
      'Short': [
        'Ukur lilitan lubang lengan dari pola badan: ${armhole.toStringAsFixed(1)} cm.',
        'Panjang lengan pendek: 15-20 cm.',
        'Lebar lengan di hem: lilitan lengan atas + 5 cm ease.',
        'Lukis kepala lengan dengan tinggi 12-14 cm.',
      ],
      'Long': [
        'Ukur lilitan lubang lengan dari pola badan: ${armhole.toStringAsFixed(1)} cm.',
        'Panjang lengan: ${sleeveLength.toStringAsFixed(1)} cm.',
        'Lebar lengan di pergelangan: 22-25 cm.',
        'Lukis kepala lengan dengan tinggi 14-16 cm.',
        'Tambah dart siku jika perlu.',
      ],
      'Puff': [
        'Ukur lilitan lubang lengan dari pola badan.',
        'Tambah volume di kepala lengan: 1.5-2x lebar asal.',
        'Panjang lengan puff: 20-30 cm.',
        'Kumpul (gather) di kepala dan hem lengan.',
        'Nisbah gathering: 2:1.',
      ],
      'Bell': [
        'Ukur lilitan lubang lengan dari pola badan.',
        'Panjang lengan: ${sleeveLength.toStringAsFixed(1)} cm.',
        'Slash dan spread di bahagian bawah.',
        'Lebar hem: 2-3x lebar pergelangan asal.',
        'Lukis lengkungan bell yang lancar.',
      ],
      'Cap': [
        'Ukur lilitan lubang lengan dari pola badan.',
        'Panjang lengan cap: 8-12 cm.',
        'Lengan cap menutup bahu sahaja.',
        'Boleh ditambah sedikit gathering.',
      ],
    };

    return PatternStep(
      stepNumber: 4,
      title: 'Pola Lengan: $sleeve',
      instructions: sleeveInstructions[sleeve] ?? ['Tiada pengubahsuaian.'],
      diagramType: DiagramType.sleeveModification,
    );
  }

  PatternStep _getSkirtModification(String skirt) {
    final waist = measurements['waist'] ?? 68;
    final hip = measurements['hip'] ?? 94;
    final skirtLength = measurements['skirtLength'] ?? 60;
    
    Map<String, List<String>> skirtInstructions = {
      'Straight': [
        'Ukuran pinggang: ${waist.toStringAsFixed(1)} cm.',
        'Ukuran pinggul: ${hip.toStringAsFixed(1)} cm.',
        'Panjang skirt: ${skirtLength.toStringAsFixed(1)} cm.',
        'Lebar hem sama dengan lebar pinggul.',
        'Tambah dart di hadapan dan belakang.',
        'Tambah zip di tengah belakang atau sisi.',
      ],
      'A-Line': [
        'Ukuran pinggang: ${waist.toStringAsFixed(1)} cm.',
        'Panjang skirt: ${skirtLength.toStringAsFixed(1)} cm.',
        'Slash dan spread dari pinggul ke hem.',
        'Tambah 5-8 cm di setiap sisi di hem.',
        'Hapuskan atau kurangkan dart.',
      ],
      'Flared': [
        'Ukuran pinggang: ${waist.toStringAsFixed(1)} cm.',
        'Panjang skirt: ${skirtLength.toStringAsFixed(1)} cm.',
        'Gunakan kaedah separuh bulatan atau ¾ bulatan.',
        'Jejari dalam = pinggang ÷ 3.14 = ${(waist / 3.14).toStringAsFixed(1)} cm.',
        'Jejari luar = jejari dalam + panjang skirt.',
        'Potong mengikut lengkungan.',
      ],
      'Pleated': [
        'Ukuran pinggang: ${waist.toStringAsFixed(1)} cm.',
        'Panjang skirt: ${skirtLength.toStringAsFixed(1)} cm.',
        'Kira bilangan pleat: pinggang ÷ lebar pleat.',
        'Lebar pleat standard: 3-5 cm.',
        'Kedalaman pleat: 2x lebar pleat.',
        'Jumlah fabrik = 3x ukuran pinggang.',
      ],
      'Gathered': [
        'Ukuran pinggang: ${waist.toStringAsFixed(1)} cm.',
        'Panjang skirt: ${skirtLength.toStringAsFixed(1)} cm.',
        'Nisbah gathering: 2:1 atau 2.5:1.',
        'Lebar fabrik = ${(waist * 2).toStringAsFixed(1)} cm hingga ${(waist * 2.5).toStringAsFixed(1)} cm.',
        'Kumpul sama rata di pinggang.',
        'Sambung ke band pinggang.',
      ],
      'Pencil': [
        'Ukuran pinggang: ${waist.toStringAsFixed(1)} cm.',
        'Ukuran pinggul: ${hip.toStringAsFixed(1)} cm.',
        'Panjang skirt: ${skirtLength.toStringAsFixed(1)} cm.',
        'Lebar hem: kurang 2-4 cm dari pinggul.',
        'Tambah slit di belakang: 15-20 cm.',
        'Dart di hadapan dan belakang wajib.',
        'Ease minimum untuk keselesaan berjalan.',
      ],
    };

    return PatternStep(
      stepNumber: 5,
      title: 'Pola Skirt: $skirt',
      instructions: skirtInstructions[skirt] ?? ['Tiada pengubahsuaian.'],
      diagramType: DiagramType.skirtModification,
    );
  }
}

/// Represents a single step in pattern drafting
class PatternStep {
  final int stepNumber;
  final String title;
  final List<String> instructions;
  final DiagramType diagramType;

  PatternStep({
    required this.stepNumber,
    required this.title,
    required this.instructions,
    required this.diagramType,
  });
}

/// Types of diagrams that can be drawn
enum DiagramType {
  backStep1,
  backStep2,
  backStep3,
  backStep4,
  frontStep1,
  frontStep2,
  frontStep3,
  frontStep4,
  necklineModification,
  collarModification,
  bodiceModification,
  sleeveModification,
  skirtModification,
}