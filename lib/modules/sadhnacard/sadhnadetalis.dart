import 'dart:ui';

import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_image.dart';
import '../../utils/app_text.dart';

class Sadhnadetails extends StatefulWidget {
  Map data;

  Sadhnadetails(this.data, {super.key});

  @override
  State<Sadhnadetails> createState() => _SadhnadetailsState();
}

class _SadhnadetailsState extends State<Sadhnadetails> {
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Obx(() => Scaffold(
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
                AppText.details[globalController.language.value]!,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackcolor[globalController.dark.value]!,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 30 : 20,
                ),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                  child: InkWell(
                    onTap: () {
                      bootomsheet(boxConstraints);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: Get.height / 80),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor
                              .whitecolor[globalController.dark.value]!),
                      child: Center(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width / 30),
                          child: Row(
                            children: [
                              Text(
                                widget.data['date'],
                                style: TextStyle(
                                    color: AppColor.blackcolor[
                                        globalController.dark.value]!,
                                    fontSize:
                                        boxConstraints.maxWidth >= AppText.tab
                                            ? 22
                                            : 18,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              Text(
                                widget.data['arti'],
                                style: TextStyle(
                                    color: AppColor.blackcolor[
                                        globalController.dark.value]!,
                                    fontSize:
                                        boxConstraints.maxWidth >= AppText.tab
                                            ? 22
                                            : 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ));
    });
  }

  Future<void> bootomsheet(BoxConstraints boxConstraints) {
    return showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      backgroundColor: AppColor.lightgreyc[globalController.dark.value]!,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 80),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    widget.data['date'],
                    style: TextStyle(
                        color:
                            AppColor.blackcolor[globalController.dark.value]!,
                        fontSize:boxConstraints.maxWidth >= AppText.tab?24: 20,

                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: Get.height / 13,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: Get.height / 80),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.whitecolor[globalController.dark.value]!),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppText.waktime[globalController.language.value]!,
                          style: TextStyle(
                              color: AppColor
                                  .blackcolor[globalController.dark.value]!,
                              fontSize:boxConstraints.maxWidth >= AppText.tab?18: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          "${widget.data['waketime']}",
                          style: TextStyle(
                              color: AppColor
                                  .blackcolor[globalController.dark.value]!,
                              fontSize:boxConstraints.maxWidth >= AppText.tab?22: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: Get.height / 13,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: Get.height / 80),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.whitecolor[globalController.dark.value]!),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppText.earlytime[globalController.language.value]!,
                          style: TextStyle(
                              color: AppColor
                                  .blackcolor[globalController.dark.value]!,
                              fontSize:boxConstraints.maxWidth >= AppText.tab?18: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          "${widget.data['early']} count",
                          style: TextStyle(
                              color: AppColor
                                  .blackcolor[globalController.dark.value]!,
                              fontSize:boxConstraints.maxWidth >= AppText.tab?22: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: Get.height / 13,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: Get.height / 80),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.whitecolor[globalController.dark.value]!),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppText.latejapa[globalController.language.value]!,
                          style: TextStyle(
                              color: AppColor
                                  .blackcolor[globalController.dark.value]!,
                              fontSize:boxConstraints.maxWidth >= AppText.tab?18: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          "${widget.data['late']} count",
                          style: TextStyle(
                              color: AppColor
                                  .blackcolor[globalController.dark.value]!,
                              fontSize:boxConstraints.maxWidth >= AppText.tab?22: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: Get.height / 13,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: Get.height / 80),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.whitecolor[globalController.dark.value]!),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppText.readtime[globalController.language.value]!,
                          style: TextStyle(
                              color: AppColor
                                  .blackcolor[globalController.dark.value]!,
                              fontSize:boxConstraints.maxWidth >= AppText.tab?18: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          "${widget.data['read']} min",
                          style: TextStyle(
                              color: AppColor
                                  .blackcolor[globalController.dark.value]!,
                              fontSize:boxConstraints.maxWidth >= AppText.tab?22: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: Get.height / 13,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: Get.height / 80),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.whitecolor[globalController.dark.value]!),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppText.heartime[globalController.language.value]!,
                          style: TextStyle(
                              color: AppColor
                                  .blackcolor[globalController.dark.value]!,
                              fontSize:boxConstraints.maxWidth >= AppText.tab?18: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          "${widget.data['hear']} min",
                          style: TextStyle(
                              color: AppColor
                                  .blackcolor[globalController.dark.value]!,
                              fontSize:boxConstraints.maxWidth >= AppText.tab?22: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                widget.data['comment'].toString() == ""
                    ? SizedBox()
                    : Text(
                        AppText.comment[globalController.language.value]!,
                        style: TextStyle(
                            color: AppColor
                                .blackcolor[globalController.dark.value]!,
                            fontSize:boxConstraints.maxWidth >= AppText.tab?18: 14,
                            fontWeight: FontWeight.w400),
                      ),
                const SizedBox(
                  height: 10,
                ),
                widget.data['comment'].toString() == ""
                    ? SizedBox()
                    : Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(vertical: Get.height / 80),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor
                                .whitecolor[globalController.dark.value]!),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width / 30),
                          child: Text(
                            widget.data['comment'],
                            style: TextStyle(
                                color: AppColor
                                    .blackcolor[globalController.dark.value]!,
                                fontSize:boxConstraints.maxWidth >= AppText.tab?22: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
