import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeftRightIconButton extends StatelessWidget {
  final String leftIcon, label;
  final VoidCallback onPressed;
  final Widget rightContent;

  LeftRightIconButton({
    this.leftIcon,
    this.rightContent,
    this.label = '',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  if (leftIcon != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        leftIcon,
                        width: 30,
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (rightContent != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: rightContent,
              ),
          ],
        ),
      ),
    );
  }
}
