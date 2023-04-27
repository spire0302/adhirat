import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/route_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_image.dart';
import '../../../utils/app_text.dart';
import '../../../widgets/custom_btn.dart';
import '../../../widgets/custom_lable.dart';
import '../../../widgets/custom_text_feaild.dart';
import '../widgets/back_container.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalController global = Get.find();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 480) {
          debugPrint("====> constraints.maxWidth >= 480");
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
                      SizedBox(height: size.height * 0.015),
                      CustomTextFild(
                        whit: true,
                        size: size,
                        hint: AppText.firstName[global.language.value]!,
                        controller: firstName,
                      ),
                      SizedBox(height: size.height * 0.01),
                      CustomTextFild(
                        whit: true,
                        size: size,
                        hint: AppText.lastName[global.language.value]!,
                        controller: lastName,
                      ),
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
                        hint: AppText.mobileNumber[global.language.value]!,
                        controller: mobile,
                      ),
                      SizedBox(height: size.height * 0.01),
                      CustomTextFild(
                        whit: true,
                        size: size,
                        hint: AppText.password[global.language.value]!,
                        controller: password,
                      ),
                      SizedBox(height: size.height * 0.01),
                      CustomTextFild(
                        whit: true,
                        size: size,
                        hint: AppText.confirmPassword[global.language.value]!,
                        controller: confirmPassword,
                      ),
                      SizedBox(height: size.height * 0.025),
                      CustomBtn(
                        textSize: 20,
                        onClick: () {},
                        size: size,
                        btnName: AppText.register[global.language.value]!,
                      ),
                      SizedBox(height: size.height * 0.02),
                    ],
                  ),
                  landScape: true,
                ),
              ],
            ),
          );
        } else {
          debugPrint("====> constraints.maxWidth >=800");
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
                      children: [
                        SizedBox(height: size.height * 0.015),
                        CustomTextFild(
                          whit: true,
                          size: size,
                          hint: AppText.firstName[global.language.value]!,
                          controller: firstName,
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomTextFild(
                          whit: true,
                          size: size,
                          hint: AppText.lastName[global.language.value]!,
                          controller: lastName,
                        ),
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
                          hint: AppText.mobileNumber[global.language.value]!,
                          controller: mobile,
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomTextFild(
                          whit: true,
                          size: size,
                          hint: AppText.password[global.language.value]!,
                          controller: password,
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomTextFild(
                          whit: true,
                          size: size,
                          hint: AppText.confirmPassword[global.language.value]!,
                          controller: confirmPassword,
                        ),
                        SizedBox(height: size.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(
                              () => Transform.scale(
                                scale: 0.8,
                                child: Checkbox(
                                  value: global.privacyPolicy.value,
                                  onChanged: (value) {
                                    global.acceptPrivacyPolicy(value);
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: AppColor.primaryColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  'By register below, I agree to Terms of Service & Privacy Policy',
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: size.height * 0.014,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomBtn(
                          textSize: size.width * 0.043,
                          onClick: () {
                            Navigator.pushNamed(
                                context, RouteString.LOGIN_SCREEN);
                          },
                          size: size,
                          btnName: AppText.register[global.language.value]!,
                        ),
                        SizedBox(height: size.height * 0.015),
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
