import 'package:carousel/card_data_model.dart';
import 'package:carousel/common.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatefulWidget {
  final CardDataModel card;
  final double parallaxPercent;
  CarouselCard({this.card, this.parallaxPercent = 0.0});
  @override
  _CarouselCardState createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            child: FractionalTranslation(
              translation: Offset(widget.parallaxPercent * 2.0, 0.0),
              child: OverflowBox(
                maxWidth: double.infinity,
                child: Image.asset(
                  widget.card.backdropAssetPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Text(
                widget.card.address.toUpperCase(),
                style: TextStyle(
                  letterSpacing: 2.0,
                  color: Colors.white,
                  fontSize: AppConfig(context).returnWidth(6),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${widget.card.minHeightInFeet}-${widget.card.maxHeightInFeet}",
                  style: TextStyle(
                    fontSize: AppConfig(context).returnWidth(45),
                    letterSpacing: 10.0,
                    shadows: [Shadow(color: Colors.black, blurRadius: 30)],
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Text(
                    "FT",
                    style: TextStyle(
                      fontSize: AppConfig(context).returnWidth(6),
                      letterSpacing: 4.0,
                      shadows: [Shadow(color: Colors.black, blurRadius: 30)],
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "${widget.card.tempInDegrees}° F",
                    style: TextStyle(
                      fontSize: AppConfig(context).returnWidth(5.5),
                      letterSpacing: 4.0,
                      shadows: [Shadow(color: Colors.black, blurRadius: 30)],
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                bottom: 50.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5,
                    )),
                child: Padding(
                  padding: EdgeInsets.all(AppConfig(context).returnWidth(3)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        widget.card.weatherType,
                        style: TextStyle(
                          fontSize: AppConfig(context).returnWidth(4.5),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.wb_cloudy,
                          color: Colors.white,
                          size: AppConfig(context).returnWidth(6),
                        ),
                      ),
                      Text(
                        "${widget.card.windSpeedInMph} ${widget.card.cardinalDirection}",
                        style: TextStyle(
                          fontSize: AppConfig(context).returnWidth(4.5),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
    );
  }
}
