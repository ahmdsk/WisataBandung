import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wisatabandung/components/favorite_button.dart';

import '../model/tourism_place.dart';

class DetailWebPage extends StatelessWidget {
  final TourismPlace place;

  const DetailWebPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final menuFontStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );

    final titleFontStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
    );

    final textFontStyle = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 14.0,
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
        child: Center(
          child: SizedBox(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wisata Bandung',
                  style: titleFontStyle,
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(place.imageAsset),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Scrollbar(
                            child: Container(
                              height: 150,
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: place.imageUrls.map((place) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(place),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 32.0,
                    ),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                place.name,
                                textAlign: TextAlign.center,
                                style: menuFontStyle,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.calendar_today),
                                      const SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        place.openDays,
                                        style: textFontStyle,
                                      )
                                    ],
                                  ),
                                  const FavoriteButton(),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  const Icon(Icons.access_time),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    place.openTime,
                                    style: textFontStyle,
                                  )
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: <Widget>[
                                  const Icon(Icons.monetization_on),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    place.ticketPrice,
                                    style: textFontStyle,
                                  )
                                ],
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  place.description,
                                  textAlign: TextAlign.justify,
                                  style: textFontStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
