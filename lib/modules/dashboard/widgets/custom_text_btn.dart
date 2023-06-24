import 'package:flutter/material.dart';

class CustomTextBtn extends StatelessWidget {
  final String btnName;
  final Color color;
  final Function onClick;

  const CustomTextBtn(
      {Key? key,
      required this.btnName,
      required this.color,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Text(
        btnName,
        style:
            TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 16),
      ),
    );
  }
}
