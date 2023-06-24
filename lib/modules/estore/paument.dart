import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  final GlobalController globalController = Get.find();

  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints boxConstraints) {
      return Obx(() => Scaffold(
            backgroundColor: AppColor.lightgreyc[globalController.dark.value]!,
            bottomNavigationBar: bottombutton(boxConstraints),
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                  color: AppColor.blackcolor[globalController.dark.value]!,
                ),
              ),
              backgroundColor:
                  AppColor.lightgreyc[globalController.dark.value]!,
              elevation: 0,
              title: Text(
                AppText.payment[globalController.language.value]!,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: boxConstraints.maxWidth >= AppText.tab ? 30 : 20,
                    color: AppColor.blackcolor[globalController.dark.value]!),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppText.selectpay[globalController.language.value]!,
                      style: TextStyle(
                        color:
                            AppColor.blackcolor[globalController.dark.value]!,
                        fontSize:
                            boxConstraints.maxWidth >= AppText.tab ? 22 : 16,
                      ),
                    ),
                    addlist(boxConstraints),
                  ],
                ),
              ),
            ),
          ));
    });
  }

  Widget addlist(BoxConstraints boxConstraints) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: Get.height / 60),
        itemCount: globalController.paylist.value.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: Get.height / 60),
            child: InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                globalController.selectpayment.value =
                    globalController.paylist.value[index]['id'];
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 30, vertical: Get.height / 60),
                decoration: BoxDecoration(
                    color: AppColor.whitecolor[globalController.dark.value]!,
                    borderRadius: BorderRadius.circular(20)),
                child: Obx(() => Row(
                      children: [
                        index == 3
                            ? Image.asset(
                                globalController.paylist.value[index]['image'],
                                scale: boxConstraints.maxWidth >= AppText.tab
                                    ? 12
                                    : 16,
                                color: AppColor
                                    .blackcolor[globalController.dark.value]!,
                              )
                            : index == 0
                                ? Image.asset(
                                    globalController.paylist.value[index]
                                        ['image'],
                                    scale:
                                        boxConstraints.maxWidth >= AppText.tab
                                            ? 12
                                            : 16,
                                    color: AppColor.blackcolor[
                                        globalController.dark.value]!,
                                  )
                                : Image.asset(
                                    globalController.paylist.value[index]
                                        ['image'],
                                    scale:
                                        boxConstraints.maxWidth >= AppText.tab
                                            ? 12
                                            : 16,
                                  ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          globalController.paylist.value[index]['name'],
                          style: TextStyle(
                              fontSize: boxConstraints.maxWidth >= AppText.tab
                                  ? 20
                                  : 16,
                              color: AppColor
                                  .blackcolor[globalController.dark.value]!,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        index == 0
                            ? Text(
                                "\$9,327",
                                style: TextStyle(
                                    fontSize:
                                        boxConstraints.maxWidth >= AppText.tab
                                            ? 20
                                            : 16,
                                    color: AppColor.blackcolor[
                                        globalController.dark.value]!,
                                    fontWeight: FontWeight.w600),
                              )
                            : SizedBox(),
                        Theme(
                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor: AppColor
                                    .blackcolor[globalController.dark.value]!),
                            child: Radio(
                              value: globalController.paylist.value[index]
                                  ['id'],
                              groupValue: globalController.selectpayment.value,
                              onChanged: (value) {
                                globalController.selectpayment.value = value;
                              },
                            )),
                      ],
                    )),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget bottombutton(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width / 30, vertical: Get.height / 70),
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          width: double.infinity,
          height: Get.height / 16,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(60)),
          child: Center(
            child: Text(
              AppText.confirmpay[globalController.language.value]!,
              style: TextStyle(
                  color: AppColor.whitecolor[globalController.dark.value]!,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 26 : 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
