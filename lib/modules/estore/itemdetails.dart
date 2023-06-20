import 'package:adhirat/controller/global_cache.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import '../../utils/app_text.dart';

class Detalils extends StatelessWidget {
  List imgList = [
    "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQ7SxbvoHHFdOe-joXZyqLEvsCM-8iJWO6roKVIJ1HqTXhMA9dm",
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRyIwFSgz1d7LaHx57crTJyajv1p6V9EJOHfM1yarvQC_8UB2Rg",
    "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQ7SxbvoHHFdOe-joXZyqLEvsCM-8iJWO6roKVIJ1HqTXhMA9dm",
  ];
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Obx(() => Scaffold(
            bottomNavigationBar: bottombar(boxConstraints),
            backgroundColor: AppColor.whitecolor[globalController.dark.value]!,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height / 2.2,
                    color: AppColor.grey.withOpacity(0.2),
                    child: Stack(
                      children: [
                        imageSlider(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: dorIndicator(),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: backbutton(boxConstraints),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  titel(boxConstraints),
                  const SizedBox(height: 5),
                  rate(boxConstraints),
                  const SizedBox(height: 5),
                  Divider(
                    indent: Get.width / 30,
                    endIndent: Get.width / 30,
                  ),
                  des(boxConstraints),
                  const SizedBox(height: 5),
                  descrips(boxConstraints),
                  const SizedBox(height: 10),
                  que(boxConstraints)
                ],
              ),
            ),
          ));
    });
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
            Container(
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
                        size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Add to Cart",
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
            )
          ],
        ),
      ),
    );
  }

  Widget que(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: Row(
        children: [
          Text(
            AppText.que[globalController.language.value]!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: boxConstraints.maxWidth >= AppText.tab ? 24 : 18,
                fontWeight: FontWeight.w500,
                color: AppColor.blackcolor[globalController.dark.value]!),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColor.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(60)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        globalController.removeque();
                      },
                      child: Icon(
                        Icons.remove,
                        color: AppColor.primaryColor,
                        size: boxConstraints.maxWidth >= AppText.tab ? 30 : 26,
                      )),
                  const SizedBox(width: 12),
                  Obx(
                    () => Text(
                      globalController.Quant.value.toString(),
                      style: TextStyle(
                          fontSize:
                              boxConstraints.maxWidth >= AppText.tab ? 22 : 16,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(
                      onTap: () {
                        globalController.addquent();
                      },
                      child: Icon(
                        Icons.add,
                        color: AppColor.primaryColor,
                        size: boxConstraints.maxWidth >= AppText.tab ? 30 : 26,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget des(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: Text(
        AppText.des[globalController.language.value]!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 18,
            fontWeight: FontWeight.w500,
            color: AppColor.blackcolor[globalController.dark.value]!),
      ),
    );
  }

  Widget descrips(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
          style: TextStyle(
              fontSize: boxConstraints.maxWidth >= AppText.tab ? 18 : 12,
              color: AppColor.grey),
        ),
      ),
    );
  }

  Widget titel(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: Row(
        children: [
          SizedBox(
            width: Get.width / 1.5,
            child: Text(
              "Rubber Fig Plant",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 28 : 22,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackcolor[globalController.dark.value]!),
            ),
          ),
          const Spacer(),
          Icon(
            Icons.favorite_border,
            color: AppColor.primaryColor,
          )
        ],
      ),
    );
  }

  Widget rate(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.primaryColor.withOpacity(0.2)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                child: Text(
                  "3,231 Sold",
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize:
                          boxConstraints.maxWidth >= AppText.tab ? 16 : 10),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(
            Icons.star_rate_rounded,
            color: AppColor.primaryColor,
            size: boxConstraints.maxWidth >= AppText.tab ? 24 : 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "4.6(5,645 reviews)",
            style: TextStyle(
                fontSize: boxConstraints.maxWidth >= AppText.tab ? 18 : 14),
          ),
        ],
      ),
    );
  }

  Widget imageSlider() {
    return CarouselSlider.builder(
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Image.network(
        imgList[itemIndex],
        width: Get.width,
        fit: BoxFit.cover,
      ),
      options: CarouselOptions(
        reverse: false,
        autoPlay: false,
        height: Get.height / 2.2,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false,
        initialPage: 0,
        enableInfiniteScroll: true,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          globalController.onchangeImage(index);
        },
      ),
    );
  }

  Widget dorIndicator() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          imgList.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 5, bottom: 10),
            child: Container(
              height: 8,
              width: globalController.currentImg.value == index ? 20 : 10,
              decoration: BoxDecoration(
                color: globalController.currentImg.value == index
                    ? AppColor.primaryColor
                    : AppColor.whitecolor[globalController.dark.value]!,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget backbutton(BoxConstraints boxConstraints) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back,
            size: boxConstraints.maxWidth >= AppText.tab ? 40 : 30),
      ),
    );
  }
}
