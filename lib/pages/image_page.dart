import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/my_appbar.dart';

class ImagePageArgs {
  final String username;
  final bool isActive;

  ImagePageArgs({@required this.username, @required  this.isActive});
}

class ImagePage extends StatefulWidget {
  static String routeName = 'images';

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    final ImagePageArgs args = ModalRoute.of(context).settings.arguments;

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
                child: Center(child: Text('${args.username} is active? ${args.isActive}')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}