import 'package:flutter/material.dart';

/// Generates step-by-step pattern drafting instructions based on measurements and style selections
class PatternDraftingInstructions {
  final Map<String, double> measurements;
  final Map<String, String> styles;

  PatternDraftingInstructions({
    required this.measurements,
    required this.styles,
  });

  // Helper getters
  double get bust => measurements['bust'] ?? 88;
  double get waist => measurements['waist'] ?? 68;
  double get hip => measurements['hip'] ?? 94;
  double get shoulder => measurements['shoulderLength'] ?? 12;
  double get backLength => measurements['backLength'] ?? 40;
  double get frontLength => measurements['frontLength'] ?? 43;
  double get armhole => measurements['armhole'] ?? 40;
  double get sleeveLength => measurements['sleeveLength'] ?? 58;
  double get bustDistance => measurements['bustDistance'] ?? 18;
  double get skirtLength => measurements['skirtLength'] ?? 60;

  /// Get back bodice instructions
  List<PatternStep> getBackBodiceSteps() {
    return [
      PatternStep(
        stepNumber: 1,
        title: 'Langkah 1 - Garis Asas',
        instructions: [
          'AB – Labuh bahu ke pinggang = ${backLength.toStringAsFixed(1)} cm. Tandakan garisan ini.',
          'AC – ½ lebar bahu + 1 cm = ${(shoulder / 2 + 1).toStringAsFixed(1)} cm. Tandakan garisan dari A ke C.',
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

  /// Get front bodice instructions
  List<PatternStep> getFrontBodiceSteps() {
    return [
      PatternStep(
        stepNumber: 1,
        title: 'Langkah 1 - Garis Asas',
        instructions: [
          'AB – Labuh bahu ke pinggang = ${frontLength.toStringAsFixed(1)} cm. Tandakan garisan ini.',
          'AC – ½ lebar bahu + 1 cm = ${(shoulder / 2 + 1).toStringAsFixed(1)} cm.',
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

  /// Get neckline modification steps
  PatternStep getNecklineSteps(String neckline) {
    Map<String, List<String>> necklineInstructions = {
      'Round': [
        'Garis leher bulat standard - tiada pengubahsuaian diperlukan.',
        'Kedalaman garis leher hadapan: 7-8 cm dari titik bahu.',
        'Kedalaman garis leher belakang: 2-3 cm dari titik bahu.',
        'Lukis lengkungan lancar menggunakan French curve.',
      ],
      'V-Neck': [
        'Tandakan kedalaman V pada tengah hadapan: 15-20 cm dari titik bahu.',
        'Tandakan lebar V pada garisan bahu: 5-7 cm dari titik leher.',
        'Lukis garisan lurus dari titik bahu ke kedalaman V.',
        'Pastikan kedua-dua sisi simetri.',
        'Garis leher belakang kekal bulat standard.',
      ],
      'Square': [
        'Tandakan lebar garis leher segi empat: 15-18 cm.',
        'Kedalaman depan: 8-10 cm dari titik bahu.',
        'Lukis garisan mendatar untuk bahagian atas.',
        'Lukis garisan menegak di kedua-dua sisi.',
        'Bulatkan sudut sedikit (0.5-1 cm) untuk keselesaan.',
      ],
      'Sweetheart': [
        'Tandakan lebar atas: sama dengan V-neck (5-7 cm dari titik leher).',
        'Kedalaman: 12-15 cm dari titik bahu.',
        'Lukis dua lengkungan simetri membentuk hati.',
        'Titik tengah hadapan sedikit naik (2-3 cm) membentuk puncak hati.',
        'Halus semua lengkungan dengan French curve.',
      ],
      'Boat': [
        'Lebarkan garis leher ke arah bahu: 3-5 cm ke luar.',
        'Kedalaman minimum di tengah hadapan: 2-3 cm.',
        'Kedalaman di tengah belakang: 2 cm.',
        'Lukis garisan hampir mendatar dari bahu ke bahu.',
        'Sedikit lengkung di tengah untuk keselesaan.',
      ],
      'Scoop': [
        'Lukis lengkungan U dalam.',
        'Kedalaman depan: 12-18 cm dari titik bahu.',
        'Lebar: 12-15 cm (separuh dari keseluruhan).',
        'Pastikan lengkungan lancar dan simetri.',
        'Garis leher belakang lebih cetek: 5-7 cm.',
      ],
    };

    return PatternStep(
      stepNumber: 1,
      title: 'Pengubahsuaian Garis Leher $neckline',
      instructions: necklineInstructions[neckline] ?? ['Tiada pengubahsuaian diperlukan.'],
      diagramType: DiagramType.necklineModification,
    );
  }

  /// Get bodice style modification steps
  PatternStep getBodiceStyleSteps(String bodice) {
    Map<String, List<String>> bodiceInstructions = {
      'Dart Front': [
        'Tandakan titik bust (BP): ${(bustDistance / 2).toStringAsFixed(1)} cm dari tengah hadapan.',
        'Ukur dari garis pinggang ke atas untuk ketinggian bust: ${(frontLength * 0.4).toStringAsFixed(1)} cm.',
        'Lukis dart dari titik bust ke garis pinggang.',
        'Lebar dart di pinggang: 3-4 cm (setiap sisi 1.5-2 cm).',
        'Dart tidak sampai ke titik bust - berhenti 2-3 cm sebelum BP.',
        'Jumlah dart: 2 dart (kiri dan kanan).',
      ],
      'Princess Line': [
        'Lukis garisan princess dari pertengahan bahu atau dari lubang lengan.',
        'Garisan melalui titik bust ke hem.',
        'Jarak dari tengah hadapan ke garisan princess: ${(bustDistance / 2).toStringAsFixed(1)} cm.',
        'Potong pola mengikut garisan princess.',
        'Tambah kelim jahitan 1.5 cm di setiap sisi potongan.',
        'Hasilkan 2 panel: panel tengah (CF) dan panel sisi.',
        'Labelkan setiap panel dengan jelas.',
      ],
      'Wrap Style': [
        'Tambah lebar pertindihan di tengah hadapan: 8-10 cm.',
        'Lukis garisan wrap dari titik bahu ke pinggang sisi.',
        'Garisan wrap melintasi badan secara diagonal.',
        'Tandakan kedudukan butang atau tali pengikat.',
        'Pastikan pertindihan cukup untuk menutup badan.',
        'Tambah facing untuk kemasan tepi: 5-6 cm.',
      ],
      'Peplum': [
        'Pendekkan badan di garis pinggang - potong pada garisan pinggang.',
        'Ukur panjang peplum: 15-20 cm dari pinggang.',
        'Lukis pola peplum separuh bulatan atau flared.',
        'Lebar peplum di hem: 1.5x hingga 2x lebar pinggang.',
        'Jejari dalam peplum = ukuran pinggang ÷ 3.14 = ${(waist / 3.14).toStringAsFixed(1)} cm.',
        'Jejari luar = jejari dalam + panjang peplum.',
        'Sambung peplum ke badan di garis pinggang.',
      ],
    };

    return PatternStep(
      stepNumber: 1,
      title: 'Pengubahsuaian Badan $bodice',
      instructions: bodiceInstructions[bodice] ?? ['Tiada pengubahsuaian diperlukan.'],
      diagramType: DiagramType.bodiceModification,
    );
  }

  /// Get collar pattern steps
  List<PatternStep> getCollarSteps(String collar) {
    Map<String, List<PatternStep>> collarInstructions = {
      'Shirt Collar': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Ukur Garis Leher',
          instructions: [
            'Ukur panjang garis leher dari pola badan (hadapan + belakang).',
            'Bahagikan ukuran dengan 2 untuk separuh kolar.',
            'Tambah 1.5-2 cm untuk pertindihan di tengah hadapan.',
          ],
          diagramType: DiagramType.collarModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Lukis Stand Kolar',
          instructions: [
            'Lukis segi empat tepat untuk stand kolar.',
            'Panjang: separuh ukuran garis leher + 2 cm.',
            'Tinggi stand: 2.5-3 cm.',
            'Bentukkan sedikit lengkung pada bahagian leher.',
          ],
          diagramType: DiagramType.collarModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Lukis Fall Kolar',
          instructions: [
            'Lukis fall kolar di atas stand.',
            'Lebar fall: 6-8 cm dari fold line.',
            'Bentuk hujung kolar mengikut kesesuaian (pointed, rounded, atau squared).',
            'Tambah kelim jahitan 1 cm di sekeliling.',
          ],
          diagramType: DiagramType.collarModification,
        ),
      ],
      'Peter Pan': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Sediakan Pola Asas',
          instructions: [
            'Ukur panjang garis leher dari pola badan.',
            'Kolar Peter Pan adalah kolar rata (flat collar) tanpa stand.',
            'Sediakan kertas pola baru.',
          ],
          diagramType: DiagramType.collarModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Lukis Bentuk Kolar',
          instructions: [
            'Letakkan pola hadapan dan belakang dengan bahu bertemu.',
            'Trace garis leher dari kedua-dua pola.',
            'Lukis bentuk bulat lembut untuk outer edge.',
            'Lebar kolar: 5-7 cm dari garis leher.',
          ],
          diagramType: DiagramType.collarModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Siapkan Pola',
          instructions: [
            'Potong 2 helai kolar (kanan dan kiri) dari fabrik.',
            'Potong 2 helai dari interlining.',
            'Tambah kelim jahitan 0.7-1 cm.',
            'Tandakan notch untuk padanan dengan bahu.',
          ],
          diagramType: DiagramType.collarModification,
        ),
      ],
      'Mandarin': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Ukur dan Lukis',
          instructions: [
            'Ukur panjang garis leher dari pola badan.',
            'Lukis segi empat tepat.',
            'Panjang: ukuran garis leher + 2 cm (pertindihan).',
            'Tinggi kolar: 3-4 cm.',
          ],
          diagramType: DiagramType.collarModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Bentuk Kolar',
          instructions: [
            'Lengkungkan bahagian bawah (leher) mengikut bentuk garis leher.',
            'Bahagian atas boleh lurus atau sedikit melengkung.',
            'Bulatkan sudut-sudut hujung kolar.',
            'Kolar berdiri tegak apabila dijahit.',
          ],
          diagramType: DiagramType.collarModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Siapkan',
          instructions: [
            'Tambah kelim jahitan 0.7-1 cm.',
            'Gunakan interlining untuk ketegaran.',
            'Tandakan tengah belakang dan tengah hadapan.',
            'Kolar ini sesuai untuk cheongsam atau baju kurung moden.',
          ],
          diagramType: DiagramType.collarModification,
        ),
      ],
      'Shawl': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Sambung Garis Leher',
          instructions: [
            'Sambungkan garis leher belakang ke hadapan pada pola.',
            'Lukis garisan roll line: 2-3 cm dari tepi hadapan.',
            'Roll line menentukan di mana kolar mula melipat.',
          ],
          diagramType: DiagramType.collarModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Lukis Lapel',
          instructions: [
            'Lebar shawl collar: 8-12 cm dari roll line.',
            'Lukis bentuk lapel yang melengkung.',
            'Lapel bermula dari butang pertama.',
            'Bentuk hujung lapel: rounded untuk shawl classic.',
          ],
          diagramType: DiagramType.collarModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Siapkan Facing',
          instructions: [
            'Trace bahagian kolar sebagai facing.',
            'Facing termasuk lapel dan bahagian leher belakang.',
            'Tambah kelim jahitan 1-1.5 cm.',
            'Gunakan interlining pada facing.',
          ],
          diagramType: DiagramType.collarModification,
        ),
      ],
    };

    return collarInstructions[collar] ?? [
      PatternStep(
        stepNumber: 1,
        title: 'Kolar',
        instructions: ['Tiada kolar dipilih.'],
        diagramType: DiagramType.collarModification,
      ),
    ];
  }

