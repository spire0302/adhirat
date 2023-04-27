import 'package:adhirat/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:adhirat/widgets/custom_appbar.dart';

import '../../../utils/app_color.dart';

class AlbumScreen extends StatelessWidget {
  AlbumScreen({super.key});
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CustomAppBar(
        size: size,
        showLeading: false,
        title: AppText.album[globalController.language.value]!.toUpperCase(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.025),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              recentlyViewedAlbum(size),
              SizedBox(height: size.height * 0.04),
              categoryLableText(size),
              SizedBox(height: size.height * 0.026),
              categoryListTabBar(size),
              SizedBox(height: size.height * 0.034),
              recentlyAddedLableText(size),
              recentlyAddedAlbumListWidget(size)
            ],
          ),
        ),
      ),
    );
  }

  ListView recentlyAddedAlbumListWidget(Size size) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
          left: size.height * 0.02,
          right: size.height * 0.02,
          top: size.height * 0.034),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.02),
          child: Row(
            children: [
              Material(
                elevation: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(AppImages.book,
                      height: size.height * 0.19,
                      width: size.width * 0.25,
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(width: size.width * 0.023),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ramayana',
                      style: TextStyle(
                          color: AppColor.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.54,
                          fontSize: size.height * 0.022),
                    ),
                    SizedBox(height: size.height * 0.003),
                    Text(
                      'Rishi Valmiki',
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.54,
                          fontSize: size.height * 0.017),
                    ),
                    SizedBox(height: size.height * 0.005),
                    Text(
                      'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE.',
                      maxLines: 4,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColor.black.withOpacity(0.4),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.54,
                          fontSize: size.height * 0.014),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget recentlyAddedLableText(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Text(
        AppText.recentlyadded[globalController.language.value]!,
        style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.54,
            fontSize: size.height * 0.024),
      ),
    );
  }

  Widget categoryListTabBar(Size size) {
    return SizedBox(
      height: size.height * 0.035,
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: EdgeInsets.only(left: size.height * 0.02),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, catIndex) {
          return Obx(
            () => GestureDetector(
              onTap: () {
                globalController.selectCategoryFun(catIndex);
              },
              child: Container(
                margin: EdgeInsets.only(right: size.height * 0.015),
                padding: EdgeInsets.symmetric(
                    horizontal: size.height * 0.014,
                    vertical: size.height * 0.007),
                decoration: BoxDecoration(
                    color: globalController.selectedCategory.value == catIndex
                        ? AppColor.white
                        : AppColor.primaryColor,
                    border: Border.all(
                        color:
                            globalController.selectedCategory.value == catIndex
                                ? AppColor.primaryColor
                                : Colors.transparent),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Ramayana',
                  style: TextStyle(
                      color: globalController.selectedCategory.value == catIndex
                          ? AppColor.primaryColor
                          : AppColor.white,
                      fontWeight: FontWeight.w400,
                      fontSize: size.height * 0.017),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget categoryLableText(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Text(
        AppText.categories[globalController.language.value]!,
        style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.54,
            fontSize: size.height * 0.024),
      ),
    );
  }

  Widget recentlyViewedAlbum(Size size) {
    return SizedBox(
      height: size.height * 0.24,
      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.only(left: size.width * 0.05),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: size.width * 0.05),
            child: Material(
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(AppImages.book,
                    height: size.height * 0.24,
                    width: size.width / 3,
                    fit: BoxFit.fill),
              ),
            ),
          );
        },
      ),
    );
  }
}
