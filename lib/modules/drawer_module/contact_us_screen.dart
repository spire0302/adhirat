import 'package:adhirat/utils/app_image.dart';
import 'package:adhirat/widgets/custom_background.dart';
import 'package:adhirat/widgets/custom_gradiant_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/global_cache.dart';
import '../../utils/app_color.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final GlobalController globalController = Get.find();

    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
              globalController: globalController,
              lable: "Contact US",
              fun: () {
                Get.back();
              },
              size: size),
          Expanded(
            child: Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.appleImg),
                      opacity: 0.04,
                      fit: BoxFit.fill)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                  child: Column(
                    children: const [
                      SizedBox(height: 40),
                      Text(
                        "Lorem Ipsum is simply dummy text of"
                        " the printing and typesetting industry."
                        " Lorem Ipsum has been the industry's"
                        " standard dummy text ever since the 1500s,"
                        " when an unknown printer took a galley "
                        "of type and scrambled it to make a type"
                        " specimen book. It has survived not only"
                        " five centuries, but also the leap into"
                        " electronic typesetting, remaining essentially"
                        " unchanged. It was popularised in the 1960s with"
                        " the release of Letraset sheets containing"
                        " Lorem Ipsum passages, and more recently with "
                        "desktop publishing software like Aldus PageMaker"
                        " including versions of Lorem Ipsum.",
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
