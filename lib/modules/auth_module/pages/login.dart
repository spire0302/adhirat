import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/auth_module/widgets/back_container.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:adhirat/widgets/custom_btn.dart';
import 'package:adhirat/widgets/custom_text_feaild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/route_string.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalController global = Get.put(GlobalController());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool portrait = false.obs;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 480) {
          debugPrint("====> constraints.maxWidth >= 480");
          portrait.value = true;
          return Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.loginImg),
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.05),
                BackContainer(
                    size: size,
                    widget: Column(
                      children: [
                        SizedBox(height: size.height * 0.01),
                        CustomTextFild(
                          whit: true,
                          size: size,
                          hint: AppText.emailAddress[global.language.value]!,
                          controller: email,
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomTextFild(
                          whit: true,
                          size: size,
                          hint: AppText.password[global.language.value]!,
                          controller: password,
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomBtn(
                          textSize: 20,
                          onClick: () {},
                          size: size,
                          btnName: AppText.login[global.language.value]!,
                        ),
                        SizedBox(height: size.height * 0.016),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "${AppText.forgotPassword[global.language.value]!} ?",
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.secondaryColor,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.012),
                          ],
                        ),
                        SizedBox(height: size.height * 0.03),
                        Divider(
                          color: AppColor.white,
                          thickness: 1,
                          height: 1,
                        ),
                        SizedBox(height: size.height * 0.03),
                        CustomBtn(
                          textSize: 20,
                          onClick: () {},
                          img: AppImages.googleImg,
                          withIcon: true,
                          size: size,
                          btnName:
                              AppText.loginWithGoogle[global.language.value]!,
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomBtn(
                          textSize: 20,
                          onClick: () {},
                          img: AppImages.appleImg,
                          withIcon: true,
                          size: size,
                          btnName:
                              AppText.loginWithApple[global.language.value]!,
                        ),
                        SizedBox(height: size.height * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "You don't have a account ? ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteString.REGISTER_SCREEN);
                              },
                              child: Text(
                                AppText.register[global.language.value]!,
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                      ],
                    ),
                    landScape: true),
              ],
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.25),
                  BackContainer(
                    size: size,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.02),
                        CustomTextFild(
                          whit: true,
                          size: size,
                          hint: AppText.emailAddress[global.language.value]!,
                          controller: email,
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomTextFild(
                          whit: true,
                          size: size,
                          hint: AppText.password[global.language.value]!,
                          controller: email,
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomBtn(
                          textSize: size.width * 0.043,
                          onClick: () {
                            Navigator.pushNamed(context, RouteString.DASHBOARD);
                          },
                          size: size,
                          btnName: AppText.login[global.language.value]!,
                        ),
                        SizedBox(height: size.height * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteString.FOEROT_SCREEN);
                              },
                              child: Text(
                                "${AppText.forgotPassword[global.language.value]!} ?",
                                style: TextStyle(
                                  fontSize: size.width * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.secondaryColor,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.01),
                          ],
                        ),
                        SizedBox(height: size.height * 0.03),
                        Divider(
                          color: AppColor.white,
                          thickness: 1,
                          height: 1,
                        ),
                        SizedBox(height: size.height * 0.03),
                        CustomBtn(
                          textSize: size.width * 0.04,
                          onClick: () {
                            // Navigator.pushNamed(
                            //     context, RouteString.REGISTER_SCREEN);
                          },
                          img: AppImages.googleImg,
                          withIcon: true,
                          size: size,
                          btnName:
                              AppText.loginWithGoogle[global.language.value]!,
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomBtn(
                          textSize: size.width * 0.04,
                          onClick: () {},
                          img: AppImages.appleImg,
                          withIcon: true,
                          size: size,
                          btnName:
                              AppText.loginWithApple[global.language.value]!,
                        ),
                        SizedBox(height: size.height * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                AppText
                                    .youDonHaveAccount[global.language.value]!,
                                style: TextStyle(
                                  fontSize: size.width * 0.038,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteString.REGISTER_SCREEN);
                              },
                              child: Text(
                                AppText.register[global.language.value]!,
                                style: TextStyle(
                                  fontSize: size.width * 0.042,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
