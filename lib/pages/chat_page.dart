import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/my_appbar.dart';

class ChatPage extends StatefulWidget {
  final String username;

  ChatPage({@required this.username}) : assert(username != null);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              MyAppbar(
                leftIcon: 'https://image.flaticon.com/icons/svg/860/860790.svg',
                rightIcon: 'https://image.flaticon.com/icons/svg/1370/1370907.svg',
                onLeftClick: () => Navigator.pop(context),
              ),
              Expanded(
                child: Center(child: Text(widget.username)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}