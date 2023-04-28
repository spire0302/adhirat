import 'package:adhirat/model/book_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:adhirat/utils/route_string.dart';
import 'package:adhirat/widgets/custom_appbar.dart';

import '../../../utils/app_color.dart';

class AlbumScreen extends StatelessWidget {
  AlbumScreen({super.key});
  final GlobalController globalController = Get.find();
  final List imgList = [
    AppImages.book3,
    AppImages.book1,
    AppImages.book2,
  ];
  final List<BookModel> bookList = [
    BookModel(
        id: 1,
        bookName: 'Ramayana',
        authorName: "Rishi Valmiki",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE.',
        image: AppImages.book),
    BookModel(
        id: 2,
        bookName: 'Ramayana',
        authorName: "Rishi Valmiki",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE.',
        image: AppImages.book),
    BookModel(
        id: 3,
        bookName: 'Ramayana',
        authorName: "Rishi Valmiki",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE.',
        image: AppImages.book),
    BookModel(
        id: 4,
        bookName: 'Ramayana',
        authorName: "Rishi Valmiki",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE.',
        image: AppImages.book),
    BookModel(
        id: 5,
        bookName: 'Ramayana',
        authorName: "Rishi Valmiki",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE.',
        image: AppImages.book),
    BookModel(
        id: 6,
        bookName: 'Ramayana',
        authorName: "Rishi Valmiki",
        bookDesc:
            'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE.',
        image: AppImages.book),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      if (boxConstraints.maxWidth >= 480) {
        debugPrint("====> new push");
        return Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.loginImg),
          )),
        );
      } else {
        return Scaffold(
          backgroundColor: AppColor.white,
          appBar: CustomAppBar(
            size: size,
            showLeading: false,
            title:
                AppText.album[globalController.language.value]!.toUpperCase(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.025),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider.builder(
                    itemCount: imgList.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          imgList[itemIndex],
                          fit: BoxFit.fill,
                          width: size.width,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      reverse: false,
                      autoPlay: true,
                      height: size.height * 0.25,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        globalController.onchangeImage(index);
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.014),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          imgList.length,
                          (index) => Padding(
                                padding:
                                    EdgeInsets.only(right: size.width * 0.01),
                                child: Icon(
                                  Icons.circle,
                                  color:
                                      globalController.currentImg.value == index
                                          ? AppColor.primaryColor
                                          : AppColor.grey.withOpacity(0.3),
                                  size: size.height * 0.008,
                                ),
                              )),
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  categoryLableText(size),
                  SizedBox(height: size.height * 0.026),
                  categoryListTabBar(size),
                  SizedBox(height: size.height * 0.034),
                  recentlyAddedLableText(size),
                  recentlyAddedAlbumListWidget(size),
                  SizedBox(height: size.height * 0.04),
                  recentlyViewedAlbum(size),
                ],
              ),
            ),
          ),
        );
      }
    });
  }

  Widget recentlyAddedAlbumListWidget(Size size) {
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
      height: size.height * 0.21,
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
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteString.BOOK_DETAILS);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(AppImages.book,
                      width: size.width / 3.3, fit: BoxFit.fill),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
