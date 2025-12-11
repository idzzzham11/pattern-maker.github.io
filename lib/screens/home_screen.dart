import 'package:flutter/material.dart';
import 'pattern_maker_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 1024;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFfef3c7),
            Color(0xFFfce7f3),
            Color(0xFFddd6fe),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(isSmallScreen ? 16 : isMediumScreen ? 32 : 48),
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pattern Maker Studio',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 28 : isMediumScreen ? 36 : 48,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: isSmallScreen ? 8 : 16),
                    Text(
                      'Sistem Drafting Pola Pakaian untuk Pelajar',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : isMediumScreen ? 16 : 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: isSmallScreen ? 32 : isMediumScreen ? 48 : 64),
                    Container(
                      padding: EdgeInsets.all(isSmallScreen ? 20 : isMediumScreen ? 24 : 32),
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
                          Icon(
                            Icons.checkroom,
                            size: isSmallScreen ? 60 : isMediumScreen ? 70 : 80,
                            color: const Color(0xFFa78bfa),
                          ),
                          SizedBox(height: isSmallScreen ? 16 : 24),
                          Text(
                            'Buat Pola Pakaian Anda',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 18 : isMediumScreen ? 20 : 24,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1f2937),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: isSmallScreen ? 8 : 12),
                          Text(
                            'Sistem mudah untuk membuat pola pakaian mengikut ukuran dan style pilihan anda',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 14 : 16,
                              color: const Color(0xFF6b7280),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: isSmallScreen ? 24 : 32),
                          SizedBox(
                            width: double.infinity,
                            height: isSmallScreen ? 48 : 56,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PatternMakerScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFa78bfa),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    isSmallScreen ? 'Mulakan Projek' : 'Mulakan Projek Baru',
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 16 : 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Icon(Icons.arrow_forward),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
