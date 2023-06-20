import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_image.dart';

class CustomBackground extends StatelessWidget {
  final Size size;
  final GlobalController globalController;
  final String label;
  final Function onClick;
  final String img;
  final bool showIcon;
  final String iconImg;

  const CustomBackground({
    Key? key,
    required this.size,
    required this.globalController,
    required this.label,
    required this.onClick,
    required this.img,
    this.iconImg = "",
    this.showIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      height: size.height * 0.33,
      width: size.width,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 2,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: AppColor.whitecolor[globalController.dark.value]!.withOpacity(0.5),
        border: Border.all(
          width: 5,
          color: AppColor.primaryColor,
        ),
        // image: DecorationImage(
        //     fit: BoxFit.fill, opacity: 0.4, image: AssetImage(img)),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    onClick();
                  },
                  child: Image.asset(AppImages.back,
                      color: AppColor.whitecolor[globalController.dark.value]!,
                      height: size.height * 0.024,
                      fit: BoxFit.fill),
                ),
                SizedBox(width: size.width * 0.05),
                Text(
                  label,
                  style: TextStyle(
                    color: AppColor.whitecolor[globalController.dark.value]!,
                    fontSize: size.width * 0.053,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.1),
          Center(
            child: Image.asset(
              AppImages.contactUSIcon,
              height: size.height * 0.07,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    ));
  }
}
