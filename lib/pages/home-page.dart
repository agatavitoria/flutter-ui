import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/chat_page.dart';
import 'package:flutter_ui/pages/post_page.dart';
import 'package:flutter_ui/widgets/avatar.dart';
import 'package:flutter_ui/widgets/bottom_menu.dart';
import 'package:flutter_ui/widgets/circle_container.dart';
import 'package:flutter_ui/widgets/cronometro.dart';
import 'package:flutter_ui/widgets/my_appbar.dart';
import 'package:flutter_ui/widgets/my_btn.dart';

import 'image_page.dart';

class HomePage extends StatefulWidget {
  static String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isEnabled = false;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenu(
        currentPage: _currentPage,
        onChanged: (int newCurrentPage) {
          setState(() {
            _currentPage = newCurrentPage;
          });
        },
        items: [
          BottomMenuItem(
            urlSvg: 'https://image.flaticon.com/icons/svg/2531/2531393.svg', 
            label: 'Início',
          ),
          BottomMenuItem(
            urlSvg: 'https://image.flaticon.com/icons/svg/545/545741.svg',
            label: 'Histórico',
          ),
          BottomMenuItem(
            urlSvg: 'https://image.flaticon.com/icons/svg/545/545664.svg',
            label: 'Ofertas'
          ),
          BottomMenuItem(
            urlSvg: 'https://image.flaticon.com/icons/svg/545/545705.svg',
            label: 'Mais'
          ),
        ],
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            children: [
              MyAppbar(
                leftIcon: 'https://image.flaticon.com/icons/svg/685/685662.svg',
                rightIcon: 'https://image.flaticon.com/icons/svg/1370/1370907.svg',
                onRightClick: () {
                  final route = MaterialPageRoute(builder: (BuildContext _)=> ChatPage(username: "Darwin Morocho"));
                  Navigator.push(context, route);
                },
                onLeftClick: () {
                  Navigator.pushNamed(
                    context, 
                    ImagePage.routeName, 
                    arguments: ImagePageArgs(username: 'Darwin', isActive: true),
                  );
                },
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Avatar(),
                    SizedBox(height: 20),
                    Text('Bem Vindo,'),
                    Text(
                      "Darwin Morocho",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    _isEnabled ? Cronometro(initTime: 90, fontSize: 40) : Container(),
                    SizedBox(height: 20),
                    // CupertinoButton(
                    //   color: Colors.blue,
                    //   child: Text('enabled: $_isEnabled'), 
                    //   onPressed: () {
                    //     setState(() {
                    //       _isEnabled = !_isEnabled;
                    //     });
                    //   },
                    // ),
                    // SizedBox(height: 20),
                    // CupertinoButton(
                    //   color: Colors.green,
                    //   child: Text('Go to Chat'), 
                    //   onPressed: () {},
                    // ),
                    MyBtn(
                      label: "My Posts",
                      onPressed: () {
                        Navigator.pushNamed(context, PostPage.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}