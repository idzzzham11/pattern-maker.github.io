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

  /// Get neckline modification steps - returns List<PatternStep> for each neckline style
  List<PatternStep> getNecklineSteps(String neckline) {
    switch (neckline) {
      case 'Basic Neckline':
        return [
          PatternStep(
            stepNumber: 1,
            title: 'Garis Leher Asas',
            instructions: [
              'Garis leher asas standard - tiada pengubahsuaian diperlukan.',
              'Kedalaman garis leher hadapan: 7-8 cm dari titik bahu.',
              'Kedalaman garis leher belakang: 2-3 cm dari titik bahu.',
              'Lukis lengkungan lancar menggunakan French curve.',
            ],
            diagramType: DiagramType.necklineModification,
          ),
        ];

      case 'Boat Neckline':
        return [
          PatternStep(
            stepNumber: 1,
            title: 'Garis Leher Bot',
            instructions: [
              'Tandakan garis leher bot kira-kira 5 cm (2 inci) dari lubang lengan atau mengikut kehendak.',
              'Bentukkan garisan melengkung sehingga bertemu di tengah hadapan leher.',
            ],
            diagramType: DiagramType.necklineBoatStep1,
          ),
        ];

      case 'Cowl Neckline':
        return [
          PatternStep(
            stepNumber: 1,
            title: 'Langkah 1 - Tandakan Panel',
            instructions: [
              'Tandakan dan garis bentuk V-neck: 10 cm (4 inci) ke bawah dari tengah hadapan, 2.5 cm (1 inci) dari garis leher di bahu.',
              'Panel A: Lukis garisan sedikit melengkung dari V-neck ke tanda 2.5 cm (1 inci) dari V-neck di bahu.',
              'Panel B: Lukis garisan melengkung 2.5 cm (1 inci) ke bawah dari V-neck hingga ke bahu di lubang lengan.',
              'Panel C: Lukis garisan melengkung 2.5 cm (1 inci) ke bawah dari panel B, dari tengah hadapan ke tanda separuh pada lubang lengan.',
            ],
            diagramType: DiagramType.necklineCowlStep1,
          ),
          PatternStep(
            stepNumber: 2,
            title: 'Langkah 2 - Potong dan Buka',
            instructions: [
              'Potong bentuk V-neck.',
              'Gunting garisan dari tengah hadapan ke bahu dan lubang lengan supaya bahagian A hingga D masih bersambung.',
              'Lukis garisan tegak dan buka bahagian A hingga D (untuk menghasilkan lipatan kain).',
              'Pastikan bahagian A hingga D menyentuh garisan tegak seperti ditunjukkan.',
              'Panjangkan tengah hadapan sebanyak 6 mm (¼ inci) supaya kelim selari dengan tengah hadapan.',
            ],
            diagramType: DiagramType.necklineCowlStep2,
          ),
          PatternStep(
            stepNumber: 3,
            title: 'Langkah 3 - Kemasan',
            instructions: [
              'Pendekkan garisan darts sebanyak 5 cm (2 inci).',
              'Tambah 2.5 cm (1 inci) lebihan kelim pada leher.',
              'Tambah 1 cm (⅜ inci) basi jahitan.',
              'Tandakan arah ira kain secara serong (bias).',
            ],
            diagramType: DiagramType.necklineCowlStep3,
          ),
        ];

      case 'Crossover Neckline':
        return [
          PatternStep(
            stepNumber: 1,
            title: 'Langkah 1 - Tandakan Garis Leher',
            instructions: [
              'Reka bentuk ini sesuai untuk blouse balut (wrap top).',
              'Tambahkan tali pada bahagian sisi yang berlipat.',
              'Sediakan bukaan di jahitan sisi kanan untuk memasukkan tali.',
              'Tandakan bahagian badan hadapan kiri dan kanan dengan mengurangkan 1 cm (⅜ inci) di garis tengah hadapan (GTH) pada kedua-dua sisi.',
              'Tandakan garis leher melengkung: 3 cm (1¼ inci) dari garis leher hingga ke jahitan sisi kira-kira 8 cm (3¼ inci) di atas garis pinggang.',
            ],
            diagramType: DiagramType.necklineCrossoverStep1,
          ),
          PatternStep(
            stepNumber: 2,
            title: 'Langkah 2 - Potong dan Bahagikan',
            instructions: [
              'Potong bahagian hadapan dengan garis leher baru.',
              'Gunting dart A dan tutup.',
              'Kemaskan garis leher.',
              'Bahagikan 8 cm jahitan sisi kepada 4 bahagian (jarak 2 cm setiap satu).',
              'Bahagikan sisi dart B kepada 3 bahagian seperti ditunjukkan dalam rajah.',
              'Sambungkan tanda-tanda ini untuk proses guntingan.',
            ],
            diagramType: DiagramType.necklineCrossoverStep2,
          ),
          PatternStep(
            stepNumber: 3,
            title: 'Langkah 3 - Buka Dart',
            instructions: [
              'Potong dart B.',
              'Gunting garisan tetapi pastikan semua bahagian masih bercantum di pangkal dart.',
              'Buka bahagian secara sekata seperti dalam rajah.',
              'Tutup dart B.',
            ],
            diagramType: DiagramType.necklineCrossoverStep3,
          ),
          PatternStep(
            stepNumber: 4,
            title: 'Langkah 4 - Kemasan',
            instructions: [
              'Tandakan arah ira kain sebaiknya secara serong (bias) untuk padanan lebih baik.',
              'Tambahkan basi jahitan di sekeliling.',
              'Hasilkan tanda pada bahagian lipatan (tucks) dengan tepat.',
            ],
            diagramType: DiagramType.necklineCrossoverStep4,
          ),
        ];

      case 'Deep Scoop Neckline':
        return [
          PatternStep(
            stepNumber: 1,
            title: 'Garis Leher Scoop Dalam',
            instructions: [
              'Tandakan bentuk garis leher U kira-kira: 5 cm (2 inci) dari garis leher, 13 cm (5¼ inci) ke bawah dari tengah hadapan.',
              'Kurangkan garis leher di bahagian tengah hadapan sebanyak 1 cm (⅜ inci) untuk mengelakkan bahagian leher menganga.',
              'Ukuran scoop neckline bagi pakaian tanpa lengan (sleeveless):',
              'Tandakan bahu 2 cm (¾ inci) lebih sempit di lubang lengan.',
              'Kurangkan lubang lengan sebanyak 1 cm (⅜ inci).',
              'Naikkan lubang lengan sebanyak 2 cm (¾ inci) seperti ditunjukkan.',
            ],
            diagramType: DiagramType.necklineDeepScoopStep1,
          ),
        ];

      case 'V Neckline':
        return [
          PatternStep(
            stepNumber: 1,
            title: 'Garis Leher V',
            instructions: [
              'Tandakan bentuk V kira-kira: 3 cm (1¼ inci) dari garis leher, 13 cm (5¼ inci) ke bawah dari tengah hadapan leher.',
              'Hasilkan garisan yang sedikit melengkung untuk bentuk yang lebih cantik.',
            ],
            diagramType: DiagramType.necklineVStep1,
          ),
        ];

      default:
        return [
          PatternStep(
            stepNumber: 1,
            title: 'Garis Leher',
            instructions: ['Tiada pengubahsuaian diperlukan.'],
            diagramType: DiagramType.necklineModification,
          ),
        ];
    }
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
      'No Collar': [
        PatternStep(
          stepNumber: 1,
          title: 'Tiada Kolar',
          instructions: [
            'Tiada kolar dipilih untuk rekaan ini.',
            'Garis leher akan dikemas dengan facing atau binding.',
            'Pastikan garis leher dikemas dengan kemas.',
          ],
          diagramType: DiagramType.collarModification,
        ),
      ],
      'Mandarin Collar': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Lukis Pola Kolar',
          instructions: [
            'AB – Bahagian tengah belakang kolar. Lukis garisan menegak sepanjang 3 cm (± 1¼ inci).',
            'AC – ½ lilit leher tolak 1 cm (3/8 inci). Lukis garisan bersudut tepat dari titik A.',
            'AD – 4 cm (± 1½ inci).',
            'CE – 5 cm (2 inci). Lukis garisan bersudut tepat dari titik C.',
            'DE – Sambungkan dengan garisan putus-putus. Kemudian lengkungkan garisan DE dengan menurunkan garisan putus-putus sebanyak 1 cm (3/8 inci) di antara titik D dan E seperti dalam rajah.',
            'EF – 3 cm (± 1¼ inci). Lukis garisan bersudut tepat dari titik E.',
            'BF – Sambungkan dengan mengekalkan lebar 3 cm (± 1¼ inci) dan pastikan garisan selari dengan AE.',
            'Bahagian BFE boleh dibuat bersudut tepat di tengah hadapan, atau dilengkungkan mengikut reka bentuk yang dikehendaki.',
          ],
          diagramType: DiagramType.collarMandarinStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Kemasan',
          instructions: [
            'Potong bahagian tengah belakang pada lipatan kain.',
            'Tambah basi jahitan 1 cm (3/8 inci) di sekeliling.',
            'Hasilkan tanda pada kolar di tengah belakang dan bahu.',
            'Potong dua keping: bahagian hadapan kolar dan bahagian dalam kolar.',
          ],
          diagramType: DiagramType.collarModification,
        ),
      ],
      'One Piece Shirt Collar': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Ukuran Asas',
          instructions: [
            'Turunkan garis leher tengah hadapan pada badan baju sebanyak 1 cm (3/8 inci).',
            'Ukur garis leher baharu dari tengah belakang ke tengah hadapan.',
            'Tentukan lebar kolar di tengah belakang.',
            'Lukis bentuk segi empat tepat berdasarkan ukuran tersebut.',
            'Saiz purata kolar adalah antara 6 cm (2⅜ inci) hingga 9 cm (3½ inci) di bahagian tengah belakang.',
            'Kolar yang lebih lebar akan menghasilkan tapak kolar (stand) yang lebih tinggi.',
          ],
          diagramType: DiagramType.collarShirtStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Garisan Lengkung',
          instructions: [
            'Ukur dari tengah belakang ke bahu dan tandakan.',
            'Di bahagian tengah hadapan, ukur naik 8 mm (hampir 3/8 inci) dan tandakan.',
            'Sambungkan kedua-dua tanda tersebut dengan garisan putus-putus.',
            'Turunkan bahagian tengah garisan putus-putus sebanyak 3 mm (1/8 inci) dan lukis garisan melengkung dari tanda bahu ke tengah hadapan seperti ditunjukkan.',
          ],
          diagramType: DiagramType.collarShirtStep2,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Kemasan',
          instructions: [
            'Untuk kolar berpenjuru (pointed collar), panjangkan garis kolar sama dengan lebar di tengah hadapan.',
            'Bentuk hujung kolar bergantung pada reka bentuk yang dikehendaki.',
            'Potong bahagian tengah belakang pada lipatan kain dan tambah basi jahitan 1 cm (3/8 inci) di sekeliling.',
            'Hasilkan tanda pada kolar di tengah belakang dan bahu.',
            'Potong dua keping (untuk bahagian atas dan bawah kolar).',
          ],
          diagramType: DiagramType.collarModification,
        ),
      ],
      'Peter Pan Collar': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Sediakan Pola',
          instructions: [
            'Surih / tekap bahagian badan hadapan dan belakang supaya garisan bahu bertindih di lubang lengan sebanyak 1 cm (3/8 inci) seperti ditunjukkan pada rajah.',
            'Turunkan garis leher hadapan sebanyak 1 cm untuk memberikan kelonggaran.',
          ],
          diagramType: DiagramType.collarPeterPanStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Lukis Bentuk Kolar',
          instructions: [
            'Tentukan lebar kolar di bahagian belakang leher.',
            'Lukis garisan luar kolar selari dengan garis leher, melengkung di tengah hadapan.',
            'Potong bahagian tengah belakang pada lipatan dan tambah 1 cm (3/8 inci) elaun jahitan di sekeliling.',
            'Hasilkan tanda pola pada kolar di bahu dan di tengah belakang.',
            'Potong dua keping untuk bahagian sebelah luar dan sebelah dalam kolar.',
          ],
          diagramType: DiagramType.collarPeterPanStep2,
        ),
      ],
      'Sailor Collar': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Lukis Pola Kolar',
          instructions: [
            'Tindihkan jahitan bahu sebanyak 1 cm (3/8 inci) seperti kolar Peter Pan.',
            'Tentukan kedalaman garis leher bentuk V di tengah hadapan dan sambungkan ke leher di bahu.',
            'Tentukan kedalaman kolar di CB (tengah belakang).',
            'Luruskan garisan.',
            'Tentukan lebar kolar.',
            'Sambungkan lebar kolar ke garis leher V di tengah hadapan.',
            'Potong bahagian tengah belakang pada lipatan.',
            'Tambah 1 cm (3/8 inci) elaun jahitan di sekeliling.',
            'Hasilkan tanda pola pada kolar di tengah belakang dan bahu.',
            'Potong dua keping untuk bahagian sebelah luar dan sebelah dalam kolar.',
          ],
          diagramType: DiagramType.collarSailorStep1,
        ),
      ],
      'Shawl Collar': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Rangka Asas',
          instructions: [
            'Tambah 1.5 cm pada garisan tengah hadapan bagi ruang tindihan lapik butang.',
            'Tentukan kedalaman garis leher.',
            'Tanda kedudukan breakpoint sebagai A.',
            'Ukur ½ bahagian leher belakang.',
            'Lukis garisan gulung (roll line) dari A melalui B di bahu ke C supaya BC bersamaan ½ leher belakang.',
            'Tentukan lebar tengah belakang kolar dan lukis garisan bersudut tepat dari C ke D.',
            'Lukis garisan bersudut tepat dari D ke E dan seterusnya ke A.',
          ],
          diagramType: DiagramType.collarShawlStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Bentuk Shawl',
          instructions: [
            'Bentukkan semula garisan AED mengikut bentuk shawl yang dikehendaki seperti ilustrasi.',
            'Bentuk ini membolehkan lebih kurang 2.5 cm tapak kolar (collar stand) di bahagian belakang.',
            'Tambah elaun jahitan 1 cm di sekeliling.',
          ],
          diagramType: DiagramType.collarShawlStep2,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Tapak Kolar Rendah',
          instructions: [
            'Untuk tapak kolar yang lebih rendah dan kolar yang lebih leper:',
            'Gunting dari tepi luar kolar ke bahu dan juga di pertengahan antara bahu dan tengah belakang.',
            'Buka sedikit potongan tersebut untuk membentuk lengkungan kolar seperti ditunjukkan.',
          ],
          diagramType: DiagramType.collarModification,
        ),
        PatternStep(
          stepNumber: 4,
          title: 'Langkah 4 - Pola Kolar Berasingan',
          instructions: [
            'Untuk pola kolar berasingan:',
            'Potong sepanjang garisan gulung.',
            'Lengkungkan sedikit garis leher seperti ilustrasi.',
            'Tambah elaun jahitan 1 cm di sekeliling.',
            'Hasilkan tanda pada bahu.',
            'Potong kolar dengan jahitan tengah belakang (CB seam) secara serong (bias).',
          ],
          diagramType: DiagramType.collarModification,
        ),
        PatternStep(
          stepNumber: 5,
          title: 'Langkah 5 - Lapik (Facing)',
          instructions: [
            'Tandakan lapik (facing) selebar 6 – 7 cm di bahu dan di labuh.',
            'Sambungkan dengan garisan lengkung seperti ditunjukkan, selari dengan tengah hadapan dan garis leher.',
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

  /// Get basic sleeve pattern steps (Pola Asas Lengan) - 6 steps
  List<PatternStep> getBasicSleeveSteps() {
    final bicep = armhole * 0.85;
    final elbow = bicep * 0.85;
    
    return [
      PatternStep(
        stepNumber: 1,
        title: 'Langkah 1 - Garis Asas',
        instructions: [
          'AB – Ukuran labuh lengan atas. Tandakan garisan ini.',
          'BC – Ukuran labuh lengan bawah. Tandakan C pada AB.',
          'AC – Tinggi kepala lengan, kira-kira ⅓ lilit lubang lengan = ${(armhole / 3).toStringAsFixed(1)} cm.',
          'CD – ½ ukuran bisep + 4 cm elaun = ${(bicep / 2 + 4).toStringAsFixed(1)} cm.',
          'Lukis garisan bersudut tepat dari C.',
          'CE – ½ ukuran bisep + 4 cm elaun = ${(bicep / 2 + 4).toStringAsFixed(1)} cm.',
          'Lukis garisan bersudut tepat dari C.',
        ],
        diagramType: DiagramType.sleeveStep1,
      ),
      PatternStep(
        stepNumber: 2,
        title: 'Langkah 2 - Garisan Siku',
        instructions: [
          'BF – ½ BC. Tandakan F pada AB.',
          'FG – ½ ukuran siku + 1.25 cm = ${(elbow / 2 + 1.25).toStringAsFixed(1)} cm.',
          'Lukis garisan bersudut tepat dari F.',
          'FH – ½ ukuran siku + 1.25 cm = ${(elbow / 2 + 1.25).toStringAsFixed(1)} cm.',
          'Lukis garisan bersudut tepat dari F.',
        ],
        diagramType: DiagramType.sleeveStep2,
      ),
      PatternStep(
        stepNumber: 3,
        title: 'Langkah 3 - Garisan Pergelangan',
        instructions: [
          'BI – Sama dengan GF – 2.5 cm.',
          'Lukis garisan bersudut tepat dari B.',
          'BJ – Sama dengan BI.',
          'Lukis garisan bersudut tepat dari B.',
          'IK – Lukis garisan dari I melalui G dan D sehingga memotong garisan dari A. Tandakan titik K.',
          'JL – Lukis garisan dari J melalui H dan E sehingga memotong garisan dari A. Tandakan titik L.',
        ],
        diagramType: DiagramType.sleeveStep3,
      ),
      PatternStep(
        stepNumber: 4,
        title: 'Langkah 4 - Titik Lengkung Kepala Lengan',
        instructions: [
          'AM – ¼ AK. Tandakan M pada AK.',
          'DN – ¼ DC. Tandakan N pada DC. Sambungkan M–N.',
          'MO – ½ MN. Tandakan O pada MN.',
          'AP – ¼ AL. Tandakan P pada AL.',
          'QE – ¼ CE. Tandakan Q pada CE. Sambungkan P–Q.',
          'PR – ½ PQ. Tandakan R pada PQ.',
        ],
        diagramType: DiagramType.sleeveStep4,
      ),
      PatternStep(
        stepNumber: 5,
        title: 'Langkah 5 - Lengkung Kepala Lengan',
        instructions: [
          'AD – Lukis garisan melengkung dari A melalui O ke D.',
          'Alihkan M dan N kira-kira 1.25 cm seperti ilustrasi.',
          'Ini menjadi kepala lengan hadapan.',
          'AE – Lukis garisan melengkung dari A melalui R ke E.',
          'Alihkan P dan Q kira-kira 1.25 cm seperti ilustrasi.',
        ],
        diagramType: DiagramType.sleeveStep5,
      ),
      PatternStep(
        stepNumber: 6,
        title: 'Langkah 6 - Dart Siku & Kemasan',
        instructions: [
          'ET lebih panjang daripada DI.',
          'Tandakan dart siku di kedua-dua sisi H, kira-kira 9 cm panjang.',
          'Lebar dart ≈ 3 cm supaya ET (dengan dart ditutup) sama dengan DI.',
          'Tambah 1 cm elaun jahitan di sekeliling pola kecuali kelim (IT) yang perlu kira-kira 3 cm.',
          'Buat satu takuk di kepala lengan hadapan dan dua takuk di kepala lengan belakang.',
          'Tandakan arah benang (grainline) dari A ke B.',
          'Padankan dengan lubang lengan hadapan dan belakang. Buat takuk yang sepadan.',
        ],
        diagramType: DiagramType.sleeveStep6,
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

  /// Get basic skirt pattern steps (Pola Asas Skirt) - Front
  List<PatternStep> getBasicSkirtFrontSteps() {
    final quarterHip = hip / 4;
    final quarterWaist = waist / 4;
    
    return [
      PatternStep(
        stepNumber: 1,
        title: 'Langkah 1 - Rangka Asas',
        instructions: [
          'AB – Panjang tengah hadapan = ${skirtLength.toStringAsFixed(1)} cm.',
          'AC – 16.5 cm ke bawah dari pinggang.',
          'CD – ¼ ukuran punggung + 1.25 cm elaun = ${(quarterHip + 1.25).toStringAsFixed(1)} cm.',
          'BE – Sama dengan CD. Lukis garisan bersudut tepat dari B.',
          'EF – Sama dengan AB + 6 mm. Lukis garisan dari E melalui D ke F.',
          'AF – Sambung dengan lengkung lembut.',
          'BG – ¼ sweep. Panjangkan BE ke G.',
          'AH – ¼ pinggang + 1.25 cm elaun = ${(quarterWaist + 1.25).toStringAsFixed(1)} cm.',
          'HI – Naikkan 1.25 cm. Lengkungkan garisan dari A ke I.',
          'JD – Sambungkan.',
        ],
        diagramType: DiagramType.skirtFrontStep1,
      ),
      PatternStep(
        stepNumber: 2,
        title: 'Langkah 2 - Kelim & Dart',
        instructions: [
          'BK – Sama dengan ½ BG. Lukis garisan bersudut tepat dari sisi ke K.',
          'Lengkungkan kelim dengan lembut.',
          'Lukis garisan punggung selari dengan kelim.',
          'Dart pilihan 1.25 cm sepanjang 10 cm boleh dibuat di tengah pinggang sebagai ganti basi.',
        ],
        diagramType: DiagramType.skirtFrontStep2,
      ),
    ];
  }

  /// Get basic skirt pattern steps (Pola Asas Skirt) - Back
  List<PatternStep> getBasicSkirtBackSteps() {
    final quarterHip = hip / 4;
    final quarterWaist = waist / 4;
    
    return [
      PatternStep(
        stepNumber: 1,
        title: 'Langkah 1 - Rangka Asas',
        instructions: [
          'AB – Panjang tengah hadapan + 1.25 cm = ${(skirtLength + 1.25).toStringAsFixed(1)} cm.',
          'AC – 18 cm ke bawah dari pinggang.',
          'CD – ¼ ukuran punggung + 1.25 cm elaun = ${(quarterHip + 1.25).toStringAsFixed(1)} cm.',
          'BE – Sama dengan CD. Lukis garisan bersudut tepat dari B.',
          'EF – Sama dengan AB – 6 mm. Lukis garisan dari E melalui D ke F.',
          'AF – Lengkungkan garisan ini dengan lembut.',
          'BG – ¼ sweep (kelebaran kelim). Panjangkan BE ke G. Sambungkan G ke D.',
          'CH – 10 cm hingga 11 cm, bergantung pada saiz punggung.',
          'AJ – Sama dengan CH. Sambungkan H ke J.',
          'Bentukkan dart berbentuk V (1.25 cm di setiap sisi J).',
          'AK – ¼ pinggang + 2.5 cm untuk dart = ${(quarterWaist + 2.5).toStringAsFixed(1)} cm.',
          'KL – Naikkan 1.25 cm. Lengkungkan garisan dari A melalui J ke L.',
          'LD – Sambungkan.',
        ],
        diagramType: DiagramType.skirtBackStep1,
      ),
      PatternStep(
        stepNumber: 2,
        title: 'Langkah 2 - Kelim & Garisan Punggung',
        instructions: [
          'BM – Sama dengan ½ BG.',
          'Lukis garisan bersudut tepat dari jahitan sisi ke titik M seperti ditunjukkan.',
          'Lengkungkan kelim dengan lembut.',
          'Lukis garisan punggung (hip line) selari dengan kelim.',
          '(Garisan ini hanya sebagai penunjuk kedudukan punggung.)',
        ],
        diagramType: DiagramType.skirtBackStep2,
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
  // Bodice Back
  backStep1,
  backStep2,
  backStep3,
  backStep4,
  // Bodice Front
  frontStep1,
  frontStep2,
  frontStep3,
  frontStep4,
  // Neckline styles
  necklineModification,
  necklineBoatStep1,
  necklineCowlStep1,
  necklineCowlStep2,
  necklineCowlStep3,
  necklineCrossoverStep1,
  necklineCrossoverStep2,
  necklineCrossoverStep3,
  necklineCrossoverStep4,
  necklineDeepScoopStep1,
  necklineVStep1,
  // Collar styles
  collarModification,
  collarMandarinStep1,
  collarShirtStep1,
  collarShirtStep2,
  collarPeterPanStep1,
  collarPeterPanStep2,
  collarSailorStep1,
  collarShawlStep1,
  collarShawlStep2,
  // Bodice modifications
  bodiceModification,
  // Sleeve
  sleeveStep1,
  sleeveStep2,
  sleeveStep3,
  sleeveStep4,
  sleeveStep5,
  sleeveStep6,
  sleeveModification,
  // Skirt
  skirtFrontStep1,
  skirtFrontStep2,
  skirtBackStep1,
  skirtBackStep2,
  skirtModification,
}