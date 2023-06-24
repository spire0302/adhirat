import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/estore/itemdetails.dart';
import 'package:adhirat/modules/estore/searchpage.dart';
import 'package:adhirat/modules/estore/wishlist.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import 'cartpage.dart';

class EshopHomePage extends StatefulWidget {
  const EshopHomePage({Key? key}) : super(key: key);

  @override
  State<EshopHomePage> createState() => _EshopHomePageState();
}

class _EshopHomePageState extends State<EshopHomePage> {
  @override
  final GlobalController globalController = Get.find();

  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints boxConstraints) {
      return Obx(() => Scaffold(
            backgroundColor: AppColor.whitecolor[globalController.dark.value]!,
            appBar: AppBar(
              title: Text(
                AppText.estore[globalController.language.value]!,
                style: TextStyle(
                    color: AppColor.blackcolor[globalController.dark.value]!,
                    fontSize: boxConstraints.maxWidth >= AppText.tab ? 30 : 20),
              ),
              centerTitle: true,
              backgroundColor:
                  AppColor.whitecolor[globalController.dark.value]!,
              elevation: 0,
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
              actions: [
                IconButton(
                  onPressed: () {
                    Get.to(() => const MyWishList());
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                    color: AppColor.blackcolor[globalController.dark.value]!,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.to(() => CartPage());
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                      color: AppColor.blackcolor[globalController.dark.value]!,
                    ))
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => SearchPage(),
                            transition: Transition.downToUp);
                      },
                      child: eshoptextfeild(
                          boxConstraints: boxConstraints,
                          globalController: globalController,
                          hintText:
                              AppText.search[globalController.language.value]!,
                          icon: true,
                          readOnly: true,
                          fillColor: AppColor
                              .lightgreyc[globalController.dark.value]!),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  specialofferlable(boxConstraints),
                  const SizedBox(
                    height: 20,
                  ),
                  offerlist(boxConstraints),
                  const SizedBox(
                    height: 20,
                  ),
                  populerlable(boxConstraints),
                  const SizedBox(
                    height: 20,
                  ),
                  filter(),
                  const SizedBox(
                    height: 20,
                  ),
                  offerlist(boxConstraints),
                ],
              ),
            ),
          ));
    });
  }

  Widget specialofferlable(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppText.specialoffer[globalController.language.value]!,
            style: TextStyle(
                fontSize: boxConstraints.maxWidth >= AppText.tab ? 25 : 16,
                fontWeight: FontWeight.w600,
                color: AppColor.blackcolor[globalController.dark.value]!),
          ),
          Text(
            AppText.viewall[globalController.language.value]!,
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: boxConstraints.maxWidth >= AppText.tab ? 25 : 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget populerlable(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppText.mostpop[globalController.language.value]!,
            style: TextStyle(
                fontSize: boxConstraints.maxWidth >= AppText.tab ? 25 : 16,
                fontWeight: FontWeight.w600,
                color: AppColor.blackcolor[globalController.dark.value]!),
          ),
          Text(
            AppText.viewall[globalController.language.value]!,
            style: TextStyle(
                fontSize: boxConstraints.maxWidth >= AppText.tab ? 25 : 16,
                color: AppColor.primaryColor),
          ),
        ],
      ),
    );
  }

  Widget offerlist(BoxConstraints boxConstraints) {
    return Container(
        color: Colors.transparent,
        height: boxConstraints.maxWidth >= AppText.tab
            ? Get.height / 3
            : Get.height / 2.5,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: 10,
          padding: EdgeInsets.only(right: Get.width / 30),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: Get.width / 30),
              child: Container(
                width: boxConstraints.maxWidth >= AppText.tab
                    ? Get.width / 3
                    : Get.width / 2,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => Detalils());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColor
                                .lightgreyc[globalController.dark.value]!,
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTxPMlH3qiiFFX8BqQLz40-IrMTdV2rMaJLw7WFsPnNfNiBvXF0"))),
                        height: boxConstraints.maxWidth >= AppText.tab
                            ? Get.height / 4.5
                            : Get.height / 4,
                        width: boxConstraints.maxWidth >= AppText.tab
                            ? Get.width / 3
                            : Get.width / 1.2,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.favorite_border,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: Get.width / 1.8,
                        child: Text(
                          "Prayer Plant",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: boxConstraints.maxWidth >= AppText.tab
                                  ? 24
                                  : 20,
                              fontWeight: FontWeight.w500,
                              color: AppColor
                                  .blackcolor[globalController.dark.value]!),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: AppColor.primaryColor,
                            size: boxConstraints.maxWidth >= 800 ? 25 : 20,
                          ),
                          Text(
                            "4.8 | ",
                            style: TextStyle(
                                fontSize: boxConstraints.maxWidth >= AppText.tab
                                    ? 22
                                    : 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor
                                    .blackcolor[globalController.dark.value]!),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColor.primaryColor),
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                              child: Text(
                                "4.268 sold",
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize:
                                      boxConstraints.maxWidth >= AppText.tab
                                          ? 20
                                          : 10,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: Get.width / 1.8,
                        child: Text(
                          "\$ 24",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: boxConstraints.maxWidth >= AppText.tab
                                  ? 24
                                  : 20,
                              fontWeight: FontWeight.w600,
                              color: AppColor.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget filter() {
    return Container(
        color: Colors.transparent,
        height: Get.height / 24,
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView.builder(
            itemCount: globalController.filterlist.value.length,
            padding: EdgeInsets.only(right: Get.width / 30),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Obx(() => Padding(
                    padding: EdgeInsets.only(left: Get.width / 30),
                    child: InkWell(
                      onTap: () {
                        globalController.selectfilter.value = index;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: globalController.selectfilter.value == index
                                ? AppColor.primaryColor
                                : AppColor
                                    .whitecolor[globalController.dark.value]!,
                            border: Border.all(color: AppColor.primaryColor),
                            borderRadius: BorderRadius.circular(70)),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Center(
                          child: Text(
                            globalController.filterlist.value[index],
                            style: TextStyle(
                                color:
                                    globalController.selectfilter.value == index
                                        ? AppColor.whitecolor[
                                            globalController.dark.value]!
                                        : AppColor.primaryColor,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ));
            },
          ),
        ));
  }
}

Widget eshoptextfeild(
    {TextEditingController? controller,
    int maxLines = 1,
    required BoxConstraints boxConstraints,
    required GlobalController globalController,
    bool enabled = false,
    bool prifix = false,
    required bool icon,
    Color? bordrcolor,
    bool readOnly = false,
    required String hintText,
    Color? fillColor}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: TextFormField(
      controller: controller,
      maxLines: maxLines,
      enabled: enabled,
      readOnly: readOnly,
      style: TextStyle(
          color: AppColor.blackcolor[globalController.dark.value]!,
          fontSize: boxConstraints.maxWidth >= AppText.tab ? 28 : 16),
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: AppColor.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: AppColor.whitecolor[globalController.dark.value]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: AppColor.primaryColor, width: 1),
        ),
        filled: true,
        fillColor: fillColor,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        enabled: true,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: AppColor.whitecolor[globalController.dark.value]!,
          ),
        ),
        suffixIcon: icon == true
            ? const Icon(Icons.filter_alt, color: Colors.green)
            : null,
        prefixIcon: prifix == true
            ? const Icon(Icons.search, color: Colors.green)
            : null,
        hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: boxConstraints.maxWidth >= AppText.tab ? 28 : 16),
        isDense: false,
        focusColor: Colors.blue,
        hoverColor: Colors.grey,
        labelStyle: TextStyle(
            color: AppColor.blackcolor[globalController.dark.value]!,
            fontSize: boxConstraints.maxWidth >= AppText.tab ? 28 : 16),
        alignLabelWithHint: false,
        counter: const Offstage(),
      ),
    ),
  );
}
