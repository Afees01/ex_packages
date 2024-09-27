import 'package:carousel_slider/carousel_slider.dart';
import 'package:ex_packages/view/dummy_db.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" CarouselSlider"),
      ),
      body: Center(
        child: CarouselSlider(
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {},
              scrollDirection: Axis.horizontal,
            ),
            items: DummyDb.trendingNowList
                .map(
                  (e) => InkWell(
                    onTap: () {
                      Share.share(e["title"]);
                    },
                    child: Container(
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              e["title"],
                            ),
                            Text(e["rating"],
                                style: GoogleFonts.shadowsIntoLight(
                                    fontSize: 50, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }
}
