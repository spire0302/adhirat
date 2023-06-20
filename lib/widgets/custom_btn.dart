import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/global_cache.dart';
import '../utils/app_color.dart';

class CustomBtn extends StatelessWidget {
  final Size size;
  final Color? color;
  final String btnName;
  final GlobalController globalController;
  final bool withIcon;
  final String img;
  final void Function() onClick;
  final double textSize;

  const CustomBtn({
    Key? key,
    required this.size,
    required this.globalController,
    required this.btnName,
    this.withIcon = false,
    this.img = "",
    this.color,
    required this.onClick,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onClick,
        child: Obx(
          () => Container(
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
                        AppColor.whitecolor[globalController.dark.value]!,
                        AppColor.whitecolor[globalController.dark.value]!,
                      ],
                    )
                  : LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor.primaryColor,
                        AppColor.primaryColor,
                      ],
                    ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: withIcon
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        img,
                        height: size.height * 0.03,
                        color: color,
                      ),
                      Expanded(child: Container()),
                      Text(
                        btnName,
                        style: TextStyle(
                            fontSize: textSize,
                            fontWeight: FontWeight.bold,
                            color: AppColor
                                .blackcolor[globalController.dark.value]!),
                      ),
                      Expanded(child: Container()),
                    ],
                  )
                : Text(
                    btnName,
                    style: TextStyle(
                        fontSize: textSize,
                        fontWeight: FontWeight.w700,
                        color:
                            AppColor.blackcolor[globalController.dark.value]!),
                  ),
          ),
        ));
  }
}
