import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'checkout.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints boxConstraints) {
        return Obx(() => Scaffold(
              bottomNavigationBar: bottombar(boxConstraints),
              backgroundColor:
                  AppColor.lightgreyc[globalController.dark.value]!,
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
                  AppText.mycart[globalController.language.value]!,
                  style: TextStyle(
                      color: AppColor.blackcolor[globalController.dark.value]!,
                      fontSize:
                          boxConstraints.maxWidth >= AppText.tab ? 30 : 20),
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                        color:
                            AppColor.blackcolor[globalController.dark.value]!,
                      ))
                ],
              ),
              body: cartlist(boxConstraints),
            ));
      },
    );
  }

  Future<void> bootomsheet(BoxConstraints boxConstraints) {
    return showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: AppColor.lightgreyc[globalController.dark.value]!,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              AppText.removecart[globalController.language.value]!,
              style: TextStyle(
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 24 : 19,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackcolor[globalController.dark.value]!),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: AppColor.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                child: Container(
                  height: Get.height / 5.5,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColor.whitecolor[globalController.dark.value]!,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                globalController.cartlist.value[1]['image'],
                              ),
                            ),
                            color: AppColor
                                .lightgreyc[globalController.dark.value]!),
                        // height: Get.height / 6,
                        width: Get.width / 3,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            globalController.cartlist.value[1]['name'],
                            style: TextStyle(
                                fontSize: boxConstraints.maxWidth >= AppText.tab
                                    ? 28
                                    : 18,
                                fontWeight: FontWeight.w400,
                                color: AppColor
                                    .blackcolor[globalController.dark.value]!),
                          ),
                          Text(
                            globalController.cartlist.value[1]['prise'],
                            style: TextStyle(
                                fontSize: boxConstraints.maxWidth >= AppText.tab
                                    ? 28
                                    : 18,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primaryColor),
                          ),
                          que(boxConstraints)
                        ],
                      ),
                      Expanded(child: Container()),
                      Center(
                        child: InkWell(
                          child: Icon(
                            Icons.delete_outline,
                            size: boxConstraints.maxWidth >= AppText.tab
                                ? 35
                                : 23,
                            color: AppColor
                                .blackcolor[globalController.dark.value]!,
                          ),
                          onTap: () {
                            bootomsheet(boxConstraints);
                          },
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 80,
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(70)),
                        child: Center(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: Get.height / 50),
                            child: Text(
                              AppText.cancel[globalController.language.value]!,
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize:
                                      boxConstraints.maxWidth >= AppText.tab
                                          ? 22
                                          : 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(70)),
                      child: Center(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: Get.height / 50),
                          child: Text(
                            AppText.remove[globalController.language.value]!,
                            style: TextStyle(
                                color: AppColor
                                    .whitecolor[globalController.dark.value]!,
                                fontSize: boxConstraints.maxWidth >= AppText.tab
                                    ? 22
                                    : 14),
                          ),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }

  Widget que(BoxConstraints boxConstraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: Get.width / 4.5,
          decoration: BoxDecoration(
              color: AppColor.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(60)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: boxConstraints.maxWidth >= AppText.tab ? 10 : 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      globalController.removeque();
                    },
                    child: Icon(
                      Icons.remove,
                      color: AppColor.primaryColor,
                      size: boxConstraints.maxWidth >= AppText.tab ? 30 : 23,
                    )),
                // const SizedBox(width: 10),
                Obx(
                  () => Text(
                    globalController.Quant.value.toString(),
                    style: TextStyle(
                        fontSize:
                            boxConstraints.maxWidth >= AppText.tab ? 20 : 14,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                InkWell(
                    onTap: () {
                      globalController.addquent();
                    },
                    child: Icon(
                      Icons.add,
                      color: AppColor.primaryColor,
                      size: boxConstraints.maxWidth >= AppText.tab ? 30 : 23,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget cartlist(BoxConstraints boxConstraints) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: Get.height / 60),
          itemCount: globalController.cartlist.value.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Obx(() => Padding(
                  padding: EdgeInsets.only(top: Get.height / 60),
                  child: Container(
                    height: Get.height / 5.5,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color:
                            AppColor.whitecolor[globalController.dark.value]!,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  globalController.cartlist.value[index]
                                      ['image'],
                                ),
                              ),
                              color: AppColor
                                  .lightgreyc[globalController.dark.value]!),
                          // height: Get.height / 6,
                          width: Get.width / 3,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              globalController.cartlist.value[index]['name'],
                              style: TextStyle(
                                  fontSize:
                                      boxConstraints.maxWidth >= AppText.tab
                                          ? 28
                                          : 18,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.blackcolor[
                                      globalController.dark.value]!),
                            ),
                            Text(
                              globalController.cartlist.value[index]['prise'],
                              style: TextStyle(
                                  fontSize:
                                      boxConstraints.maxWidth >= AppText.tab
                                          ? 28
                                          : 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.primaryColor),
                            ),
                            que(boxConstraints)
                          ],
                        ),
                        Expanded(child: Container()),
                        Center(
                          child: InkWell(
                            child: Icon(
                              Icons.delete_outline,
                              size: boxConstraints.maxWidth >= AppText.tab
                                  ? 35
                                  : 23,
                              color: AppColor
                                  .blackcolor[globalController.dark.value]!,
                            ),
                            onTap: () {
                              bootomsheet(boxConstraints);
                            },
                          ),
                        ),
                        SizedBox(
                          width: Get.width / 80,
                        )
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }

  Widget bottombar(BoxConstraints boxConstraints) {
    return Container(
      height: Get.height / 8,
      decoration: BoxDecoration(
        color: AppColor.whitecolor[globalController.dark.value]!,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.totalprise[globalController.language.value]!,
                  style: TextStyle(
                      color: AppColor.grey,
                      fontSize:
                          boxConstraints.maxWidth >= AppText.tab ? 28 : 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "\$99",
                  style: TextStyle(
                      color: AppColor.blackcolor[globalController.dark.value]!,
                      fontSize:
                          boxConstraints.maxWidth >= AppText.tab ? 28 : 22,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Get.to(() => CheckOut());
              },
              child: Container(
                height: Get.height / 14,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(80)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color:
                              AppColor.whitecolor[globalController.dark.value]!,
                          size:
                              boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Chek Out",
                          style: TextStyle(
                              color: AppColor
                                  .whitecolor[globalController.dark.value]!,
                              fontSize: boxConstraints.maxWidth >= AppText.tab
                                  ? 26
                                  : 18,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
