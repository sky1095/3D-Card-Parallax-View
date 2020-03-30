import 'package:carousel/bottomBar.dart';
import 'package:carousel/card_data_model.dart';
import 'package:carousel/common.dart';
import 'package:flutter/material.dart';

import 'carousel_flipper.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  double scrollPercent = 0.0;
  AppConfig appConfig;

  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          //top space
          Container(
            height: appConfig.returnHeight(10),
            width: double.infinity,
          ),
          // Card Space
          Expanded(
            child: CarouselFlipper(
                cards: demoCards,
                onScroll: (double scrollPercent) {
                  setState(() {
                    this.scrollPercent = scrollPercent;
                  });
                }),
          ),
          // Bottom Bar Space
          BottomBar(
            cardCount: demoCards.length,
            scrollPercent: scrollPercent,
          )
        ],
      ),
    );
  }
}
