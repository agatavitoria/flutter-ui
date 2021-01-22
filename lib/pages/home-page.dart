import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/chat_page.dart';
import 'package:flutter_ui/pages/home_page_tabs/history_tab.dart';
import 'package:flutter_ui/pages/home_page_tabs/home_tab.dart';
import 'package:flutter_ui/pages/home_page_tabs/more_tab.dart';
import 'package:flutter_ui/pages/home_page_tabs/oferts_tab.dart';
import 'package:flutter_ui/widgets/bottom_menu.dart';
import 'package:flutter_ui/widgets/my_appbar.dart';

import 'image_page.dart';

class HomePage extends StatefulWidget {
  static String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  PageController _pageViewController;

  final _menu = [
    BottomMenuItem(
      urlSvg: 'https://image.flaticon.com/icons/svg/2531/2531393.svg',
      label: 'Início',
      content: HomeTab(),
    ),
    BottomMenuItem(
      urlSvg: 'https://image.flaticon.com/icons/svg/545/545741.svg',
      label: 'Histórico',
      content: HistoryTab(),
    ),
    BottomMenuItem(
      urlSvg: 'https://image.flaticon.com/icons/svg/545/545664.svg',
      label: 'Ofertas',
      content: OfertsTab(),
    ),
    BottomMenuItem(
      urlSvg: 'https://image.flaticon.com/icons/svg/545/545705.svg',
      label: 'Mais',
      content: MoreTab(),
    ),
  ];

  @override
  void initState() {
    super.initState();

    //o keep page serve para armazenar o estado da página mesmo dps de sair dela
    _pageViewController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  void dispose() {
    _pageViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenu(
        currentPage: _currentPage,
        onChanged: (int newCurrentPage) {
          setState(() {
            _currentPage = newCurrentPage;
            _pageViewController.jumpToPage(newCurrentPage);
          });
        },
        items: _menu,
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
                rightIcon:
                    'https://image.flaticon.com/icons/svg/1370/1370907.svg',
                onRightClick: () {
                  final route = MaterialPageRoute(
                    builder: (BuildContext _) => ChatPage(
                      username: "Darwin Morocho",
                    ),
                  );
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
                // para manter o estado da página, é possível utilizar o indexed stack
                child: PageView.builder(
                  controller: _pageViewController,
                  onPageChanged: (newPage) {
                    setState(() {
                      _currentPage = newPage;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _menu[index].content;
                  },
                  itemCount: _menu.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
