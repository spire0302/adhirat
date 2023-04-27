import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/auth_module/widgets/back_container.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:adhirat/utils/route_string.dart';
import 'package:adhirat/widgets/custom_btn.dart';
import 'package:adhirat/widgets/custom_text_feaild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_image.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final codeController = List.generate(5, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 480) {
          debugPrint("====> new push");
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
          return Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.loginImg),
            )),
            child: GetBuilder(
                init: GlobalController(),
                builder: (ctrl) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      BackContainer(
                        size: size,
                        widget: Column(
                          children: [
                            SizedBox(height: size.height * 0.02),
                            Text(
                              AppText.forgotPassword[ctrl.language.value]!,
                              style: TextStyle(
                                fontSize: size.width * 0.05,
                                letterSpacing: 0.54,
                                fontWeight: FontWeight.bold,
                                color: AppColor.secondaryColor,
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            CustomTextFild(
                              whit: true,
                              size: size,
                              hint: AppText.emailOrphone[ctrl.language.value]!,
                              controller: emailController,
                            ),
                            if (ctrl.otpSend.isTrue)
                              otpFileldWidget(size, context),
                            SizedBox(height: size.height * 0.015),
                            CustomBtn(
                              textSize: size.width * 0.043,
                              onClick: () {
                                if (ctrl.otpSend.isTrue) {
                                  Navigator.pushNamed(
                                      context, RouteString.RESET_PASSWORD);
                                } else {
                                  ctrl.sendOtpFunction();
                                }
                              },
                              size: size,
                              btnName: ctrl.otpSend.isTrue
                                  ? AppText.verifyCode[ctrl.language.value]!
                                  : AppText.sendCode[ctrl.language.value]!,
                            ),
                            SizedBox(height: size.height * 0.02),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  );
                }),
          );
        }
      }),
    );
  }

  Widget otpFileldWidget(Size size, BuildContext context) {
    return Column(
      children: [
        SizedBox(height: size.height * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              codeController.length,
              (index) => Container(
                height: size.height * 0.06,
                width: size.width / 9,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 1,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.white, width: 2),
                ),
                child: Center(
                  child: TextField(
                    autofocus: false,
                    autocorrect: true,
                    autofillHints: const [AutofillHints.countryCode],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    controller: codeController[index],
                    style: TextStyle(
                      fontSize: size.height * 0.02,
                      color: Colors.black,
                    ),
                    onChanged: (String value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
                      hintText: '0',
                      isDense: true,
                      hintStyle: TextStyle(
                        fontSize: size.height * 0.02,
                        color: Colors.black45,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
