import 'package:flutter/material.dart';
import 'package:wisatabandung/components/detail_mobile_page.dart';
import 'package:wisatabandung/components/detail_web_page.dart';
import 'package:wisatabandung/model/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return DetailWebPage(place: place);
          } else {
            return DetailMobilePage(place: place);
          }
        },
      ),
    );
  }
}
