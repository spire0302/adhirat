import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_gradiant_appbar.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final GlobalController globalController = Get.find();
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
              globalController: globalController,
              lable: "Setting",
              fun: () {
                Get.back();
              },
              size: size),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.15),
                InkWell(
                  onTap: () async {
                    // if (sharecontroller.provider.value ==
                    //     "Play store") {
                    //   await Share.share(sharecontroller.url.value);
                    // } else {}
                  },
                  child: Image.asset(
                    AppImages.playStore,
                    height: size.height * 0.1,
                    width: size.width * 0.13,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  "Share With PlayStore",
                  style: TextStyle(fontSize: size.width * 0.04),
                ),
                SizedBox(height: size.height * 0.07),
                InkWell(
                  onTap: () async {
                    // if (sharecontroller.provider1.value ==
                    //     "App store") {
                    //   await Share.share(sharecontroller.url2.value);
                    // } else {}
                  },
                  child: Image.asset(
                    AppImages.appstore,
                    height: size.height * 0.1,
                    width: size.width * 0.13,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  "Share With AppStore",
                  style: TextStyle(fontSize: size.width * 0.04),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
