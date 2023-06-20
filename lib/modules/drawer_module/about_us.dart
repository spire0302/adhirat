import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/global_cache.dart';
import '../../widgets/custom_gradiant_appbar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final GlobalController globalController = Get.find();

    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
              lable: "About US",
              globalController: globalController,
              fun: () {
                Get.back();
              },
              size: size)
        ],
      ),
    );
  }
}
