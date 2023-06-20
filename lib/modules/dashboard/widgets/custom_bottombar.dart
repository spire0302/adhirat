import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottombar_item.dart';

class CustomBottombar extends StatelessWidget {
  const CustomBottombar({
    super.key,
    required this.size,
    required this.globalController,
  });

  final Size size;
  final GlobalController globalController;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      color: AppColor.whitecolor[globalController.dark.value]!,
      child: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(vertical: size.height * 0.011),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarItem(
                  size: size,
                  onTap: () {
                    globalController.setBottomIndex(0);
                  },
                  icon: Icon(
                    Icons.album_outlined,
                    color: globalController.bottombarIndex.value == 0
                        ? AppColor.primaryColor
                        : AppColor.blackcolor[globalController.dark.value]!.withOpacity(0.25),
                    size: size.height * 0.03,
                  ),
                  lableColor: globalController.bottombarIndex.value == 0
                      ? AppColor.primaryColor
                      : AppColor.blackcolor[globalController.dark.value]!.withOpacity(0.25),
                  lable: AppText.eBook[globalController.language.value]!),
              BottomBarItem(
                  size: size,
                  onTap: () {
                    globalController.setBottomIndex(1);
                  },
                  icon: Icon(
                    Icons.video_collection_outlined,
                    size: size.height * 0.03,
                    color: globalController.bottombarIndex.value == 1
                        ? AppColor.primaryColor
                        : AppColor.blackcolor[globalController.dark.value]!.withOpacity(0.25),
                  ),
                  lableColor: globalController.bottombarIndex.value == 1
                      ? AppColor.primaryColor
                      : AppColor.blackcolor[globalController.dark.value]!.withOpacity(0.25),
                  lable: AppText.video[globalController.language.value]!),
              BottomBarItem(
                  size: size,
                  onTap: () {
                    globalController.setBottomIndex(2);
                  },
                  icon: Icon(
                    Icons.audio_file_outlined,
                    size: size.height * 0.03,
                    color: globalController.bottombarIndex.value == 2
                        ? AppColor.primaryColor
                        : AppColor.blackcolor[globalController.dark.value]!.withOpacity(0.25),
                  ),
                  lableColor: globalController.bottombarIndex.value == 2
                      ? AppColor.primaryColor
                      : AppColor.blackcolor[globalController.dark.value]!.withOpacity(0.25),
                  lable: AppText.audio[globalController.language.value]!),
              BottomBarItem(
                  size: size,
                  onTap: () {
                    globalController.setBottomIndex(3);
                  },
                  icon: Icon(
                    Icons.image_outlined,
                    size: size.height * 0.03,
                    color: globalController.bottombarIndex.value == 3
                        ? AppColor.primaryColor
                        : AppColor.blackcolor[globalController.dark.value]!.withOpacity(0.25),
                  ),
                  lableColor: globalController.bottombarIndex.value == 3
                      ? AppColor.primaryColor
                      : AppColor.blackcolor[globalController.dark.value]!.withOpacity(0.25),
                  lable: AppText.image[globalController.language.value]!)
            ],
          ),
        ),
      ),
    );
  }
}
