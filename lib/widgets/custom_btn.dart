import 'package:adhirat/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../utils/app_color.dart';

class CustomBtn extends StatelessWidget {
  final Size size;
  final String btnName;
  final bool withIcon;
  final String img;

  const CustomBtn({
    Key? key,
    required this.size,
    required this.btnName,
    this.withIcon = false,
    this.img = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size.width,
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.015, horizontal: size.width * 0.02),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.015),
      decoration: BoxDecoration(
        gradient: withIcon
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.white,
                  AppColor.white,
                ],
              )
            : LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.primaryColor,
                  AppColor.secondaryColor,
                ],
              ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: withIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(img, height: size.height * 0.03),
                Expanded(child: Container()),
                Text(
                  btnName,
                  style: TextStyle(
                    fontSize: size.width * 0.037,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: Container()),
              ],
            )
          : Text(
              btnName,
              style: TextStyle(
                fontSize: size.width * 0.037,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
