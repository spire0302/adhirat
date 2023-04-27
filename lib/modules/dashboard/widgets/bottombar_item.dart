import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final Size size;
  final String lable;
  final Widget icon;
  final void Function()? onTap;
  final Color lableColor;
  const BottomBarItem(
      {super.key,
      required this.size,
      required this.lable,
      required this.icon,
      required this.onTap,
      required this.lableColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: size.height * 0.005),
          Text(
            lable,
            style: TextStyle(
                color: lableColor,
                fontSize: size.height * 0.014,
                letterSpacing: 0.6,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
