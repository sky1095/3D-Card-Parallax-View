import 'package:carousel/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '3D Card Parallax View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Carousel(),
    );
  }
}
