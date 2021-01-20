import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/post_page.dart';
import 'package:flutter_ui/widgets/avatar.dart';
import 'package:flutter_ui/widgets/cronometro.dart';
import 'package:flutter_ui/widgets/my_btn.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Color(0xfff8f8f8),
                    height: constraints.maxHeight * 0.5,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Avatar(
                          size: constraints.maxHeight * 0.25,
                        ),
                        SizedBox(height: 20),
                        Text('Bem Vindo,'),
                        Text(
                          "Darwin Morocho",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      itemBuilder: (_, index) {
                        return Container(
                          width: 120,
                          height: 120,
                          margin: EdgeInsets.all(5),
                          color: Colors.black12,
                        );
                      },
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      itemBuilder: (_, index) {
                        return Container(
                          width: 120,
                          height: 120,
                          margin: EdgeInsets.all(5),
                          color: Colors.black12,
                        );
                      },
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      itemBuilder: (_, index) {
                        return Container(
                          width: 120,
                          height: 120,
                          margin: EdgeInsets.all(5),
                          color: Colors.black12,
                        );
                      },
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: 10),
                  // _isEnabled ? Cronometro(initTime: 90, fontSize: 40) : Container(),
                  // SizedBox(height: 20),
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
                  // MyBtn(
                  //   label: "My Posts",
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, PostPage.routeName);
                  //   },
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
