import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreTab extends StatefulWidget {
  @override
  _MoreTabState createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> {
  
  _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton(
        child: Text('Finalizar Sessão'),
        onPressed: _logOut,
      ),
    );
  }
}