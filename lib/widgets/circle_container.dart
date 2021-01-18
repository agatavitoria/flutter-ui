import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  
  final Widget child;
  final double size;

  CircleContainer({@required this.child, @required this.size}) : assert(child != null), assert(size != null);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
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
