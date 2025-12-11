import 'package:flutter/material.dart';
import '../models/pattern_models.dart';

class PatternInstructions {
  static List<Widget> generateInstructions(
      Measurements m, StyleSelections s) {
    final bustQuarter = (m.bust / 4).toStringAsFixed(1);
    final waistQuarter = (m.waist / 4).toStringAsFixed(1);
    final hipQuarter = (m.hip / 4).toStringAsFixed(1);
    final dartSuppression = ((m.bust - m.waist) / 4).toStringAsFixed(1);

    return [
      _buildStepBox(
        'STEP 1: Sediakan Basic Block',
        [
          'Lukis segi empat tepat basic block dengan ukuran berikut:',
          '• Lebar (Width): 1/4 Bust = $bustQuarter ${m.unit}',
          '• Panjang (Length): Back Length = ${m.backLength} ${m.unit}',
          '• Gunakan kertas pattern atau kain muslin untuk draft',
          '• Tandakan center front (CF) dan center back (CB)',
        ],
      ),
      _buildStepBox(
        'STEP 2: Tandakan Garis Penting',
        [
          'Pada basic block, tandakan garis-garis berikut:',
          '• Bust Line: ${m.armhole} ${m.unit} dari bahu',
          '• Waist Line: Kira-kira 38-42 cm dari bahu (atau ikut ukuran badan)',
          '• Hip Line: 18-20 cm di bawah waist line',
          '• Bust Point (BP): Tengah-tengah bust line, 1/2 jarak antara CF dan side seam',
        ],
      ),
      _buildStepBox(
        'STEP 3: Draft Neckline - ${s.neckline}',
        [_getNecklineInstructions(s.neckline ?? '')],
      ),
      _buildStepBox(
        'STEP 4: Buat Dart untuk Shaping',
        [
          'Untuk mengecilkan dari bust ke waist:',
          '• Dart suppression diperlukan: $dartSuppression ${m.unit} per side',
          '• Bahagikan dart: 40% di side seam, 60% di front/back dart',
          '• Front dart: Dari bust point, turun ke waist (panjang ${(double.parse(dartSuppression) * 0.6).toStringAsFixed(1)} ${m.unit})',
          '• Side dart: Dari side seam di bust, ke waist (panjang ${(double.parse(dartSuppression) * 0.4).toStringAsFixed(1)} ${m.unit})',
          '• Dart opening tidak melebihi 2.5 cm untuk front, 3.5 cm untuk back',
        ],
      ),
      _buildStepBox(
        'STEP 5: Bodice Style - ${s.bodice}',
        [_getBodiceInstructions(s.bodice ?? '')],
      ),
      _buildStepBox(
        'STEP 6: Draft Sleeve - ${s.sleeve}',
        [_getSleeveInstructions(s.sleeve ?? '', m)],
      ),
      _buildStepBox(
        'STEP 7: Draft Skirt - ${s.skirt}',
        [_getSkirtInstructions(s.skirt ?? '', m, waistQuarter, hipQuarter)],
      ),
      _buildStepBox(
        'STEP 8: Tambah Collar - ${s.collar}',
        [_getCollarInstructions(s.collar ?? '')],
      ),
      _buildStepBox(
        'STEP 9: Tambah Seam Allowance',
        [
          '• Side seam & shoulder: 1.5 cm',
          '• Neckline & armhole: 1 cm',
          '• Hem: 3-4 cm',
          '• Gunakan pattern notcher untuk tandakan notches di seam yang perlu matching',
        ],
      ),
      _buildStepBox(
        'STEP 10: Finalize Pattern',
        [
          '• Trace pola ke pattern paper yang kuat',
          '• Label setiap pattern piece (Front, Back, Sleeve, Collar, dll)',
          '• Tandakan grainline (arah benang kain)',
          '• Tandakan semua notches dan markings',
          '• WAJIB: Buat toile/muslin test sebelum potong kain sebenar!',
        ],
      ),
      _buildTipsBox(),
    ];
  }

