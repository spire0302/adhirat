import 'package:adhirat/controller/global_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_gradiant_appbar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final GlobalController globalController = Get.find();
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
              lable: "Privacy Policy",
              fun: () {
                Get.back();
              },
              size: size, globalController: globalController,)
        ],
      ),
    );
  }
}
