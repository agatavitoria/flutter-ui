import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CircleContainer extends StatelessWidget {
  
  final Widget child;
  final double width, height;

  CircleContainer({
   @required this.child,
    @required this.height,
    @required this.width,
  }) : assert(child != null), assert(height != null), assert(width != null);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      alignment: Alignment.center,
      child: this.child,
      decoration: BoxDecoration(
        color: Color(0xfff0f0f0),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(5, 5),
          ),
        ],
      ),
    );
  }

  // Icon(
  //   CupertinoIcons.phone,
  //   size: 50,
  //   color: Theme.of(context).primaryColor,
  // )
}
