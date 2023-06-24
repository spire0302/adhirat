import 'dart:io';
import 'dart:ui';

import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/sadhnacard/sadhnacard.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../utils/app_color.dart';
import '../../../album_module/pages/book_category.dart';
import '../../../cellender/callander.dart';
import '../../../estore/eshophome.dart';
import '../../../quiz_module/page/quiz_screen.dart';
import '../../widgets/custom_drawer.dart';

class HomeWidget extends StatelessWidget {
  final Size size;

  HomeWidget({Key? key, required this.size}) : super(key: key);
  final GlobalController globalController = Get.find();

  final List imgList = [
    AppImages.book3,
    AppImages.book1,
    AppImages.book2,
  ];


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Obx(
        () => Scaffold(
          backgroundColor: AppColor.whitecolor[globalController.dark.value]!,
          body: Column(
            children: [
              SizedBox(
                height: size.height * 0.042,
              ),
              // Container(
              //   height: Get.height / 10,
              //   color: globalController.dark.value
              //       ? AppColor.whitecolor[globalController.dark.value]!
              //       : Colors.white.withOpacity(0.1),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Obx(
              //           () => InkWell(
              //             onTap: () {
              //               globalController.dark.value = false;
              //             },
              //             child: Text(
              //               AppText.Adhirat[globalController.language.value]!,
              //               style: TextStyle(
              //                   color: AppColor
              //                       .blackcolor[globalController.dark.value],
              //                   fontSize: boxConstraints.maxWidth >= AppText.tab
              //                       ? 30
              //                       : size.width * 0.06,
              //                   letterSpacing: 2,
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ),
              //         ),
              //         GestureDetector(
              //           onTap: () {
              //             scaffoldKey.currentState!.openDrawer();
              //           },
              //           child: CircleAvatar(
              //             radius:
              //                 boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
              //             backgroundImage: const AssetImage(AppImages.profile),
              //           ),
              //         ),
              //         // InkWell(
              //         //   onTap: () {
              //         //     globalController.dark.value = true;
              //         //   },
              //         //   child: CircleAvatar(
              //         //     radius: boxConstraints.maxWidth >= AppText.tab
              //         //         ? 35
              //         //         : 25,
              //         //     backgroundColor: AppColor
              //         //         .whitecolor[globalController.dark.value]!
              //         //         .withOpacity(0.3),
              //         //     child: Center(
              //         //       child: Icon(
              //         //         Icons.notifications_none,
              //         //         color: AppColor
              //         //             .whitecolor[globalController.dark.value]!,
              //         //         size: boxConstraints.maxWidth >= AppText.tab
              //         //             ? 35
              //         //             : 25,
              //         //       ),
              //         //     ),
              //         //   ),
              //         // )
              //       ],
              //     ),
              //   ),
              // ),
              Expanded(
                child: Container(
                  width: size.width,
                  height: size.height,
                  color: AppColor.whitecolor[globalController.dark.value]!,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        imageSlider(boxConstraints),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.05,
                            bottom: size.height * 0.015,
                          ),
                          child: Text(
                            "Populer Books",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor
                                    .blackcolor[globalController.dark.value],
                                fontSize: size.width * 0.048),
                          ),
                        ),
                        categoryListTabBar(boxConstraints),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.06,
                              bottom: size.height * 0.015),
                          child: Text(
                            "Features",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor
                                    .blackcolor[globalController.dark.value],
                                fontSize: size.width * 0.048),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Row(
                            children: [
                              FeaturesContainer(
                                  name: AppText.quizzes[
                                      globalController.language.value]!,
                                  image: globalController.dark.value
                                      ? AppImages.darkquizicon
                                      : AppImages.quizicon,
                                  onClick: () {
                                    Get.to(() => QuizScreen());
                                  },
                                  size: size,
                                  globalController: globalController,
                                  boxConstraints: boxConstraints),
                              SizedBox(width: size.width * 0.03),
                              FeaturesContainer(
                                  name: AppText.sadhanaCard[
                                      globalController.language.value]!,
                                  image: globalController.dark.value
                                      ? AppImages.darksadhnavard
                                      : AppImages.sadhnavard,
                                  onClick: () {
                                    Get.to(() => const SadhnaCard());
                                  },
                                  size: size,
                                  globalController: globalController,
                                  boxConstraints: boxConstraints)
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.013),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Row(
                            children: [
                              FeaturesContainer(
                                  name: AppText
                                      .estore[globalController.language.value]!,
                                  image: globalController.dark.value
                                      ? AppImages.darkeshope
                                      : AppImages.eshope,
                                  onClick: () {
                                    Get.to(() => const EshopHomePage());
                                  },
                                  size: size,
                                  globalController: globalController,
                                  boxConstraints: boxConstraints),
                              SizedBox(width: size.width * 0.03),
                              FeaturesContainer(
                                  name: AppText.callender[
                                      globalController.language.value]!,
                                  image: globalController.dark.value
                                      ? AppImages.darkcalemder
                                      : AppImages.calemder,
                                  onClick: () {
                                    Get.to(() => Callender());
                                  },
                                  size: size,
                                  globalController: globalController,
                                  boxConstraints: boxConstraints)
                            ],
                          ),
                        ),
                        // thirdList(boxConstraints),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        boxConstraints.maxWidth >= AppText.tab
                            ? tabshoertcut(boxConstraints)
                            : Shortcut(boxConstraints),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  /// -- --- App widgets --- -

  Widget imageSlider(BoxConstraints boxConstraints) {
    return CarouselSlider.builder(
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
        width: size.width * 1,
        height: size.height * 0.2,
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        decoration: BoxDecoration(
            color: AppColor.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: AppColor.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 15,
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imgList[itemIndex],
              ),
            )),
      ),
      options: CarouselOptions(
        reverse: false,
        autoPlay: true,
        height: boxConstraints.maxWidth >= AppText.tab
            ? size.height * 4.5
            : size.height * 0.2,
        autoPlayInterval: const Duration(seconds: 10),
        autoPlayAnimationDuration: const Duration(seconds: 1),
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

  Widget thirdList(BoxConstraints boxConstraints) {
    return ListView.builder(
      itemCount: 4,
      padding: EdgeInsets.only(right: Get.width / 30),
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            index == 0
                ? Get.to(() => QuizScreen())
                : index == 1
                    ? Get.to(() => const EshopHomePage())
                    : index == 3
                        ? Get.to(() => Callender())
                        : Get.to(() => const SadhnaCard());
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            height: size.height * 0.013,
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            width: boxConstraints.maxWidth >= AppText.tab
                ? Get.width / 4.8
                : Get.width / 3.65,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColor.grey.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 0,
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              color: AppColor.whitecolor[globalController.dark.value],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  height: size.height * 0.08,
                  fit: BoxFit.cover,
                  index == 0
                      ? AppImages.quizicon
                      : index == 1
                          ? AppImages.eshope
                          : index == 2
                              ? AppImages.sadhnavard
                              : AppImages.calemder,
                ),
                // Text(
                //   index == 0
                //       ? AppText.Quiz[globalController.language.value]!
                //       : index == 1
                //           ? AppText.estore[globalController.language.value]!
                //           : index == 2
                //               ? AppText
                //                   .sadhana[globalController.language.value]!
                //               : AppText.callender[
                //                   globalController.language.value]!,
                //   style: TextStyle(
                //     color: AppColor.blackcolor[globalController.dark.value]!,
                //     fontSize:
                //         boxConstraints.maxWidth >= AppText.tab ? 22 : 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget categoryListTabBar(BoxConstraints boxConstraints) {
    return SizedBox(
      height: size.height * 0.18,
      child: ListView.builder(
        itemCount: globalController.bookList.length > 4
            ? 4
            : globalController.bookList.length,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, catIndex) {
          return GestureDetector(
              onTap: () {
                globalController.selectCategoryFun(catIndex);
                Get.to(() => Bookcategory(globalController: globalController));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: size.width * 0.012),
                    height: size.height * 0.15,
                    width: size.width * 0.21,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/demobook.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  // Text(
                  //   AppText.Ramayana[globalController.language.value]!,
                  //   style: TextStyle(
                  //       color: globalController.selectedCategory.value ==
                  //               catIndex
                  //           ? AppColor.primaryColor
                  //           : AppColor
                  //               .blackcolor[globalController.dark.value]!
                  //               .withOpacity(0.6),
                  //       fontWeight: globalController.selectedCategory.value ==
                  //               catIndex
                  //           ? FontWeight.w600
                  //           : FontWeight.w400,
                  //       fontSize:
                  //           boxConstraints.maxWidth >= AppText.tab ? 24 : 18),
                  // ),
                ],
              ));
        },
      ),
    );
  }

  Shortcut(BoxConstraints boxConstraints) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      height: Get.height / 4,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 15,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        color: AppColor.whitecolor[globalController.dark.value]!,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width / 30, vertical: Get.height / 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppText.shortcut[globalController.language.value]!,
              style: TextStyle(
                color: AppColor.blackcolor[globalController.dark.value]!,
                fontSize: boxConstraints.maxWidth >= AppText.tab ? 24 : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Circul(
                  boxConstraints: boxConstraints,
                  data: AppText.Cart[globalController.language.value]!,
                  image: AppImages.cart,
                ),
                Circul(
                    boxConstraints: boxConstraints,
                    data: AppText.Setting[globalController.language.value]!,
                    image: AppImages.setting),
                Circul(
                    boxConstraints: boxConstraints,
                    data:
                        AppText.Notification[globalController.language.value]!,
                    image: AppImages.notification),
                Circul(
                    boxConstraints: boxConstraints,
                    data: AppText.Bookmark[globalController.language.value]!,
                    image: AppImages.bookmark),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Circul(
                    onTap: () {
                      globalController.dark.value =
                          !globalController.dark.value;
                    },
                    boxConstraints: boxConstraints,
                    data: AppText.Cart[globalController.language.value]!,
                    image: AppImages.cart),
                Circul(
                    boxConstraints: boxConstraints,
                    data: AppText.Setting[globalController.language.value]!,
                    image: AppImages.setting),
                Circul(
                    boxConstraints: boxConstraints,
                    data:
                        AppText.Notification[globalController.language.value]!,
                    image: AppImages.notification),
                Circul(
                    boxConstraints: boxConstraints,
                    data: AppText.Bookmark[globalController.language.value]!,
                    image: AppImages.bookmark),
              ],
            ),
          ],
        ),
      ),
    );
  }

  tabshoertcut(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
      child: Container(
        height: Get.height / 6,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.whitecolor[globalController.dark.value]!,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.shortcut[globalController.language.value]!,
                style: TextStyle(
                    color: AppColor.blackcolor[globalController.dark.value]!,
                    fontSize: boxConstraints.maxWidth >= AppText.tab ? 24 : 18),
              ),
              const Spacer(),
              SizedBox(
                height: 100,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Circul(
                      boxConstraints: boxConstraints,
                      data: AppText.Cart[globalController.language.value]!,
                      image: AppImages.cart,
                    ),
                    Circul(
                      boxConstraints: boxConstraints,
                      data: AppText.Setting[globalController.language.value]!,
                      image: AppImages.setting,
                    ),
                    Circul(
                      boxConstraints: boxConstraints,
                      data: AppText
                          .Notification[globalController.language.value]!,
                      image: AppImages.notification,
                    ),
                    Circul(
                      boxConstraints: boxConstraints,
                      data: AppText.Bookmark[globalController.language.value]!,
                      image: AppImages.bookmark,
                    ),
                    Circul(
                      onTap: () {},
                      boxConstraints: boxConstraints,
                      data: AppText.Bookmark[globalController.language.value]!,
                      image: AppImages.cart,
                    ),
                    Circul(
                      boxConstraints: boxConstraints,
                      data: AppText.Bookmark[globalController.language.value]!,
                      image: AppImages.setting,
                    ),
                    Circul(
                      boxConstraints: boxConstraints,
                      data: AppText.Bookmark[globalController.language.value]!,
                      image: AppImages.notification,
                    ),
                    Circul(
                      boxConstraints: boxConstraints,
                      data: AppText.Bookmark[globalController.language.value]!,
                      image: AppImages.bookmark,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Circul(
      {void Function()? onTap,
      required String data,
      required String image,
      required BoxConstraints boxConstraints}) {
    return Container(
      height: Get.height / 11,
      width: boxConstraints.maxWidth >= AppText.tab
          ? Get.width / 6.5
          : Get.width / 5,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(image),
              radius: boxConstraints.maxWidth >= AppText.tab ? 30 : 18,
            ),
          ),
          SizedBox(
            height: boxConstraints.maxWidth >= AppText.tab ? 10 : 5,
          ),
          Text(
            data,
            style: TextStyle(
                fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 13,
                color: AppColor.blackcolor[globalController.dark.value]!),
          )
        ],
      ),
    );
  }
}

class FeaturesContainer extends StatelessWidget {
  final String name;
  final String image;
  final Function onClick;
  final Size size;
  final GlobalController globalController;
  final BoxConstraints boxConstraints;

  const FeaturesContainer(
      {Key? key,
      required this.name,
      required this.image,
      required this.onClick,
      required this.size,
      required this.globalController,
      required this.boxConstraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0,
            horizontal: size.width * 0.02,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColor.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 15,
              ),
            ],
            borderRadius: BorderRadius.circular(17),
            color: AppColor.whitecolor[globalController.dark.value],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: size.width * 0.011),
              Image.asset(
                height: size.height * 0.08,
                fit: BoxFit.cover,
                image,
              ),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColor.blackcolor[globalController.dark.value]!,
                    fontSize: boxConstraints.maxWidth >= AppText.tab
                        ? 22
                        : size.width * 0.042,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
