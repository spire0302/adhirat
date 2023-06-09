import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/auth_module/widgets/back_container.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:adhirat/utils/route_string.dart';
import 'package:adhirat/widgets/custom_btn.dart';
import 'package:adhirat/widgets/custom_text_feaild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final GlobalController global = Get.find();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
final GlobalController globalController = Get.find();
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 700) {
          debugPrint("====> new push");
          return Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.loginImg),
            )),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.35),
                  BackContainer(
                      landScape: true,
                      globalController:globalController,
                      size: size,
                      widget: Column(
                        children: [
                          SizedBox(height: size.height * 0.02),
                          Text(
                            AppText.changePassword[global.language.value]!,
                            style: TextStyle(
                              fontSize: 24,
                              letterSpacing: 0.54,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          CustomTextFild(
                            whit: true,
                            size: size,                          globalController:globalController,

                            hint: AppText.newPassword[global.language.value]!,
                            controller: newPasswordController,
                          ),
                          SizedBox(height: size.height * 0.01),
                          CustomTextFild(
                            whit: true,
                            size: size,   globalController:globalController,
                            hint:
                                AppText.confirmPassword[global.language.value]!,
                            controller: newPasswordController,
                          ),
                          SizedBox(height: size.height * 0.015),
                          CustomBtn(
                            size: size,   globalController:globalController,
                            btnName:
                                AppText.setPassword[global.language.value]!,
                            onClick: () {
                              Navigator.pushNamed(
                                  context, RouteString.LOGIN_SCREEN);
                            },
                            textSize: 20,
                          )
                        ],
                      ))
                ],
              ),
            ),
          );
        } else {
          return Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.loginImg),
            )),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.35),
                  BackContainer(
                      globalController:globalController,

                      size: size,
                      widget: Column(
                        children: [
                          SizedBox(height: size.height * 0.02),
                          Text(
                            AppText.changePassword[global.language.value]!,
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              letterSpacing: 0.54,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          CustomTextFild(
                            whit: true,                          globalController:globalController,

                            size: size,
                            hint: AppText.newPassword[global.language.value]!,
                            controller: newPasswordController,
                          ),
                          SizedBox(height: size.height * 0.01),
                          CustomTextFild(
                            whit: true,                          globalController:globalController,

                            size: size,
                            hint:
                                AppText.confirmPassword[global.language.value]!,
                            controller: newPasswordController,
                          ),
                          SizedBox(height: size.height * 0.015),
                          CustomBtn(                          globalController:globalController,

                              size: size,
                              btnName:
                                  AppText.setPassword[global.language.value]!,
                              onClick: () {
                                Navigator.pushNamed(
                                    context, RouteString.LOGIN_SCREEN);
                              },
                              textSize: size.width * 0.043)
                        ],
                      ))
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
