import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/home-page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/pages/image_page.dart';
import 'package:flutter_ui/pages/login_page.dart';
import 'package:flutter_ui/pages/splash_page.dart';
import 'pages/post_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return GestureDetector(
      onTap: () {
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          ImagePage.routeName : (BuildContext context) => ImagePage(),
          HomePage.routeName : (_) => HomePage(),
          PostPage.routeName : (_) => PostPage(),
          LoginPage.routeName : (_) => LoginPage(),
        },
        home: SplashPage(),
      ),
    );
  }
}