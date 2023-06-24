import 'package:adhirat/utils/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/global_cache.dart';
import '../../utils/app_color.dart';

class MyWishList extends StatefulWidget {
  const MyWishList({Key? key}) : super(key: key);

  @override
  State<MyWishList> createState() => _MyWishListState();
}

class _MyWishListState extends State<MyWishList> {
  @override
  final GlobalController globalController = Get.find();

  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints boxConstraints) {
      return Obx(
        () => Scaffold(
          backgroundColor: AppColor.whitecolor[globalController.dark.value]!,
          appBar: AppBar(
            title: Text(
              AppText.wishlist[globalController.language.value]!,
              style: TextStyle(
                  color: AppColor.blackcolor[globalController.dark.value]!,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 30 : 20),
            ),
            centerTitle: true,
            backgroundColor: AppColor.whitecolor[globalController.dark.value]!,
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
                  Icons.search,
                  size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                  color: AppColor.blackcolor[globalController.dark.value]!,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                filter(),
                SizedBox(
                  height: 20,
                ),
                gridview(boxConstraints)
              ],
            ),
          ),
        ),
      );
    });
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

  Widget gridview(BoxConstraints boxConstraints) {
    return GetBuilder(
        init: GlobalController(),
        builder: (globalController) => GridView.builder(
              padding: EdgeInsets.only(right: Get.width / 30),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 11,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: boxConstraints.maxWidth >= AppText.tab ? 3 : 2,
                crossAxisSpacing: 0,
                childAspectRatio:
                    boxConstraints.maxWidth >= AppText.tab ? 1 / 1.4 : 1 / 1.6,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(left: Get.width / 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColor.grey.withOpacity(0.15),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTxPMlH3qiiFFX8BqQLz40-IrMTdV2rMaJLw7WFsPnNfNiBvXF0"))),
                        height: boxConstraints.maxWidth >= AppText.tab
                            ? Get.height / 4.4
                            : Get.height / 4,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.favorite,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
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
                                .blackcolor[globalController.dark.value]!,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: AppColor.primaryColor,
                            size: boxConstraints.maxWidth >= AppText.tab
                                ? 24
                                : 20,
                          ),
                          Text(
                            "4.8 | ",
                            style: TextStyle(
                                fontSize: boxConstraints.maxWidth >= AppText.tab
                                    ? 20
                                    : 16,
                                color: AppColor
                                    .blackcolor[globalController.dark.value]!,
                                fontWeight: FontWeight.w500),
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
                                          ? 14
                                          : 10,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
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
                    ],
                  ),
                );
              },
            ));
  }
}
