import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/quiz_module/page/collection.dart';
import 'package:adhirat/modules/quiz_module/page/quizdetails.dart';
import 'package:adhirat/modules/quiz_module/page/quizlist.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({Key? key}) : super(key: key);

  @override
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Obx(
        () => Scaffold(
          backgroundColor: AppColor.lightgreyc[globalController.dark.value]!,
          appBar: AppBar(
            backgroundColor: AppColor.lightgreyc[globalController.dark.value]!,
            centerTitle: true,
            title: Text(
              AppText.Quiz[globalController.language.value]!,
              style: TextStyle(
                  color: AppColor.blackcolor[globalController.dark.value]!,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 30 : 20),
            ),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                size: boxConstraints.maxWidth >= AppText.tab ? 35 : 20,
                color: AppColor.blackcolor[globalController.dark.value]!,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 60,
                ),
                card(boxConstraints),
                const SizedBox(
                  height: 15,
                ),
                quizelable(size, false, boxConstraints),
                const SizedBox(
                  height: 15,
                ),
                categoryListTabBar(size, boxConstraints),
                category(size, false),
                const SizedBox(
                  height: 15,
                ),
                quizeklist(size, boxConstraints),
                const SizedBox(
                  height: 5,
                ),
                topauther(size, false),
                const SizedBox(
                  height: 15,
                ),
                Authorlosty(size, boxConstraints),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget card(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: Container(
        height: Get.height / 4.2,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [const Color(0xffe3b798), AppColor.primaryColor],
                begin: Alignment.topLeft,
                tileMode: TileMode.mirror,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10),
            color: AppColor.primaryColor),
        child: Row(
          children: [
            // Transform(
            //   transform: Matrix4.identity()..rotateZ(35 * 3.1415927 / 180),
            RotatedBox(
              quarterTurns: boxConstraints.maxWidth >= AppText.tab ? 0 : 1,
              child: Image.asset(
                "assets/images/3dquiz.png",
                width: Get.width / 2.2,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Together with a friend,",
                  style: TextStyle(
                      color: AppColor.whitecolor[globalController.dark.value]!,
                      fontSize:
                          boxConstraints.maxWidth >= AppText.tab ? 28 : 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  AppText.tecjnow[globalController.language.value]!,
                  style: TextStyle(
                      color: AppColor.whitecolor[globalController.dark.value]!,
                      fontSize:
                          boxConstraints.maxWidth >= AppText.tab ? 28 : 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: boxConstraints.maxWidth >= AppText.tab ? 28 : 5,
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                        () => QuizDetails(globalController: globalController));
                  },
                  child: Container(
                    width: Get.width / 4,
                    decoration: BoxDecoration(
                        color:
                            AppColor.whitecolor[globalController.dark.value]!,
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppText.teckwquiz[globalController.language.value]!,
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: boxConstraints.maxWidth >= AppText.tab
                                  ? 22
                                  : 16),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryListTabBar(Size size, BoxConstraints boxConstraints) {
    return Container(
      color: Colors.transparent,
      height: Get.height / 5,
      child: ListView.builder(
        itemCount: globalController.bookList.length > 3
            ? 3
            : globalController.bookList.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(right: Get.width / 30),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, catIndex) {
          return Obx(
            () => GestureDetector(
                onTap: () {
                  Get.to(() => QuizDetails(globalController: globalController));
                },
                child: Padding(
                  padding: EdgeInsets.only(left: Get.width / 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Get.height / 7,
                        width: boxConstraints.maxWidth >= AppText.tab
                            ? Get.width / 2.4
                            : Get.width / 1.8,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                              boxConstraints.maxWidth >= AppText.tab ? 10 : 5),
                          image: DecorationImage(
                              image: NetworkImage(
                                globalController.bookList[catIndex].image ?? "",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        'Both Biology and service',
                        style: TextStyle(
                            color: globalController.selectedCategory.value ==
                                    catIndex
                                ? AppColor.primaryColor
                                : AppColor
                                    .blackcolor[globalController.dark.value]!
                                    .withOpacity(0.6),
                            fontWeight:
                                globalController.selectedCategory.value ==
                                        catIndex
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                            fontSize: boxConstraints.maxWidth >= AppText.tab
                                ? 20
                                : size.height * 0.015),
                      ),
                      Text(
                        '20 quiestion',
                        style: TextStyle(
                            color: globalController.selectedCategory.value ==
                                    catIndex
                                ? AppColor.primaryColor
                                : AppColor
                                    .blackcolor[globalController.dark.value]!
                                    .withOpacity(0.6),
                            fontWeight:
                                globalController.selectedCategory.value ==
                                        catIndex
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                            fontSize: boxConstraints.maxWidth >= AppText.tab
                                ? 18
                                : size.height * 0.015),
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }

  Widget quizeklist(Size size, BoxConstraints boxConstraints) {
    return Container(
      color: Colors.transparent,
      height: Get.height / 5.2,
      child: ListView.builder(
        itemCount: globalController.bookList.length > 3
            ? 3
            : globalController.bookList.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(right: Get.width / 30),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, catIndex) {
          return GestureDetector(
              onTap: () {
                Get.to(() => Quizelist(globalController: globalController));
              },
              child: Padding(
                padding: EdgeInsets.only(left: Get.width / 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.height / 7,
                      width: boxConstraints.maxWidth >= AppText.tab
                          ? Get.width / 2.4
                          : Get.width / 1.8,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(
                            boxConstraints.maxWidth >= AppText.tab ? 10 : 5),
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://img.freepik.com/premium-photo/shrug-gesture-so-what-clueless-man-raising-shoulders-smiling-isolated-orange-wall_201836-8245.jpg?w=2000",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'Education',
                      style: TextStyle(
                          color: AppColor
                              .blackcolor[globalController.dark.value]!
                              .withOpacity(0.6),
                          fontWeight: FontWeight.w600,
                          fontSize:
                              boxConstraints.maxWidth >= AppText.tab ? 20 : 14),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }

  Widget quizelable(Size size, bool landscape, BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Row(
        children: [
          Text(
            AppText.Quiz[globalController.language.value]!,
            style: TextStyle(
                color: AppColor.blackcolor[globalController.dark.value]!,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.54,
                fontSize: size.height * 0.024),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Get.to(() => Quizelist(
                    globalController: globalController,
                  ));
            },
            child: Text(
              AppText.viewall[globalController.language.value]!,
              style: TextStyle(
                  color: AppColor.red,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.54,
                  fontSize: size.height * 0.020),
            ),
          ),
        ],
      ),
    );
  }

  Widget category(Size size, bool landscape) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Row(
        children: [
          Text(
            AppText.categories[globalController.language.value]!,
            style: TextStyle(
                color: AppColor.blackcolor[globalController.dark.value]!,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.54,
                fontSize: size.height * 0.024),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Get.to(() => QuizeCategory());
            },
            child: Text(
              AppText.viewall[globalController.language.value]!,
              style: TextStyle(
                  color: AppColor.red,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.54,
                  fontSize: size.height * 0.020),
            ),
          ),
        ],
      ),
    );
  }

  Widget topauther(Size size, bool landscape) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Row(
        children: [
          Text(
            AppText.topauthor[globalController.language.value]!,
            style: TextStyle(
                color: AppColor.blackcolor[globalController.dark.value]!,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.54,
                fontSize: size.height * 0.024),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Text(
              AppText.viewall[globalController.language.value]!,
              style: TextStyle(
                  color: AppColor.red,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.54,
                  fontSize: size.height * 0.020),
            ),
          ),
        ],
      ),
    );
  }

  Widget Authorlosty(Size size, BoxConstraints boxConstraints) {
    return Container(
      color: Colors.transparent,
      height: Get.height / 8,
      child: ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        padding: EdgeInsets.only(right: Get.width / 30),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, catIndex) {
          return GestureDetector(
              onTap: () {
                // Get.to(() => Bookcategory(globalController: globalController));
                globalController.selectCategoryFun(catIndex);
              },
              child: Padding(
                padding: EdgeInsets.only(left: Get.width / 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: Get.height / 12,
                      width: boxConstraints.maxWidth >= AppText.tab
                          ? Get.width / 7
                          : Get.width / 5.5,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(catIndex.isOdd ? 70 : 0),
                          topRight: Radius.circular(catIndex.isOdd ? 70 : 0),
                          bottomRight: Radius.circular(catIndex.isOdd ? 0 : 70),
                          bottomLeft: Radius.circular(catIndex.isOdd ? 0 : 70),
                        ),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'Allen',
                      style: TextStyle(
                          color:
                              AppColor.blackcolor[globalController.dark.value]!,
                          fontWeight: FontWeight.w500,
                          fontSize:
                              boxConstraints.maxWidth >= AppText.tab ? 20 : 16),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
