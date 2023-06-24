import 'package:flutter/material.dart';

class CustomTextFeildLabel extends StatelessWidget {
  final String title;
  final bool big;
  final bool textalign;
  final bool peding;
  final double left;
  final double buttom;

  const CustomTextFeildLabel({
    Key? key,
    required this.title,
    this.big = false,
    this.textalign = false,
    this.peding = false,
    this.left = 0.0,
    this.buttom = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return peding
        ? Text(title,
        style: TextStyle(
            fontSize: big ? 30 : 15,
            color: big ? Colors.white : const Color(0xff303e9f),
            fontWeight: big ? FontWeight.w500 : FontWeight.w400),
        textAlign: textalign ? TextAlign.center : TextAlign.start)
        : Padding(
      padding: EdgeInsets.only(left: left, bottom: buttom),
      child: Text(title,
          style: TextStyle(
              fontSize: big ? 30 : 15,
              color: big ? Colors.white : const Color(0xff303e9f),
              fontWeight: big ? FontWeight.w500 : FontWeight.w400),
          textAlign: textalign ? TextAlign.center : TextAlign.start,maxLines: 1,overflow: TextOverflow.ellipsis),
    );
  }
}
