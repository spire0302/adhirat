import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/global_cache.dart';
import '../utils/app_text.dart';

class CustomAppbar extends StatelessWidget {
  final String lable;
  final Function fun;
  final Size size;
  final GlobalController globalController;

  const CustomAppbar({
    Key? key,
    required this.lable,
    required this.fun,
    required this.size,
    required this.globalController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 3,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColor.primaryColor.withOpacity(0.9),
          AppColor.primaryColor,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    fun();
                  },
                  child: Image.asset(AppImages.back,
                      color: AppColor.whitecolor[globalController.dark.value]!,
                      height: size.height * 0.024,
                      fit: BoxFit.fill),
                ),
                Expanded(child: Container()),
                Text(lable,
                    style: TextStyle(
                      color: AppColor.whitecolor[globalController.dark.value]!,
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w500,
                    )),
                Expanded(child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
