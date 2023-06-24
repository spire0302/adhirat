import 'package:adhirat/modules/drawer_module/language_screen.dart';
import 'package:adhirat/modules/drawer_module/theme_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/global_cache.dart';
import '../../widgets/custom_gradiant_appbar.dart';
import '../../widgets/custom_textwith_icon.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

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
            size: size,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  CustomTextWithIcon(
                    onClick: () {
                      Get.to(() => const LanguageScreen());
                    },
                    text: 'Language',
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  CustomTextWithIcon(
                    onClick: () {
                      Get.to(() => ThemeScreen());
                    },
                    text: 'Theme',
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  CustomTextWithIcon(
                    onClick: () {},
                    text: 'Language',
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  CustomTextWithIcon(
                    onClick: () {},
                    text: 'Language',
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  CustomTextWithIcon(
                    onClick: () {},
                    text: 'Language',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
