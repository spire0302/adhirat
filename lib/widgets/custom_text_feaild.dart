import 'package:adhirat/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controller/global_cache.dart';

class CustomTextFild extends StatelessWidget {
  final Size size;
  final String hint;
  final double? height;
  final bool whit;
  final GlobalController globalController;
  final bool custmPadding;
  final bool cngsize;
  final bool margin;
  final bool max;
  final bool obsertext;
  final TextEditingController controller;
  final Function? onChange;
  final Widget? button;
  final bool numberKeyboard;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? inputType;

  const CustomTextFild({
    Key? key,
    required this.size,
    required this.hint,
    required this.controller,
    required this.globalController,
    this.whit = false,
    this.cngsize = false,
    this.margin = false,
    this.onChange,
    this.max = false,
    this.obsertext = false,
    this.button,
    this.numberKeyboard = false,
    this.inputFormatter,
    this.inputType,
    this.custmPadding = false,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      width: double.infinity,
      height: height,
      margin: margin
          ? EdgeInsets.symmetric(horizontal: size.width * 0.04)
          : EdgeInsets.symmetric(horizontal: size.width * 0.015),
      padding: max
          ? EdgeInsets.symmetric(horizontal: size.width * 0.01)
          : EdgeInsets.symmetric(horizontal: size.width * 0.02),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
        color: whit ? AppColor.whitecolor[globalController.dark.value]! : Colors.white70,
        borderRadius: BorderRadius.circular(10),
        border:
        Border.all(color: whit ? AppColor.whitecolor[globalController.dark.value]! : Colors.white12, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              autofocus: false,
              autocorrect: true,
              autofillHints: const [AutofillHints.countryCode],
              keyboardType: inputType,
              inputFormatters: inputFormatter,
              obscureText: obsertext,
              maxLines: max ? 10 : 1,
              textAlign: cngsize ? TextAlign.center : TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              controller: controller,
              style: TextStyle(
                fontSize: size.height * 0.018,
                color: AppColor.blackcolor[globalController.dark.value]!,
              ),
              onChanged: (String value) {
                if (onChange != null) {
                  onChange!();
                }
              },
              decoration: InputDecoration(
                hintText: hint,
                contentPadding: EdgeInsets.zero,
                hintStyle: TextStyle(
                  fontSize: size.height * 0.018,
                  color: AppColor.blackcolor[globalController.dark.value]!,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          if (button != null) button!,
        ],
      ),
    ));
  }
}
