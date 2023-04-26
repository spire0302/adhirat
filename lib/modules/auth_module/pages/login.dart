import 'package:adhirat/modules/auth_module/widgets/back_container.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:adhirat/widgets/custom_btn.dart';
import 'package:adhirat/widgets/custom_lable.dart';
import 'package:adhirat/widgets/custom_text_feaild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/back_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();

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
            height: 200,
            width: 200,
            color: AppColor.primaryColor,
          );
        } else {
          debugPrint("====> constraints.maxWidth >=800");
          portrait.value = false;
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
                        CustomLabel(
                            size: size,
                            color: AppColor.white,
                            fontsize: 23,
                            weight: FontWeight.bold,
                            text: "Log in"),
                        SizedBox(height: size.height * 0.01),
                        CustomTextFild(
                          whit: true,
                          size: size,
                          hint: "Email",
                          controller: email,
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomTextFild(
                          whit: true,
                          size: size,
                          hint: "password",
                          controller: email,
                        ),
                        SizedBox(height: size.height * 0.015),
                        CustomBtn(
                          size: size,
                          btnName: "Login",
                        ),
                        SizedBox(height: size.height * 0.008),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Forgot password ?",
                            style: TextStyle(
                              fontSize: size.width * 0.038,
                              fontWeight: FontWeight.bold,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Divider(
                          color: AppColor.white,
                          thickness: 1,
                          height: 1,
                        ),
                        SizedBox(height: size.height * 0.03),
                        CustomBtn(
                          img: AppImages.googleImg,
                          withIcon: true,
                          size: size,
                          btnName: "Login with google",
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomBtn(
                          img: AppImages.appleImg,
                          withIcon: true,
                          size: size,
                          btnName: "Login with apple",
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
