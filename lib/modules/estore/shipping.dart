import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';

class Shipping extends StatefulWidget {
  const Shipping({Key? key}) : super(key: key);

  @override
  State<Shipping> createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  @override
  final GlobalController globalController = Get.find();

  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
        backgroundColor: AppColor.lightgreyc[globalController.dark.value]!,
        bottomNavigationBar: bottombutton(),
        appBar: AppBar(
          backgroundColor: AppColor.lightgreyc[globalController.dark.value]!,
          elevation: 0,
          title:  Text(
            AppText.choosiping[globalController.language.value]!,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              addlist(),
              SizedBox(
                height: 10,
              ),
              addnew()
            ],
          ),
        ),
      ),
    );
  }

  Widget addlist() {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: Get.height / 60),
          itemCount: globalController.shipping.value.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: Get.height / 60),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 30, vertical: Get.height / 60),
                decoration: BoxDecoration(
                    color: AppColor.whitecolor[globalController.dark.value]!,
                    borderRadius: BorderRadius.circular(20)),
                child: Obx(() => Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.primaryColor,
                          child: Center(
                            child: Icon(
                              Icons.delivery_dining_rounded,
                              color: AppColor.whitecolor[globalController.dark.value]!,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              globalController.shipping.value[index]['name'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.blackcolor[globalController.dark.value]!,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: Get.width / 1.7,
                              child: Text(
                                globalController.shipping.value[index]['address'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, color: AppColor.grey),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Radio(
                          value: globalController.shipping.value[index]['id'],
                          groupValue: globalController.selectshipping.value,
                          onChanged: (value) {
                            globalController.selectshipping.value = value;
                          },
                        ),
                      ],
                    )),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget addnew() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: Container(
        width: double.infinity,
        height: Get.height / 16,
        decoration: BoxDecoration(
            color: AppColor.primaryColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(60)),
        child: Center(
          child: Text(
              AppText.addnew[globalController.language.value]!,
            style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  Widget bottombutton() {
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
          child:  Center(
            child: Text(
              AppText.apply[globalController.language.value]!,
              style: TextStyle(
                  color:  AppColor.whitecolor[globalController.dark.value]!,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
