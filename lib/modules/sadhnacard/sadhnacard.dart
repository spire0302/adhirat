import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/sadhnacard/sadhnadetalis.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../utils/app_text.dart';

class SadhnaCard extends StatefulWidget {
  const SadhnaCard({Key? key}) : super(key: key);

  @override
  State<SadhnaCard> createState() => _SadhnaCardState();
}

class _SadhnaCardState extends State<SadhnaCard> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalController globalController = Get.find();
  TimeOfDay? selectedTime;

  RxString arti = "Temple".obs;
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController comment = TextEditingController();
  TextEditingController earlyjup = TextEditingController();
  TextEditingController latejup = TextEditingController();
  TextEditingController readtime = TextEditingController();
  TextEditingController heartime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Obx(() => Scaffold(
            bottomNavigationBar: bottombutton(formKey),
            backgroundColor: AppColor.lightgreyc[globalController.dark.value]!,
            appBar: AppBar(
              backgroundColor:
                  AppColor.lightgreyc[globalController.dark.value]!,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                    color: AppColor.blackcolor[globalController.dark.value]!,
                  )),
              elevation: 0,
              title: Text(
                AppText.sadhanaCard[globalController.language.value]!,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackcolor[globalController.dark.value]!,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 30 : 20,
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      lable(AppText.Date[globalController.language.value]!,
                          boxConstraints),
                      TextFeild(
                          hintText:
                              AppText.Date[globalController.language.value]!,
                          controller: date,
                          boxConstraints: boxConstraints,
                          readOnly: true,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return AppText.pleasepicktdate[
                                  globalController.language.value]!;
                            } else
                              null;
                          },
                          onTap: () {
                            _selectDate(context);
                          }),
                      lable(AppText.waktime[globalController.language.value]!,
                          boxConstraints),
                      Obx(
                        () => TextFeild(
                            readOnly: true,
                            boxConstraints: boxConstraints,
                            hintText: AppText
                                .waktime[globalController.language.value]!,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return AppText.pleasepicktime[
                                    globalController.language.value]!;
                              } else
                                null;
                            },
                            controller: TextEditingController(
                              text: selectedTime != null
                                  ? globalController.sadhnatime.value
                                  : '',
                            ),
                            onTap: () {
                              _selectTime(context);
                            }),
                      ),
                      lable(AppText.earlytime[globalController.language.value]!,
                          boxConstraints),
                      TextFeild(
                        controller: earlyjup,
                        boxConstraints: boxConstraints,
                        hintText:
                            AppText.malacount[globalController.language.value],
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return AppText
                                .entercount[globalController.language.value]!;
                          } else
                            null;
                        },
                      ),
                      lable(AppText.latejapa[globalController.language.value]!,
                          boxConstraints),
                      TextFeild(
                        controller: latejup,
                        boxConstraints: boxConstraints,
                        hintText:
                            AppText.malacount[globalController.language.value]!,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return AppText
                                .entercount[globalController.language.value]!;
                          } else
                            null;
                        },
                      ),
                      lable(AppText.readtime[globalController.language.value]!,
                          boxConstraints),
                      TextFeild(
                        controller: readtime,
                        boxConstraints: boxConstraints,
                        hintText:
                            AppText.Minutes[globalController.language.value]!,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return AppText
                                .entertime[globalController.language.value]!;
                          } else
                            null;
                        },
                      ),
                      lable(AppText.heartime[globalController.language.value]!,
                          boxConstraints),
                      TextFeild(
                        boxConstraints: boxConstraints,
                        controller: heartime,
                        hintText:
                            AppText.Minutes[globalController.language.value]!,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return AppText
                                .entertime[globalController.language.value]!;
                          } else
                            null;
                        },
                      ),
                      Text(
                        AppText.mangala[globalController.language.value]!,
                        style: TextStyle(
                            fontSize: boxConstraints.maxWidth >= AppText.tab
                                ? 20
                                : 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor
                                .blackcolor[globalController.dark.value]!),
                      ),
                      Arti(boxConstraints),
                      lable(AppText.Comment[globalController.language.value]!,
                          boxConstraints),
                      TextFeild(
                          boxConstraints: boxConstraints,
                          hintText:
                              AppText.Comment[globalController.language.value]!,
                          keyboardType: TextInputType.multiline,
                          controller: comment,
                          maxLength: 400),
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
  }

  Widget bottombutton(GlobalKey<FormState> formKey) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width / 30, vertical: Get.height / 70),
        child: Obx(
          () => InkWell(
            onTap: () {
              if (formKey.currentState!.validate()) {
                globalController.sadhnadata = {
                  "date": date.text,
                  "waketime": globalController.sadhnatime.value,
                  "early": earlyjup.text,
                  "late": latejup.text,
                  "read": readtime.text,
                  "hear": heartime.text,
                  "comment": "${comment.text}",
                  "arti": arti.value,
                };

                print(globalController.sadhnadata);
                Get.to(() => Sadhnadetails(globalController.sadhnadata));
              }
            },
            child: Container(
              width: double.infinity,
              height: Get.height / 16,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(60)),
              child: Center(
                child: Text(
                  AppText.Submit[globalController.language.value]!,
                  style: TextStyle(
                      color: AppColor.whitecolor[globalController.dark.value]!,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      final DateFormat formatter =
          DateFormat('yyyy-MM-dd'); // Define the date format
      final String formattedDate = formatter.format(picked);

      date.text = formattedDate;
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null) {
      selectedTime = pickedTime;
      String formattedTime = pickedTime.format(context);
      globalController.sadhnatime.value = formattedTime;
      debugPrint(formattedTime);
    }
  }

  Widget Arti(BoxConstraints boxConstraints) {
    return Obx(() => Row(
          children: [
            SizedBox(
              width: 25,
            ),
            Text(
              AppText.Temple[globalController.language.value]!,
              style: TextStyle(
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 20 : 16,
                  color: AppColor.blackcolor[globalController.dark.value]!),
            ),
            Radio(
              value: 0,
              groupValue: globalController.selectarti.value,
              onChanged: (value) {
                arti.value = AppText.Temple[globalController.language.value]!;
                globalController.selectarti.value = value!;
              },
            ),
            Text(
              AppText.Home[globalController.language.value]!,
              style: TextStyle(
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 20 : 16,
                  color: AppColor.blackcolor[globalController.dark.value]!),
            ),
            Radio(
              value: 1,
              groupValue: globalController.selectarti.value,
              onChanged: (value) {
                arti.value = AppText.Home[globalController.language.value]!;
                globalController.selectarti.value = value!;
              },
            ),
            Text(
              AppText.None[globalController.language.value]!,
              style: TextStyle(
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 20 : 16,
                  color: AppColor.blackcolor[globalController.dark.value]!),
            ),
            Radio(
              value: 2,
              groupValue: globalController.selectarti.value,
              onChanged: (value) {
                arti.value = AppText.None[globalController.language.value]!;
                globalController.selectarti.value = value!;
              },
            ),
          ],
        ));
  }

  Widget lable(String data, BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        data,
        style: TextStyle(
            fontSize: boxConstraints.maxWidth >= AppText.tab ? 20 : 14,
            fontWeight: FontWeight.w600,
            color: AppColor.blackcolor[globalController.dark.value]!),
      ),
    );
  }

  Widget TextFeild({
    TextEditingController? controller,
    required BoxConstraints boxConstraints,
    bool enabled = true,
    String? Function(String?)? validator,
    int? maxLength = 6,
    TextInputType keyboardType = TextInputType.number,
    void Function()? onTap,
    bool readOnly = false,
    String? hintText,
    int? maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        enabled: enabled,
        validator: validator,
        style: TextStyle(
          color: AppColor.blackcolor[globalController.dark.value]!,
          fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 16,
        ),
        maxLength: maxLength,
        keyboardType: keyboardType,
        readOnly: readOnly,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColor.primaryColor, width: 1),
          ),
          filled: true,
          fillColor: AppColor.whitecolor[globalController.dark.value]!,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          enabled: true,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          hintStyle: TextStyle(
            color: AppColor.grey,
            fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 16,
          ),
          isDense: false,
          focusColor: Colors.blue,
          hoverColor: Colors.grey,
          labelStyle: TextStyle(
            color: AppColor.grey,
            fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 16,
          ),
          alignLabelWithHint: false,
          counter: const Offstage(),
        ),
      ),
    );
  }
}
