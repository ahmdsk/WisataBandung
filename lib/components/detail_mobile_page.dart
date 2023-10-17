import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wisatabandung/components/favorite_button.dart';

import '../model/tourism_place.dart';

class DetailMobilePage extends StatelessWidget {
  final TourismPlace place;

  const DetailMobilePage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final menuFontStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
    );

    final titleFontStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
    );

    final textFontStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 16.0,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(place.imageAsset),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const FavoriteButton()
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: titleFontStyle,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        place.openDays,
                        style: menuFontStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.watch_later_outlined),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        place.openTime,
                        style: menuFontStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.paid),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        place.ticketPrice,
                        style: menuFontStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: textFontStyle,
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: place.imageUrls.length,
                itemBuilder: (context, index) {
                  final String imageUrl = place.imageUrls[index];

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(imageUrl),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
