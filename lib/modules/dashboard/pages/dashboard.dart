import 'package:adhirat/modules/album_module/pages/album_screen.dart';
import 'package:adhirat/modules/dashboard/widgets/custom_bottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_image.dart';

class DashBoadScreen extends StatelessWidget {
  DashBoadScreen({super.key});
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 480) {
          return Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.loginImg),
            )),
          );
        } else {
          return Scaffold(
            backgroundColor: AppColor.white,
            body: Column(
              children: [
                Expanded(child: AlbumScreen()),
                CustomBottombar(size: size, globalController: globalController)
              ],
            ),
          );
        }
      },
    );
  }
}
