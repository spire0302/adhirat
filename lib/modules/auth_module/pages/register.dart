import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/route_string.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_image.dart';
import '../../../utils/app_text.dart';
import '../../../widgets/custom_btn.dart';
import '../../../widgets/custom_text_feaild.dart';
import '../widgets/back_container.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalController global = Get.find();
  final GlobalController globalController = Get.find();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Obx(
      () => Scaffold(
        body: LayoutBuilder(
            builder: (BuildContext ctx, BoxConstraints constraints) {
          if (constraints.maxWidth >= 700) {
            debugPrint("====> constraints.maxWidth >= 700");
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
                    globalController: globalController,
                    size: size,
                    widget: Column(
                      children: [
                        SizedBox(height: size.height * 0.015),
                        CustomTextFild(
                          globalController: globalController,
                          whit: true,
                          size: size,
                          hint: AppText.firstName[global.language.value]!,
                          controller: firstName,
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomTextFild(
                          whit: true,
                          globalController: globalController,
                          size: size,
                          hint: AppText.lastName[global.language.value]!,
                          controller: lastName,
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomTextFild(
                          whit: true,
                          globalController: globalController,
                          size: size,
                          hint: AppText.emailAddress[global.language.value]!,
                          controller: email,
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomTextFild(
                          whit: true,
                          size: size,
                          globalController: globalController,
                          hint: AppText.mobileNumber[global.language.value]!,
                          controller: mobile,
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomTextFild(
                          whit: true,
                          globalController: globalController,
                          size: size,
                          hint: AppText.password[global.language.value]!,
                          controller: password,
                        ),
                        SizedBox(height: size.height * 0.01),
                        CustomTextFild(
                          whit: true,
                          globalController: globalController,
                          size: size,
                          hint: AppText.confirmPassword[global.language.value]!,
                          controller: confirmPassword,
                        ),
                        SizedBox(height: size.height * 0.025),
                        CustomBtn(
                          globalController: globalController,
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
                      globalController: globalController,
                      size: size,
                      widget: Column(
                        children: [
                          SizedBox(height: size.height * 0.015),
                          CustomTextFild(
                            whit: true,
                            size: size,
                            globalController: globalController,
                            hint: AppText.firstName[global.language.value]!,
                            controller: firstName,
                          ),
                          SizedBox(height: size.height * 0.01),
                          CustomTextFild(
                            globalController: globalController,
                            whit: true,
                            size: size,
                            hint: AppText.lastName[global.language.value]!,
                            controller: lastName,
                          ),
                          SizedBox(height: size.height * 0.01),
                          CustomTextFild(
                            whit: true,
                            globalController: globalController,
                            size: size,
                            hint: AppText.emailAddress[global.language.value]!,
                            controller: email,
                          ),
                          SizedBox(height: size.height * 0.01),
                          phoneField(size),
                          SizedBox(height: size.height * 0.01),
                          CustomTextFild(
                            whit: true,
                            size: size,
                            globalController: globalController,
                            hint: AppText.password[global.language.value]!,
                            controller: password,
                          ),
                          SizedBox(height: size.height * 0.01),
                          CustomTextFild(
                            whit: true,
                            globalController: globalController,
                            size: size,
                            hint:
                                AppText.confirmPassword[global.language.value]!,
                            controller: confirmPassword,
                          ),
                          SizedBox(height: size.height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Theme(
                                  data: Theme.of(context).copyWith(
                                      unselectedWidgetColor:
                                          AppColor.blackcolor[
                                              globalController.dark.value]!),
                                  child: Obx(
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
                                  )),
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
                                      color: AppColor.blackcolor[
                                          globalController.dark.value]!,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: size.height * 0.01),
                          CustomBtn(
                            textSize: size.width * 0.043,
                            globalController: globalController,
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
      ),
    );
  }

  Widget phoneField(Size size) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.015),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
        color: AppColor.whitecolor[globalController.dark.value]!,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: AppColor.whitecolor[globalController.dark.value]!, width: 2),
      ),
      child: InternationalPhoneNumberInput(
        keyboardType: TextInputType.phone,
        selectorButtonOnErrorPadding: 0,
        maxLength: 12,
        searchBoxDecoration: InputDecoration(
          hintText: 'Search',
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.01),
          hintStyle: TextStyle(
            fontSize: size.height * 0.018,
            color: AppColor.grey,
          ),
        ),
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.DIALOG,
          setSelectorButtonAsPrefixIcon: false,
          showFlags: true,
          leadingPadding: 0.0,
          trailingSpace: false,
          countryComparator: (a, b) => a.name!.compareTo(b.name ?? ''),
        ),
        selectorTextStyle: TextStyle(
          fontSize: size.height * 0.018,
          color: AppColor.blackcolor[globalController.dark.value]!,
        ),
        isEnabled: true,
        autoFocusSearch: true,
        scrollPadding: EdgeInsets.zero,
        spaceBetweenSelectorAndTextField: 5,
        formatInput: true,
        initialValue: PhoneNumber(isoCode: 'IN'),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        textFieldController: mobile,
        textStyle: TextStyle(
          fontSize: size.height * 0.018,
          color: AppColor.blackcolor[globalController.dark.value]!,
        ),
        inputDecoration: InputDecoration(
          hintText: AppText.mobileNumber[global.language.value]!,
          contentPadding: EdgeInsets.zero,
          hintStyle: TextStyle(
            fontSize: size.height * 0.018,
            color: Colors.black45,
          ),
          border: InputBorder.none,
        ),
        onInputChanged: (PhoneNumber value) {},
      ),
    );
  }
}
