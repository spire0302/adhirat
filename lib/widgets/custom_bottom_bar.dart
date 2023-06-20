import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_image.dart';
import '../controller/global_cache.dart';
import '../utils/app_color.dart';

class CustomBottomBar extends StatelessWidget {
  final Size size;
  final int tabIndex;
  final Function tabFun1;
  final Function tabFun2;
  final GlobalController globalController;
  final Function tabFun3;
  final Function tabFun4;
  final Function tabFun5;

  const CustomBottomBar({
    Key? key,
    required this.size,
    required this.tabIndex,
    required this.tabFun1,
    required this.tabFun2,
    required this.globalController,
    required this.tabFun3,
    required this.tabFun4,
    required this.tabFun5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.only(
            top: 15,
            bottom: 10,
            left: size.width * 0.03,
            right: size.width * 0.03,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.whitecolor[globalController.dark.value]!,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 15,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  bottomBtn(
                      tabIndex: tabIndex,
                      onTap: () {
                        tabFun1();
                      },
                      index: 0,
                      lightIcon: AppImages.homeIcon,
                      boldIcon: AppImages.homeBlackIcon,
                      name: "Home"),
                  bottomBtn(
                    tabIndex: tabIndex,
                    onTap: () {
                      tabFun2();
                    },
                    index: 1,
                    lightIcon: AppImages.bookIcon,
                    boldIcon: AppImages.bookBlackIcon,
                    name: "E-book",
                  ),
                  bottomBtn(
                      tabIndex: tabIndex,
                      onTap: () {
                        tabFun3();
                      },
                      index: 2,
                      lightIcon: AppImages.audioIcon,
                      boldIcon: AppImages.audioBlackIcon,
                      name: "Audio"),
                  bottomBtn(
                      tabIndex: tabIndex,
                      onTap: () {
                        tabFun4();
                      },
                      index: 3,
                      boldIconWidth: size.width * 0.07,
                      lightIconWidth: size.width * 0.07,
                      lightIcon: AppImages.videoIcon,
                      boldIcon: AppImages.videoBlackIcon,
                      name: "Video"),
                  bottomBtn(
                      tabIndex: tabIndex,
                      onTap: () {
                        tabFun5();
                      },
                      index: 4,
                      lightIcon: AppImages.imagesIcon,
                      boldIcon: AppImages.imagesBlackIcon,
                      name: "Image"),
                ],
              ),
            ],
          ),
        ));
  }

  Widget bottomBtn(
      {required Function onTap,
      required int index,
      required tabIndex,
      required String lightIcon,
      required String boldIcon,
      double? lightIconWidth,
      double? boldIconWidth,
      required String name}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: size.width * 0.125,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (tabIndex == index)
                ? Image.asset(
                    boldIcon,
                    width: boldIconWidth ?? size.width * 0.06,
                    color: AppColor.primaryColor,
                  )
                : Obx(() => Image.asset(
                      lightIcon,
                      width: lightIconWidth ?? size.width * 0.06,
                      color: AppColor.blackcolor[globalController.dark.value]!,
                    )),
            Text(
              name,
              style: TextStyle(
                color:
                    (tabIndex == index) ? AppColor.primaryColor : AppColor.grey,
                fontSize: (tabIndex == index)
                    ? size.width * 0.036
                    : size.width * 0.034,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
