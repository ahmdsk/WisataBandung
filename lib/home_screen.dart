import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wisatabandung/tourism_place_grid.dart';
import 'package:wisatabandung/tourism_place_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleFontStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wisata Bandung',
          style: titleFontStyle,
        ),
        backgroundColor: const Color(0xFF3d11cf),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return const TourismPlaceList();
          } else if(constraints.maxWidth <= 1200) {
            return const TourismPlaceGrid(
              gridCount: 4,
            );
          } else {
            return const TourismPlaceGrid(
              gridCount: 6,
            );
          }
        },
      ),
    );
  }
}