  /// Get sleeve pattern steps
  List<PatternStep> getSleeveSteps(String sleeve) {
    Map<String, List<PatternStep>> sleeveInstructions = {
      'Short': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Ukuran Asas',
          instructions: [
            'Ukur lilitan lubang lengan dari pola badan: ${armhole.toStringAsFixed(1)} cm.',
            'Panjang lengan pendek: 15-20 cm dari titik bahu.',
            'Lebar lengan di hem: lilitan lengan atas + 5-6 cm ease.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Lukis Kepala Lengan',
          instructions: [
            'Tinggi kepala lengan: ${(armhole / 3).toStringAsFixed(1)} cm (⅓ lilitan lubang lengan).',
            'Lebar kepala lengan: ${(armhole / 2 + 2).toStringAsFixed(1)} cm.',
            'Lukis lengkungan kepala lengan menggunakan French curve.',
            'Bahagian hadapan lebih cetek, belakang lebih dalam.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Siapkan Pola',
          instructions: [
            'Lukis garisan sisi lengan - sedikit taper ke hem.',
            'Tambah kelim jahitan 1.5 cm di sekeliling.',
            'Tandakan notch untuk padanan dengan badan.',
            'Hem lengan: tambah 2-3 cm untuk lipatan.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
      ],
      'Long': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Ukuran Asas',
          instructions: [
            'Ukur lilitan lubang lengan dari pola badan: ${armhole.toStringAsFixed(1)} cm.',
            'Panjang lengan: ${sleeveLength.toStringAsFixed(1)} cm dari titik bahu ke pergelangan.',
            'Lebar pergelangan: 22-25 cm (lilitan pergelangan + ease).',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Lukis Kepala Lengan',
          instructions: [
            'Tinggi kepala lengan: ${(armhole / 3 + 1).toStringAsFixed(1)} cm.',
            'Lebar kepala lengan: ${(armhole / 2 + 2).toStringAsFixed(1)} cm.',
            'Lukis lengkungan kepala lengan.',
            'Tandakan titik tertinggi kepala lengan.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Bentuk Lengan',
          instructions: [
            'Lukis garisan sisi lengan - taper dari bahu ke pergelangan.',
            'Tambah dart siku jika perlu (untuk fitted sleeve).',
            'Posisi siku: ${(sleeveLength * 0.6).toStringAsFixed(1)} cm dari bahu.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
        PatternStep(
          stepNumber: 4,
          title: 'Langkah 4 - Siapkan Pola',
          instructions: [
            'Tambah kelim jahitan 1.5 cm di sekeliling.',
            'Tandakan notch untuk padanan.',
            'Tambah placket opening jika perlu: 10-12 cm dari hem.',
            'Hem: tambah 3-4 cm untuk cuff atau lipatan.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
      ],
      'Puff': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Pola Asas',
          instructions: [
            'Mulakan dengan pola lengan pendek asas.',
            'Panjang lengan puff: 20-30 cm.',
            'Ukur lilitan lubang lengan: ${armhole.toStringAsFixed(1)} cm.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Slash dan Spread',
          instructions: [
            'Lukis 3-4 garisan menegak pada pola lengan.',
            'Potong garisan-garisan ini.',
            'Spread (lebarkan) setiap potongan: 3-5 cm.',
            'Ini menambah volume pada kepala lengan.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Gathering',
          instructions: [
            'Nisbah gathering di kepala: 1.5:1 hingga 2:1.',
            'Gathering di hem: 1.5:1.',
            'Jumlah fabrik kepala = ${(armhole * 1.75).toStringAsFixed(1)} cm.',
            'Gunakan 2 baris jahitan untuk gathering.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
        PatternStep(
          stepNumber: 4,
          title: 'Langkah 4 - Band/Cuff',
          instructions: [
            'Lebar band di hem: sama dengan lilitan lengan atas.',
            'Tinggi band: 3-5 cm.',
            'Band memegang gathering di tempatnya.',
            'Boleh guna elastic atau band kain.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
      ],
      'Bell': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Pola Asas',
          instructions: [
            'Mulakan dengan pola lengan panjang asas.',
            'Panjang lengan: ${sleeveLength.toStringAsFixed(1)} cm.',
            'Tentukan di mana flare bermula (biasanya dari siku).',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Slash dan Spread',
          instructions: [
            'Lukis garisan dari siku ke hem.',
            'Slash (potong) dari hem ke siku.',
            'Spread di hem: ${(sleeveLength * 0.5).toStringAsFixed(1)} cm setiap sisi.',
            'Bahagian atas (bahu ke siku) kekal fitted.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Lukis Lengkungan',
          instructions: [
            'Lukis lengkungan bell yang lancar.',
            'Hem berbentuk melengkung, bukan lurus.',
            'Lebar hem: 2-3x lebar pergelangan asal.',
            'Pastikan kedua-dua sisi simetri.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
        PatternStep(
          stepNumber: 4,
          title: 'Langkah 4 - Siapkan',
          instructions: [
            'Tambah kelim jahitan 1.5 cm.',
            'Hem: narrow hem 0.5-1 cm atau facing.',
            'Tandakan notch untuk padanan.',
            'Lengan bell tidak memerlukan zipper.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
      ],
      'Cap': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Ukuran',
          instructions: [
            'Lengan cap sangat pendek: 8-12 cm dari bahu.',
            'Ukur lilitan lubang lengan: ${armhole.toStringAsFixed(1)} cm.',
            'Lengan cap hanya menutup bahu.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Lukis Pola',
          instructions: [
            'Tinggi kepala lengan: ${(armhole / 4).toStringAsFixed(1)} cm.',
            'Bentuk seperti separuh bulatan atau sedikit runcing.',
            'Lebar di bahagian bawah: ${(armhole / 2).toStringAsFixed(1)} cm.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Variasi',
          instructions: [
            'Boleh ditambah sedikit gathering untuk volume.',
            'Atau biarkan flat untuk look minimalis.',
            'Tambah kelim jahitan 1 cm.',
            'Hem: narrow hem atau overlocked edge.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
      ],
    };

    return sleeveInstructions[sleeve] ?? [
      PatternStep(
        stepNumber: 1,
        title: 'Lengan',
        instructions: ['Tiada lengan dipilih.'],
        diagramType: DiagramType.sleeveModification,
      ),
    ];
  }

  /// Get skirt pattern steps
  List<PatternStep> getSkirtSteps(String skirt) {
    Map<String, List<PatternStep>> skirtInstructions = {
      'Straight': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Ukuran Asas',
          instructions: [
            'Ukuran pinggang: ${waist.toStringAsFixed(1)} cm.',
            'Ukuran pinggul: ${hip.toStringAsFixed(1)} cm.',
            'Panjang skirt: ${skirtLength.toStringAsFixed(1)} cm.',
            'Jarak pinggang ke pinggul: 18-20 cm.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Lukis Pola Belakang',
          instructions: [
            'AB – Panjang skirt = ${skirtLength.toStringAsFixed(1)} cm.',
            'AC – Jarak pinggang ke pinggul = 20 cm.',
            'CD – ¼ ukuran pinggul + 1 cm = ${(hip / 4 + 1).toStringAsFixed(1)} cm.',
            'AE – ¼ ukuran pinggang + 3 cm (untuk dart) = ${(waist / 4 + 3).toStringAsFixed(1)} cm.',
            'Lukis dart: lebar 3 cm, panjang 12-14 cm.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Lukis Pola Hadapan',
          instructions: [
            'Sama seperti belakang tetapi dart lebih kecil.',
            'AE – ¼ ukuran pinggang + 2.5 cm = ${(waist / 4 + 2.5).toStringAsFixed(1)} cm.',
            'Dart hadapan: lebar 2.5 cm, panjang 10-12 cm.',
            'Lebar hem sama dengan lebar pinggul.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 4,
          title: 'Langkah 4 - Siapkan',
          instructions: [
            'Tambah kelim jahitan 1.5 cm di sisi dan pinggang.',
            'Hem: 3-4 cm.',
            'Tambah zip di tengah belakang atau sisi: 18-20 cm.',
            'Tandakan grain line selari dengan tengah.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
      ],
      'A-Line': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Ukuran Asas',
          instructions: [
            'Mulakan dengan pola straight skirt.',
            'Ukuran pinggang: ${waist.toStringAsFixed(1)} cm.',
            'Panjang skirt: ${skirtLength.toStringAsFixed(1)} cm.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Slash dan Spread',
          instructions: [
            'Lukis garisan dari dart ke hem.',
            'Tutup dart dan pindahkan ke hem sebagai flare.',
            'Atau: tambah 5-8 cm di setiap sisi di hem.',
            'Flare bermula dari pinggul.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Bentuk A',
          instructions: [
            'Lebar hem: ${(hip + 16).toStringAsFixed(1)} cm (pinggul + 16 cm).',
            'Lukis garisan lurus dari pinggul ke hem.',
            'Dart dikurangkan atau dihapuskan.',
            'Pastikan sisi kiri dan kanan simetri.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 4,
          title: 'Langkah 4 - Siapkan',
          instructions: [
            'Tambah kelim jahitan 1.5 cm.',
            'Hem: 3 cm.',
            'Zip di sisi atau tengah belakang.',
            'A-line sesuai untuk semua bentuk badan.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
      ],
      'Flared': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Pilih Jenis Flare',
          instructions: [
            'Quarter circle (¼ bulatan): flare sederhana.',
            'Half circle (½ bulatan): flare penuh.',
            'Full circle: flare maksimum.',
            'Ukuran pinggang: ${waist.toStringAsFixed(1)} cm.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Kira Jejari',
          instructions: [
            'Untuk half circle skirt:',
            'Jejari dalam (R1) = pinggang ÷ 3.14 = ${(waist / 3.14).toStringAsFixed(1)} cm.',
            'Jejari luar (R2) = R1 + panjang skirt = ${(waist / 3.14 + skirtLength).toStringAsFixed(1)} cm.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Lukis Pola',
          instructions: [
            'Lipat fabrik menjadi 2 atau 4 lapisan.',
            'Lukis arka dengan jejari R1 untuk pinggang.',
            'Lukis arka dengan jejari R2 untuk hem.',
            'Potong mengikut lengkungan.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 4,
          title: 'Langkah 4 - Siapkan',
          instructions: [
            'Tambah kelim jahitan 1.5 cm di pinggang.',
            'Hem: narrow hem 1 cm (lengkungan sukar di-hem lebar).',
            'Gantung skirt 24 jam sebelum hem untuk fabrik jatuh.',
            'Zip di sisi atau tengah belakang.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
      ],
      'Pleated': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Kira Pleat',
          instructions: [
            'Ukuran pinggang: ${waist.toStringAsFixed(1)} cm.',
            'Lebar pleat standard: 3-5 cm.',
            'Bilangan pleat: pinggang ÷ lebar pleat = ${(waist / 4).toStringAsFixed(0)} pleat.',
            'Kedalaman pleat: 2x lebar pleat.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Kira Fabrik',
          instructions: [
            'Jumlah fabrik = 3x ukuran pinggang = ${(waist * 3).toStringAsFixed(1)} cm.',
            'Panjang skirt: ${skirtLength.toStringAsFixed(1)} cm.',
            'Tambahan untuk seam dan hem.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Tandakan Pleat',
          instructions: [
            'Tandakan garisan pleat pada fabrik.',
            'Jarak antara garisan = kedalaman pleat.',
            'Semua pleat menghadap arah yang sama (knife pleat).',
            'Atau berselang-seli (box pleat).',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 4,
          title: 'Langkah 4 - Siapkan',
          instructions: [
            'Lipat dan press pleat.',
            'Jahit pleat di pinggang untuk mengunci.',
            'Boleh stitch pleat hingga pinggul atau biarkan bebas.',
            'Pasang waistband dan zip.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
      ],
      'Gathered': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Kira Gathering',
          instructions: [
            'Ukuran pinggang: ${waist.toStringAsFixed(1)} cm.',
            'Nisbah gathering: 2:1 atau 2.5:1.',
            'Lebar fabrik = ${(waist * 2).toStringAsFixed(1)} cm hingga ${(waist * 2.5).toStringAsFixed(1)} cm.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Potong Fabrik',
          instructions: [
            'Potong segi empat tepat fabrik.',
            'Lebar: seperti dikira di atas.',
            'Panjang: ${skirtLength.toStringAsFixed(1)} cm + hem + seam allowance.',
            'Boleh potong 1 atau 2 panel.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Gathering',
          instructions: [
            'Jahit 2 baris gathering stitch di pinggang.',
            'Jarak dari tepi: 0.5 cm dan 1 cm.',
            'Tarik benang untuk gather hingga = ukuran pinggang.',
            'Agihkan gathering sama rata.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 4,
          title: 'Langkah 4 - Siapkan',
          instructions: [
            'Jahit sisi skirt.',
            'Sambung ke waistband.',
            'Waistband: ${waist.toStringAsFixed(1)} cm + 3 cm (pertindihan).',
            'Tinggi waistband: 3-4 cm.',
            'Hem: 3 cm.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
      ],
      'Pencil': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Ukuran',
          instructions: [
            'Ukuran pinggang: ${waist.toStringAsFixed(1)} cm.',
            'Ukuran pinggul: ${hip.toStringAsFixed(1)} cm.',
            'Panjang skirt: ${skirtLength.toStringAsFixed(1)} cm (biasanya knee length).',
            'Pencil skirt adalah fitted skirt.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Lukis Pola',
          instructions: [
            'Sama seperti straight skirt untuk bahagian atas.',
            'Lebar hem: kurangkan 2-4 cm dari pinggul.',
            'Hem: ${(hip - 4).toStringAsFixed(1)} cm.',
            'Taper bermula dari pinggul ke hem.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Dart dan Slit',
          instructions: [
            'Dart di hadapan dan belakang adalah wajib.',
            'Dart belakang: 3 cm lebar, 14 cm panjang.',
            'Dart hadapan: 2.5 cm lebar, 10 cm panjang.',
            'Tambah slit di belakang: 15-20 cm untuk memudahkan berjalan.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
        PatternStep(
          stepNumber: 4,
          title: 'Langkah 4 - Siapkan',
          instructions: [
            'Tambah kelim jahitan 1.5 cm.',
            'Zip di tengah belakang: 18-20 cm.',
            'Hem: 3 cm.',
            'Lining disyorkan untuk pencil skirt.',
            'Ease minimum untuk keselesaan berjalan.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
      ],
    };

    return skirtInstructions[skirt] ?? [
      PatternStep(
        stepNumber: 1,
        title: 'Skirt',
        instructions: ['Tiada skirt dipilih.'],
        diagramType: DiagramType.skirtModification,
      ),
    ];
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