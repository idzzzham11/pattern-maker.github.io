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
  /// Get bodice style modification steps
  List<PatternStep> getBodiceStyleSteps(String bodice) {
    Map<String, List<PatternStep>> bodiceInstructions = {
      'Bust Semi Yoke': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Lukis Garisan Pemotongan',
          instructions: [
            'Tekap badan depan.',
            'Lukis garisan melintang dari pertengahan lubang lengan.',
            'Lukis garisan menegak dari titik lisu dan tandakan X pada titik 90 darjah.',
            'Lukis garisan pemotongan seperti ditunjukkan pada rajah.',
            'Potong & pisahkan pola.',
          ],
          diagramType: DiagramType.bodiceBustSemiYokeStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Kembangkan Pola',
          instructions: [
            'Tutup dart pinggang (tindih ¾ inci).',
            'Potong garisan (cut and slash) hingga hampir ke pinggang.',
            'Kembangkan setiap bahagian ¾ inci.',
            'Lukis semula bentuk pola yang baru.',
          ],
          diagramType: DiagramType.bodiceBustSemiYokeStep2,
        ),
      ],
      'Dart Cluster': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Lukis Garisan Potong',
          instructions: [
            'Tekap pola asas badan hadapan.',
            'Lukis garis panduan 1 inci dari kaki dart.',
            'Lukis beberapa garisan potong selari.',
            'Sambungkan ke titik dada.',
          ],
          diagramType: DiagramType.bodiceDartClusterStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Kembangkan',
          instructions: [
            'Potong hingga hampir ke titik dada.',
            'Kembangkan secara sekata.',
            'Lukis semula kaki dart:',
            'Lisu tengah → ½ inci bawah garis panduan.',
            'Lisu luar → sama panjang dengan dart tengah.',
            'Tambah elaun jahitan.',
          ],
          diagramType: DiagramType.bodiceDartClusterStep2,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Kemasan',
          instructions: [
            'Lipat lebihan lisu ke arah tengah depan.',
            'Bahagian pinggang akan jadi tidak rata.',
            'Lukis garis penyambung baru.',
            'Potong lebihan.',
            'Buka semula dan tandakan.',
            'Tebuk lubang ½ inci dari titik dart.',
            'Hasilkan tanda lisu pada pola.',
            'Tanda ira lurus.',
          ],
          diagramType: DiagramType.bodiceDartClusterStep3,
        ),
      ],
      'Double Shoulder Tucks': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Tandakan Kedudukan',
          instructions: [
            'Gunakan pola badan dengan dart pinggang dan sisi.',
            'Tandakan kedudukan lipatan pada bahu & dada (jarak 4 cm).',
            'Tandakan bahagian A, B dan C.',
          ],
          diagramType: DiagramType.bodiceDoubleShoulderTucksStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Potong dan Kembangkan',
          instructions: [
            'Potong sepanjang garisan lipatan dan bahagian atas dart.',
            'Tutup dart sisi.',
            'Kembangkan lipatan secara sama rata.',
          ],
          diagramType: DiagramType.bodiceDoubleShoulderTucksStep2,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Kemasan',
          instructions: [
            'Tandakan panjang lipatan yang dikehendaki.',
            'Dart pinggang boleh dijadikan lipatan, atau dilonggarkan ke garisan pinggang.',
            'Hasilkan tanda di bahu.',
            'Tambah basi jahitan.',
          ],
          diagramType: DiagramType.bodiceDoubleShoulderTucksStep3,
        ),
      ],
      'Flange Inset': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Tekap dan Tandakan Pola',
          instructions: [
            'Tekap pola badan depan & belakang.',
            'Tandakan A = 1 inci dari kaki dart.',
            'Tandakan B = ½ inci dari hujung bahu.',
            'Sambungkan A ke B.',
            'Bentukkan semula lubang lengan.',
            'Tandakan bahagian untuk kedutan: 2 inci dari garis tengah belakang.',
            'Hasilkan garisan tambahan pada garisan tengah belakang sebanyak 1 inci.',
            'Gunting pola mengikut kepingan seperti rajah.',
          ],
          diagramType: DiagramType.bodiceFlangeInsetStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Bentuk Flange dan Kemasan',
          instructions: [
            'Lukiskan satu garisan menegak pada kertas sama panjang dengan panjang flange bahagian hadapan dan belakang.',
            'Menggunakan ukuran A–B pada badan hadapan (front bodice), tandakan kedudukan hujung bahu (label B).',
            'Lipat kertas.',
            'Dari lipatan di titik B, lukis garisan bersudut tepat keluar mengikut lebar flange yang dikehendaki (contoh: 3 inci).',
            'Sambungkan ke titik flange A menggunakan ukuran A–B bahagian hadapan dan belakang seperti ditunjukkan.',
            'Tanda takik (notches) untuk bahagian hadapan dan belakang.',
            'Gunting pola mengikut bentuk flange yang telah dilukis.',
          ],
          diagramType: DiagramType.bodiceFlangeInsetStep2,
        ),
      ],
      'Pin Tucks': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Lukis Bentuk Bib',
          instructions: [
            'Tekap pola & lukis bentuk bib.',
            'Gunting pola pada bentuk bib yang telah dilukis.',
            'Lukis garisan tuck pertama: 1/16 inci dari tengah depan.',
            'Lukis garisan selari: jarak ¼ inci.',
          ],
          diagramType: DiagramType.bodicePinTucksStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Lukis Garisan Lipatan',
          instructions: [
            'Lukis empat set garisan selari, selebar 1/8 inci, untuk menghasilkan ruang lipatan.',
            'Jarakkan 1/4 inci antara satu sama lain.',
            'Lukis garisan lipatan pertama kira-kira 6 inci dari tepi kertas.',
            'Ini akan memberi ruang untuk memotong pada bahagian lipatan.',
            'Basi sebenar bergantung kepada bilangan lipatan dan jumlah pengambilan bagi sesuatu reka bentuk.',
          ],
          diagramType: DiagramType.bodicePinTucksStep2,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Lipat dan Potong',
          instructions: [
            'Lipat kertas pada setiap tuck.',
            'Tekap bentuk bib.',
            'Potong & buka.',
            'Ulang langkah bagi bahagian bertentangan.',
          ],
          diagramType: DiagramType.bodicePinTucksStep3,
        ),
      ],
      'Princess Line': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Tandakan Garis Panel',
          instructions: [
            'Tandakan garis panel kira-kira 14 cm dari bahu.',
            'Lukis garis melengkung ke titik dart (depan & belakang).',
          ],
          diagramType: DiagramType.bodicePrincessLineStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Potong Panel dan Kemasan',
          instructions: [
            'Tandakan titik silang di sisi titik dada (depan) dan titik dart (belakang).',
            'Potong dari lubang lengan ke pinggang.',
            'Buang dart pinggang.',
            'Potong dart sisi dan tutup.',
            'Lukis bentuk panel sisi di bahagian dada dengan kemas.',
            'Tambah basi jahitan.',
            'Hasilkan notch tanda.',
          ],
          diagramType: DiagramType.bodicePrincessLineStep2,
        ),
      ],
    };

    return bodiceInstructions[bodice] ?? [
      PatternStep(
        stepNumber: 1,
        title: 'Pengubahsuaian Badan',
        instructions: ['Tiada pengubahsuaian diperlukan.'],
        diagramType: DiagramType.bodiceModification,
      ),
    ];
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
          diagramType: DiagramType.collarShawlStep3,
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
            'Tandakan lapik (facing) selebar 6-7 cm di bahu dan di labuh.',
            'Sambungkan dengan garisan lengkung seperti ditunjukkan, selari dengan tengah hadapan dan garis leher.',
          ],
          diagramType: DiagramType.collarShawlStep4,
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
      'Sleeveless': [
        PatternStep(
          stepNumber: 1,
          title: 'Tanpa Lengan',
          instructions: [
            'Tiada lengan dipilih untuk rekaan ini.',
            'Pastikan lubang lengan dikemas dengan facing atau binding.',
            'Lebar facing lubang lengan: 3-4 cm.',
            'Tambah kelim jahitan 1 cm di sekeliling facing.',
          ],
          diagramType: DiagramType.sleeveModification,
        ),
      ],
      'Cap Sleeve': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Lukis Pola Cap',
          instructions: [
            'Tekap pola asas lengan pendek.',
            'Turunkan 1 inci dari ketinggian kepala lengan.',
            'Tandakan labuh sisi lengan = 1 inci.',
            'Tambah 1/4 inci basi pada setiap sisi cap.',
            'Lukis garisan melengkung pada bahagian hujung lengan bagi membentuk lengan "cap".',
          ],
          diagramType: DiagramType.sleeveCapStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Menambah Kedut (Optional)',
          instructions: [
            'Langkah ini adalah optional.',
            'Tekap semula pola cap sleeve yang telah dihasilkan.',
            'Potong dan buka 3/8 inci daripada kepala lengan ke bawah.',
            'Lukis semula bentuk cap lengan dengan lebih kemas.',
          ],
          diagramType: DiagramType.sleeveCapStep2,
        ),
      ],
      'Circular Hemline Sleeve': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Lukis Garisan Slash',
          instructions: [
            'Tekap pola asas lengan.',
            'Lukis garisan slash.',
            'Potong garisan slash sehingga hampir ke cap lengan tetapi jangan sampai terputus.',
          ],
          diagramType: DiagramType.sleeveCircularStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Buka Pola',
          instructions: [
            'Lipat kertas pola kepada 2 bahagian.',
            'Lukis garis panduan 2 inci dari lipatan.',
            'Buka pola pada setiap bahagian sehingga menyentuh atau selari dengan garis panduan.',
            'Lukis bentuk lengan dan lengkung lengan hadapan dengan kemas.',
            'Potong pola dari kertas.',
          ],
          diagramType: DiagramType.sleeveCircularStep2,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Kemasan',
          instructions: [
            'Buka lipatan pola.',
            'Lukis ira pola dan tanda pola.',
          ],
          diagramType: DiagramType.sleeveCircularStep3,
        ),
      ],
      'Lantern Sleeve': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Sediakan Pola',
          instructions: [
            'Tekap pola asas lengan.',
            'Label bahagian ¼ kiri dan kanan lengan sebagai X.',
            'Masukkan 1/2 inci dari pola asas lengan membentuk sisi lengan yang baru.',
            'Lukis satu garisan melintang = 6 inci ke atas dari garis pergelangan tangan (boleh diubah mengikut kesesuaian).',
            'Bahagikan lengan kepada lapan bahagian dan nomborkan.',
            'Potong dan buang bahagian yang tidak diperlukan.',
          ],
          diagramType: DiagramType.sleeveLanternStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Potong dan Asingkan',
          instructions: [
            'Potong dan asingkan bahagian atas dan bahagian bawah.',
            'Potong garis slash hingga hampir ke cap.',
          ],
          diagramType: DiagramType.sleeveLanternStep2,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Buka dan Kemas',
          instructions: [
            'Letak di atas kertas surih dan buka mengikut saiz yang dikehendaki.',
            'Ukur 1 inci ke bawah dan kemaskan garisan lengkung.',
            'Hasilkan tanda-tanda pola.',
            'Potong pola.',
          ],
          diagramType: DiagramType.sleeveLanternStep3,
        ),
        PatternStep(
          stepNumber: 4,
          title: 'Langkah 4 - Bahagian Bawah',
          instructions: [
            'Bina bahagian bawah dengan membuka jumlah yang sama seperti lengan atas.',
            'Hasilkan tanda pola.',
            'Potong pola.',
          ],
          diagramType: DiagramType.sleeveLanternStep4,
        ),
      ],
      'Puff Sleeve': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Lukis Garisan Slash',
          instructions: [
            'Tekap pola asas lengan pendek.',
            'Tandakan labuh lengan sebanyak 2 inci.',
            'Lukis dan potong garis slash kepada 3 bahagian dari kelim hingga hampir ke capline.',
          ],
          diagramType: DiagramType.sleevePuffStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Buka dan Tekap',
          instructions: [
            'Lipat kertas pola, letakkan lengan di atas kertas dan buka.',
            'Tekap pola lengan puff dan kemaskan garisan lengkung bawah lengan.',
            'Turunkan 2 inci dari garis tengah dan kemaskan garisan ke underseam (mewujudkan puff).',
            'Tambah basi jahitan 1/2 inci.',
          ],
          diagramType: DiagramType.sleevePuffStep2,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Kemasan Pola',
          instructions: [
            'Buka lipatan pola.',
            'Lukis tanda-tanda pola.',
          ],
          diagramType: DiagramType.sleevePuffStep3,
        ),
        PatternStep(
          stepNumber: 4,
          title: 'Langkah 4 - Cuff',
          instructions: [
            'Panjang cuff segi empat sama = ukuran pergelangan lengan.',
            'Lebar cuff = 2 inci.',
          ],
          diagramType: DiagramType.sleevePuffStep4,
        ),
      ],
      'Tulip Sleeve': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Lukis Petal',
          instructions: [
            'Tekap pola asas lengan.',
            'Tandakan 1 1/2 inci di bawah garisan keruk lengan.',
            'Ukur 1/2 inci pada underseam. Lukis garis ke penjuru lengan.',
            'A–B = 5 inci.',
            'A–C = 3 1/2 inci.',
            'Lukis garisan melengkung bagi membentuk petal.',
            'Jejak lengkung lengan depan untuk petal depan.',
            'Potong petal belakang daripada kertas.',
          ],
          diagramType: DiagramType.sleeveTulipStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Tekap Petal',
          instructions: [
            'Bahagian belakang lengan: Tekap pola lengan petal dan potong pola.',
            'Bahagian hadapan lengan: Tekap pola lengan petal dan trim dari C-D sebanyak 1 cm.',
            'Potong pola.',
          ],
          diagramType: DiagramType.sleeveTulipStep2,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Kemasan',
          instructions: [
            'Selaraskan underseam dan tekap semula bentuk pola.',
            'Lukis tanda-tanda pola.',
          ],
          diagramType: DiagramType.sleeveTulipStep3,
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
      '12 Gore Graduated Flare': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Panel Gore',
          instructions: [
            'Lukis satu panel garis gore di atas kertas.',
            'Lukis garis tegak lurus pada aras pinggul (hip level).',
            'Ulang lukisan panel sebanyak 5 kali (mengikut level garis gore).',
            'Nomborkan panel 1 hingga 6.',
            'Tanda 1/4 inci dari pinggang di GTB, sambung ke panel ke-3 (kelim sisi), kemudian trim.',
            'Panjangkan GTH (Panel 1) dan GTB (Panel 6) ikut labuh yang dikehendaki.',
            'Label A & B dan lukis garis hemline baru.',
            'Pembentukan Flare: Ukur dari titik A ke atas GTH untuk tentukan tempat flare bermula (contoh: 12 inci) → Label C.',
            'Kira: B–D = A–C. Lukis garis dari C ke D.',
            'Panel 1: Dari A, ukur keluar lebar flare (contoh: 4 inci), sambung ke C. Panjang garis mesti sama dengan A–C.',
            'Haluskan (blend) ke hemline → Label Flare 1. Ulang pada semua panel.',
            'Garisan penuh = gore 1, 3, 5. Garisan putus = gore 2, 4, 6.',
            'Pisahkan Panel: Letak kertas bawah pola. Trace setiap gore — Gore 1 → garis penuh, Gore 2 → garis putus. Ulang sampai semua panel siap.',
          ],
          diagramType: DiagramType.skirt12GoreStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Hasil Panel Gore',
          instructions: [
            'Contoh hasil 1 kepingan panel gore yang telah siap.',
          ],
          diagramType: DiagramType.skirt12GoreStep2,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Zipper Seam',
          instructions: [
            'Tambah 3/4 inci basi sepanjang zip.',
            'Turunkan basi ke 1/2 inci di bawah zip.',
            'Basi = 1/2 inci.',
          ],
          diagramType: DiagramType.skirt12GoreStep3,
        ),
      ],
      'Full Circle': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Lukis Bulatan',
          instructions: [
            'Formula pengiraan:',
            'Pinggang + 2 inci (basi seam) = jumlah. Tolak 1 inci (kelonggaran).',
            'Radius = jumlah ÷ 6.28. Contoh: 4 3/8 inci − 1/2 inci basi = 3 7/8 inci.',
            'Labuh skirt = panjang dikehendaki + 1 inci hem.',
            '─────────────────────────',
            'Gunakan pita ukur. Tebuk lubang ikut ukuran.',
            'X = titik mula. X ke Y = radius. Y ke Z = labuh skirt.',
            'Lipat kertas. X = bucu lipatan.',
            'X–Y = radius. Y–Z = labuh skirt.',
            'Lukis bulatan, kemudian potong pola.',
          ],
          diagramType: DiagramType.skirtCircleStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Ratakan Flare',
          instructions: [
            'Untuk meratakan flare di bahagian tengah hadapan (center front), naikkan sebanyak 1/4 inci.',
            'Bahagian belakang boleh diturunkan sebanyak 1/4 inci.',
            'Potong pola skirt daripada kertas dan buat satu salinan (duplicate) untuk melengkapkan bentuk bulatan penuh (full circle).',
          ],
          diagramType: DiagramType.skirtCircleStep2,
        ),
      ],
      'Godets': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Tanda Kedudukan Godet',
          instructions: [
            'Tekap pola asas skirt.',
            'Tanda kedudukan godet (contoh: 10 inci) → A–B.',
            'Lebarkan garis kelepet (contoh: 4 inci) → C.',
            'Sambung A ke C.',
            'Tambah basi zip.',
          ],
          diagramType: DiagramType.skirtGodetsStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Lukis Godet',
          instructions: [
            'A–B = panjang.',
            'B–C = lebar.',
            'Lukis C ke A.',
            'Ulang di kedua-dua sisi.',
          ],
          diagramType: DiagramType.skirtGodetsStep2,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Bentukkan Godet',
          instructions: [
            'Bentukkan bahagian godet.',
            'Lukis garisan slash.',
          ],
          diagramType: DiagramType.skirtGodetsStep3,
        ),
        PatternStep(
          stepNumber: 4,
          title: 'Langkah 4 - Potong & Buka',
          instructions: [
            'Potong dan buka garisan slash.',
          ],
          diagramType: DiagramType.skirtGodetsStep4,
        ),
        PatternStep(
          stepNumber: 5,
          title: 'Langkah 5 - Kemasan',
          instructions: [
            'Tampal pada kertas surih dan perhaluskan bentuk garisan.',
          ],
          diagramType: DiagramType.skirtGodetsStep5,
        ),
      ],
      'Mermaid': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Pengubahsuaian',
          instructions: [
            'Skirt mermaid ketat di atas, kembang di bawah.',
            'Ukuran pinggang: ${waist.toStringAsFixed(1)} cm.',
            'Ukuran pinggul: ${hip.toStringAsFixed(1)} cm.',
            'Panjang skirt: ${skirtLength.toStringAsFixed(1)} cm.',
          ],
          diagramType: DiagramType.skirtModification,
        ),
      ],
      'Skirts With Yoke': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Trace & Tanda Garis Yoke',
          instructions: [
            'Trace pola depan & belakang.',
            'Tandakan garis yoke (3 1/2 inci bawah pinggang).',
            'Lukis garis selari pinggang.',
            'Lukis garis potong (slash lines) bawah yoke.',
            'Potong & asingkan.',
          ],
          diagramType: DiagramType.skirtYokeStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Tutup Dart & Bentuk Yoke',
          instructions: [
            'Tutup dart dan tekap semula bentuk yoke.',
            'Tambah 1 inci pada GTB.',
            'Tanda notch & ira lurus.',
            'Potong: 2 keping front yoke, 4 keping back yoke.',
          ],
          diagramType: DiagramType.skirtYokeStep2,
        ),
        PatternStep(
          stepNumber: 3,
          title: 'Langkah 3 - Fullness & Hemline',
          instructions: [
            'Lipat kertas.',
            'Lukis garis panduan 3 inci dari bawah.',
            'Potong ikut garis & jarakkan untuk fullness.',
            'Trace semula bentuk yoke & hem.',
            'Lukis ira lurus.',
          ],
          diagramType: DiagramType.skirtYokeStep3,
        ),
      ],
      'Tiers': [
        PatternStep(
          stepNumber: 1,
          title: 'Langkah 1 - Ukuran Tier',
          instructions: [
            'Tekap skirt asas dan tandakan ukuran seperti berikut:',
            'Labuh = 29 inci.',
            'Tier A = 6 1/4 inci.',
            'Tier B = 6 3/4 inci.',
            'Tier C = 7 1/4 inci.',
            'Tier D = 8 3/4 inci.',
          ],
          diagramType: DiagramType.skirtTiersStep1,
        ),
        PatternStep(
          stepNumber: 2,
          title: 'Langkah 2 - Bina Pola Tier',
          instructions: [
            'Bina pola bagi setiap tier (A, B, C, dan D) menggunakan ukuran labuh tier dan lebar kain sebagai panduan.',
            'Tier A = Potong 1 lebar kain.',
            'Laraskan bahagian belakang skirt dengan mengukur turun 3/8 inci di GTB, kemudian kemaskan garisan ke side seam.',
            'Tier B = Potong 2 lebar kain.',
            'Tier C = Potong 4 lebar kain.',
            'Tier D = Potong 8 lebar kain.',
          ],
          diagramType: DiagramType.skirtTiersStep2,
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
  collarShawlStep3,
  collarShawlStep4,
  // Bodice modifications
  bodiceModification,
  bodiceBustSemiYokeStep1,
  bodiceBustSemiYokeStep2,
  bodiceDartClusterStep1,
  bodiceDartClusterStep2,
  bodiceDartClusterStep3,
  bodiceDoubleShoulderTucksStep1,
  bodiceDoubleShoulderTucksStep2,
  bodiceDoubleShoulderTucksStep3,
  bodiceFlangeInsetStep1,
  bodiceFlangeInsetStep2,
  bodicePinTucksStep1,
  bodicePinTucksStep2,
  bodicePinTucksStep3,
  bodicePrincessLineStep1,
  bodicePrincessLineStep2,
  // Sleeve basic
  sleeveStep1,
  sleeveStep2,
  sleeveStep3,
  sleeveStep4,
  sleeveStep5,
  sleeveStep6,
  sleeveModification,
  // Sleeve styles
  sleeveCapStep1,
  sleeveCapStep2,
  sleeveCircularStep1,
  sleeveCircularStep2,
  sleeveCircularStep3,
  sleeveTulipStep1,
  sleeveTulipStep2,
  sleeveTulipStep3,
  sleeveLanternStep1,
  sleeveLanternStep2,
  sleeveLanternStep3,
  sleeveLanternStep4,
  sleevePuffStep1,
  sleevePuffStep2,
  sleevePuffStep3,
  sleevePuffStep4,
  // Skirt
  skirtFrontStep1,
  skirtFrontStep2,
  skirtBackStep1,
  skirtBackStep2,
  skirtModification,
  // 12 Gore Graduated Flare
  skirt12GoreStep1,
  skirt12GoreStep2,
  skirt12GoreStep3,
  // Skirts With Yoke
  skirtYokeStep1,
  skirtYokeStep2,
  skirtYokeStep3,
  // Tiers
  skirtTiersStep1,
  skirtTiersStep2,
  // Godets
  skirtGodetsStep1,
  skirtGodetsStep2,
  skirtGodetsStep3,
  skirtGodetsStep4,
  skirtGodetsStep5,
  // Full Circle
  skirtCircleStep1,
  skirtCircleStep2,
}