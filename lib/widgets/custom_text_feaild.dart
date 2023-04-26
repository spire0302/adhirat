import 'package:adhirat/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFild extends StatelessWidget {
  final Size size;
  final String hint;
  final bool whit;
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin
          ? EdgeInsets.symmetric(horizontal: size.width * 0.04)
          : EdgeInsets.symmetric(horizontal: size.width * 0.015),
      padding: max
          ? EdgeInsets.symmetric(
              vertical: size.height * 0.00,
              horizontal: size.width * 0.01,
            )
          : EdgeInsets.symmetric(
              vertical: size.height * 0.00,
              horizontal: size.width * 0.02,
            ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
        color: whit ? Colors.white : Colors.white70,
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: whit ? AppColor.white : Colors.white12, width: 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: false,
              autocorrect: true,
              autofillHints: const [AutofillHints.countryCode],
              keyboardType: numberKeyboard
                  ? TextInputType.number
                  : TextInputType.emailAddress,
              inputFormatters: inputFormatter,
              obscureText: obsertext,
              maxLines: max ? 10 : 1,
              textAlign: cngsize ? TextAlign.center : TextAlign.start,
              controller: controller,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              onChanged: (String value) {
                if (onChange != null) {
                  onChange!();
                }
              },
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          if (button != null) button!,
        ],
      ),
    );
  }
}
