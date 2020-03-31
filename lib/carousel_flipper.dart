import 'dart:math';
import 'dart:ui';

import 'package:carousel/card_data_model.dart';
import 'package:carousel/carousel_card.dart';
import 'package:flutter/material.dart';

class CarouselFlipper extends StatefulWidget {
  final List<CardDataModel> cards;
  final Function(double) onScroll;

  CarouselFlipper({this.cards, this.onScroll});

  @override
  _CarouselFlipperState createState() => _CarouselFlipperState();
}

class _CarouselFlipperState extends State<CarouselFlipper>
    with SingleTickerProviderStateMixin {
  double scrollPercent = 0.0;
  Offset startDrag;
  double startDragPercentScroll;
  double finishScrollStart;
  double finishScrollEnd;
  AnimationController finishScrollController;
  CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    finishScrollController = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    )..addListener(() {
        setState(() {
          // print("Start: " + finishScrollStart.toString());
          // print("Value: " + finishScrollController.value.toString());
          // print("End: " + finishScrollEnd.toString());
          scrollPercent = lerpDouble(
              finishScrollStart, finishScrollEnd, finishScrollController.value);
          if (widget.onScroll != null) {
            widget.onScroll(scrollPercent);
          }
        });
      });

    animation =
        CurvedAnimation(parent: finishScrollController, curve: Curves.ease);
  }

  @override
  void dispose() {
    finishScrollController.dispose();
    super.dispose();
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    startDrag = details.globalPosition;
    startDragPercentScroll = scrollPercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final currDrag = details.globalPosition;
    final dragDistance = currDrag.dx - startDrag.dx;
    final singleCardDragPercent = dragDistance / context.size.width;

    setState(() {
      scrollPercent = (startDragPercentScroll +
              (-singleCardDragPercent / widget.cards.length))
          .clamp(0.0, 1.0 - (1 / widget.cards.length));
      if (widget.onScroll != null) {
        widget.onScroll(scrollPercent);
      }
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    finishScrollStart = scrollPercent;
    finishScrollEnd =
        (scrollPercent * widget.cards.length).round() / widget.cards.length;
    finishScrollController.forward(from: 0.0);

    setState(() {
      startDrag = null;
      startDragPercentScroll = null;
    });
  }

  List<Widget> _buildCards() {
    return List.generate(
        widget.cards.length,
        (index) => _buildCard(
            index, widget.cards.length, scrollPercent, widget.cards[index]));
  }

  Widget _buildCard(
    int cardIndex,
    int cardCount,
    double scrollPercentage,
    CardDataModel cardDetails,
  ) {
    final cardScrollPercentage = scrollPercentage / (1 / cardCount);
    final parallax = scrollPercent - (cardIndex / cardCount);

    return FractionalTranslation(
      translation: Offset(cardIndex - cardScrollPercentage, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, -0.001)
            ..rotateY((pi) / 4 * (cardScrollPercentage - cardIndex)),
          child: CarouselCard(card: cardDetails, parallaxPercent: parallax),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: Stack(
        children: _buildCards(),
      ),
    );
  }
}
