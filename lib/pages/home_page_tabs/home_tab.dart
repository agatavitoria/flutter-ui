import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Text('home');
  }

  @override
  bool get wantKeepAlive => true;
}
