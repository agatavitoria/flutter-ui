import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/home-page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/pages/image_page.dart';
import 'package:flutter_ui/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ImagePage.routeName : (BuildContext context) => ImagePage(),
        HomePage.routeName : (_) => HomePage()
      },
      home: SplashPage(),
    );
  }
}