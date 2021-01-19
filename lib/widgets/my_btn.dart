import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor, textColor;

  MyBtn({
    @required this.label,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 30,
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        child: Text(
          this.label,
          style: TextStyle(color: this.textColor ?? Colors.black, fontWeight: FontWeight.w500),
        ),
        decoration: BoxDecoration(
          color: this.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 5),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
