import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/widgets/circle_container.dart';

class Avatar extends StatefulWidget {
  final double size;

  const Avatar({Key key, this.size = 150}) : super(key: key);


  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Stack(
        children: [
          SvgPicture.network(
            'https://image.flaticon.com/icons/svg/1177/1177568.svg'
          ),
          Positioned(
            child: CircleContainer(child: Icon(Icons.edit), size: 60),
            right: 0,
            top: 0,
          ),
        ],
      ),
    );
  }
}