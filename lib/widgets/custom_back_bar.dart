import 'package:adhirat/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/global_cache.dart';
import '../utils/app_image.dart';
import 'package:get/get.dart';

class CustomBackBar extends StatelessWidget {
  final Size size;
  final GlobalController globalController;
  final Function onClick;
  final String title;

  const CustomBackBar(
      {Key? key,
      required this.size,
      required this.onClick,
      required this.globalController,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Get.height / 50, horizontal: Get.width / 30),
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => InkWell(
                  onTap: () {
                    onClick();
                  },
                  child: Image.asset(
                    AppImages.back,
                    height: size.height * 0.023,
                    color: AppColor.blackcolor[globalController.dark.value]!,
                  )),
            ),
            Obx(
              () => Text(
                title,
                style: TextStyle(
                    fontSize: size.width * 0.047,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackcolor[globalController.dark.value]!),
              ),
            ),
            Image.asset(AppImages.back,
                color: Colors.transparent, height: size.height * 0.023)
          ],
        ),
      ),
    );
  }
}