  static Widget _buildStepBox(String title, List<String> instructions) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          left: BorderSide(color: Color(0xFFa78bfa), width: 4),
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7c3aed),
            ),
          ),
          const SizedBox(height: 12),
          ...instructions.map((instruction) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  instruction,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF374151),
                    height: 1.5,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  static Widget _buildTipsBox() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFf5f3ff),
        border: Border.all(color: const Color(0xFFa78bfa), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                '💡',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 8),
              Text(
                'Tips Penting:',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7c3aed),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...[
            '• Sentiasa check measurement berkali-kali',
            '• Press dart dan seam dengan betul',
            '• Gunakan French curve untuk smooth lines',
            '• Test fit dengan muslin sebelum potong kain mahal',
            '• Simpan pattern untuk kegunaan masa depan',
          ].map((tip) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  tip,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF374151),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  static String _getNecklineInstructions(String neckline) {
    final instructions = {
      'Round':
          'Lukis bulatan dari base of neck. Depth: 7-8 cm dari shoulder point. Width: 7 cm dari center front. Gunakan French curve untuk smooth curve.',
      'V-Neck':
          'Dari shoulder point, turunkan 10-12 cm di center front. Sambungkan dengan straight line dari shoulder ke center point untuk bentuk V.',
      'Square':
          'Dari shoulder, turunkan 8-10 cm. Lukis garis horizontal (lebar 8 cm dari CF), kemudian vertical line turun. Sudut square 90°.',
      'Sweetheart':
          'Lukis curve seperti bentuk hati. Depth: 10-12 cm. Peak tertinggi di tengah bust line. Gunakan French curve untuk smooth heart shape.',
      'Boat':
          'Garis horizontal dari shoulder ke shoulder. Depth: 2-3 cm sahaja dari base of neck. Lebar melebar hingga shoulder point.',
      'Scoop':
          'Seperti round neckline tetapi lebih dalam. Depth: 12-15 cm. Width: 8-9 cm. Curve yang dalam dan smooth.',
    };
    return instructions[neckline] ?? 'Draft mengikut standard neckline.';
  }

  static String _getBodiceInstructions(String bodice) {
    final instructions = {
      'Basic Fitted':
          'Gunakan dart standard di bust dan waist untuk fitting. Side seam straight dari armhole ke hip.',
      'Dart Front':
          'Tambah 2 dart di front: 1 dari bust point ke waist, 1 dari side seam. Back dart dari shoulder blade ke waist.',
      'Princess Line':
          'Bahagikan bodice kepada 3-4 panel dengan princess seam. Seam bermula dari shoulder/armhole, melalui bust point, terus ke waist dan hip. Curve yang smooth.',
      'Wrap Style':
          'Bodice bersilang di center front. Tambah 40-50% overlap. Shaping di side seam dan back dart. Tie atau button untuk secure.',
      'Peplum':
          'Fitted bodice hingga waist. Tambah peplum ruffle/flare 10-15 cm panjang di waist seam. Width peplum: 1.5x waist measurement untuk flare.',
    };
    return instructions[bodice] ?? 'Draft mengikut basic bodice.';
  }

  static String _getSleeveInstructions(String sleeve, Measurements m) {
    final instructions = {
      'Sleeveless':
          'Tiada lengan. Finish armhole dengan facing atau bias binding. Armhole depth: ${m.armhole} ${m.unit}.',
      'Short':
          'Panjang sleeve: 15-20 cm dari shoulder. Sleeve cap height: 1/3 armhole depth. Ease 2-3 cm di cap untuk smooth set-in.',
      'Long':
          'Panjang: ${m.sleeveLength} ${m.unit}. Tambah 2 dart di elbow (depth 1.5 cm each). Wrist width: 18-20 cm dengan cuff.',
      'Puff':
          'Short sleeve dengan gathering. Tambah 1.5-2x width untuk gathering. Gathering di cap dan hem. Elastic di hem untuk maintain puff shape.',
      'Bell':
          'Fitted di upper arm, flare dari elbow. Opening at wrist: 25-30 cm. Tambah 40-50% fabric untuk dramatic flare.',
      'Cap':
          'Very short sleeve (8-12 cm). Sleeve cap smooth dan minimal. Cover shoulder point sahaja. No ease needed.',
    };
    return instructions[sleeve] ?? 'Draft standard sleeve.';
  }

  static String _getSkirtInstructions(
      String skirt, Measurements m, String waistQ, String hipQ) {
    final instructions = {
      'Straight':
          'Skirt lurus dari hip ke hem. Waist: $waistQ ${m.unit}, Hip: $hipQ ${m.unit}. Tambah dart (2-3 cm) di waist untuk fitting. Side seam straight.',
      'A-Line':
          'Flare dari waist. Hip width: $hipQ ${m.unit}. Hem width: ${(double.parse(hipQ) + 10).toStringAsFixed(1)} ${m.unit}. Flare beransur dari hip ke hem dengan smooth line.',
      'Flared':
          'Full flare dari waist. Hem width: 2x hip width. Boleh guna godets atau circular cut. Waist gathering atau dart untuk fit.',
      'Pleated':
          'Buat pleats dari waist. Width kain: 2-3x waist measurement. Pleat width: 3-4 cm each. Box pleat atau knife pleat. Press pleats dengan baik.',
      'Gathered':
          'Skirt berkumpul di waist. Fabric width: 2x waist measurement. Running stitch di waist, tarik untuk gathering. Fit waist dengan waistband.',
      'Pencil':
          'Fitted ketat hingga knee/below knee. Waist to hip: fit dengan dart. Hip to hem: kurangkan 1-2 cm for slim silhouette. Perlu walking vent di back.',
    };
    return instructions[skirt] ?? 'Draft standard skirt.';
  }

  static String _getCollarInstructions(String collar) {
    final instructions = {
      'No Collar':
          'Tiada kolar. Finish neckline dengan facing, binding atau rolled hem.',
      'Shirt Collar':
          'Collar stand 3-4 cm tinggi. Collar fall 6-7 cm lebar. Draft collar band dan collar fall separately. Tambah interfacing untuk structure.',
      'Peter Pan':
          'Collar bulat lembut. Width: 5-6 cm. Lukis curve dari center back neckline, follow neckline shape. Soft rounded corners di front.',
      'Mandarin':
          'Stand collar tegak. Height: 3-4 cm. Follow neckline seamline. Overlap 1.5 cm di center front. Button/hook closure. MESTI tambah interfacing.',
      'Shawl':
          'Collar dan lapel seakan satu piece. Bermula dari back neck, curve turun ke front. Width gradually increase dari 6 cm (back) to 10 cm (front). Soft roll line.',
    };
    return instructions[collar] ?? 'Tiada collar.';
  }
}
