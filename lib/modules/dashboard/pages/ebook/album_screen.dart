import 'dart:ui';
import 'package:adhirat/modules/album_module/controller.dart';
import 'package:adhirat/modules/album_module/pages/book_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:adhirat/utils/app_text.dart';
import '../../../../../../utils/app_color.dart';
import '../../../album_module/pages/custom_bookpopup.dart';
import '../../../album_module/pages/book_category.dart';
import '../../../image_module/controller/image_controller.dart';
import '../../../image_module/widgets/image_category.dart';

class AlbumScreen extends StatelessWidget {
  AlbumScreen({super.key, required this.landscape});

  final GlobalController globalController = Get.find();
  final albumcontroller albumconto = Get.put(albumcontroller());
  final ImageController imageController = Get.put(ImageController());
  final bool landscape;
  RxInt categorySelect = 0.obs;
  final List imgList = [
    AppImages.book3,
    AppImages.book1,
    AppImages.book2,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        if (boxConstraints.maxWidth >= AppText.web) {
          return Obx(() => Scaffold(
                backgroundColor:
                    AppColor.whitecolor[globalController.dark.value]!,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Webadhiratlable(),
                      SizedBox(
                        height: Get.height / 30,
                      ),
                      webtitile(),
                      SizedBox(
                        height: Get.height / 30,
                      ),
                      readlist(),
                      SizedBox(
                        height: Get.height / 25,
                      ),
                      newrealeslable(),
                      SizedBox(
                        height: Get.height / 30,
                      ),
                      newrealeselist(),
                      SizedBox(
                        height: Get.height / 30,
                      ),
                    ],
                  ),
                ),
              ));
        } else {
          return Obx(() => Scaffold(
              backgroundColor:
                  AppColor.whitecolor[globalController.dark.value]!,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Obx(
                  //           () => InkWell(
                  //             onTap: () {
                  //               globalController.dark.value = false;
                  //             },
                  //             child: Text(
                  //               AppText
                  //                   .Adhirat[globalController.language.value]!,
                  //               style: TextStyle(
                  //                   color: AppColor.blackcolor[
                  //                       globalController.dark.value],
                  //                   fontSize:
                  //                       boxConstraints.maxWidth >= AppText.tab
                  //                           ? 30
                  //                           : size.width * 0.06,
                  //                   letterSpacing: 2,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //           ),
                  //         ),
                  //         GestureDetector(
                  //           onTap: () {},
                  //           child: CircleAvatar(
                  //             radius: boxConstraints.maxWidth >= AppText.tab
                  //                 ? 35
                  //                 : 25,
                  //             backgroundImage:
                  //                 const AssetImage(AppImages.profile),
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
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width * 0.05,
                      bottom: size.height * 0.03,
                    ),
                    child: Text(
                      "Choose Category",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              AppColor.blackcolor[globalController.dark.value],
                          fontSize: size.width * 0.048),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: imageController.imgList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int i) {
                        return Obx(
                          () => SelectImageCategory(
                              text: imageController.imgList[i].postTitle,
                              boxConstraints: boxConstraints,
                              onTap: () {
                                categorySelect.value = i;
                              },
                              color: categorySelect.value == i
                                  ? Colors.white
                                  : Colors.black,
                              backColor: categorySelect.value == i
                                  ? AppColor.primaryColor.withOpacity(1)
                                  : AppColor.grey.withOpacity(0.2),
                              size: size),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.01),
                          GridView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 20,
                            itemBuilder: (context, int i) {
                              return InkWell(
                                onTap: () {
                                  Get.to(BookList(
                                    globalController: globalController,
                                  ));
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.012),
                                  height: size.height * 0.15,
                                  width: size.width * 0.21,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/demobook.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: size.height * 0.15,
                                    crossAxisSpacing: size.width * 0.02,
                                    mainAxisSpacing: size.height * 0.03,
                                    crossAxisCount: 4),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )));
        }
      }),
    );
  }

  /// -- web widgets ----

  Widget tabBarListWidget(Size size, ImageController imageController,
      BoxConstraints boxConstraints) {
    return SizedBox(
      height: Get.height / 25,
      child: ListView.builder(
        itemCount: imageController.tabBarList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => SelectImageCategory(
          boxConstraints: boxConstraints,
          size: size,
          text: imageController.tabBarList[index],
          color: imageController.selectedImageCat.value == index
              ? AppColor.primaryColor
              : AppColor.blackcolor[globalController.dark.value]!,
          backColor: imageController.selectedImageCat.value == index
              ? AppColor.primaryColor.withOpacity(0.2)
              : AppColor.whitecolor[globalController.dark.value]!,
          border: Border.all(
              color: imageController.selectedImageCat.value == index
                  ? AppColor.primaryColor
                  : Colors.transparent),
          onTap: () {
            imageController.selectImgCatFun(index);
          },
        ),
      ),
    );
  }

  Widget webtitile() {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 50, left: 25),
      child: Text(
        AppText.bookyou[globalController.language.value]!,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.blackcolor[globalController.dark.value]!),
      ),
    );
  }

  Widget readlist() {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(left: 25),
          child: InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Get.to(BookList(
                globalController: globalController,
              ));
            },
            child: Stack(children: [
              Container(
                height: 190,
                width: 380,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 140,
                      width: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppImages.loginImg),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 1,
                child: Container(
                  height: 140,
                  width: 380,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.5)),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                top: 5,
                child: Container(
                  width: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppImages.loginImg),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  width: 200,
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Harry porter and The sorsese stone",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppColor
                                .whitecolor[globalController.dark.value]!,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "145 - book",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppColor
                                .whitecolor[globalController.dark.value]!,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget newrealeselist() {
    return Container(
      height: 200,
      color: Colors.transparent,
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return BookDetailsPopUp(
                          globalController: globalController,
                          autherName: "Ved Vyas",
                          discription:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, w"
                              "hen an unknown printer took a galley of type and scrambled it to make a type specim"
                              "en book. It has survived not only five centuries, but also the leap into electronic typ"
                              "esetting, remaining essentially unchanged. It was popularised in the 1960s with the releas"
                              "e of Letraset sheets containunknown printer took a galley of type and scrambled it to make a type specim"
                              "en book. It has survived not only five centuries, but also the leap into electronic typ"
                              "esetting, remaining essentially unchanged. It was popularised in the 1960s with the releas"
                              "e of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishin"
                              "g software like Aldus PageMaker including versions of Lorem Ipsum.",
                          bookImg: AppImages.loginImg,
                          bookName: "The Book of Maha Bharat",
                          date: "12-05-2022",
                          rating: 5,
                          pdfUrl: '',
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 200,
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(AppImages.loginImg),
                            fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          "Harry porter and The sorsese stone",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColor
                                  .blackcolor[globalController.dark.value]!,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          "- By Ved vyas",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Spacer(),
                      Text(
                        "145 - Chpters",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppColor
                                .blackcolor[globalController.dark.value]!,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget Webadhiratlable() {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 50, left: 25),
      child: Text(
        AppText.Adhirat[globalController.language.value]!,
        style: TextStyle(
          fontSize: 30,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }

  Widget newrealeslable() {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 50, left: 25),
      child: Text(
        AppText.newRelease[globalController.language.value]!,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.blackcolor[globalController.dark.value]!),
      ),
    );
  }

  /// ----- App Wdgets

  Widget resentbook() {
    return SizedBox(
      height: Get.height / 5,
      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.only(right: Get.width / 30),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: Get.width / 30),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white),
                image: const DecorationImage(
                  image: ExactAssetImage(AppImages.loginImg),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget categoryListTabBar(
      Size size, bool landscape, BoxConstraints boxConstraints) {
    return SizedBox(
      height: Get.height / 4,
      child: ListView.builder(
        itemCount: globalController.bookList.length > 6
            ? 6
            : globalController.bookList.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(right: Get.width / 30),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, catIndex) {
          return Obx(
            () => GestureDetector(
                onTap: () {
                  globalController.selectCategoryFun(catIndex);
                  Get.to(() => BookList(globalController: globalController));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: Get.width / 30),
                      child: Container(
                        height: Get.height / 5,
                        width: Get.width / 4,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: NetworkImage(
                                globalController.bookList[catIndex].image ?? "",
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'Ramayana',
                      style: TextStyle(
                          color: globalController.selectedCategory.value ==
                                  catIndex
                              ? AppColor.primaryColor
                              : AppColor
                                  .blackcolor[globalController.dark.value]!
                                  .withOpacity(0.6),
                          fontWeight: globalController.selectedCategory.value ==
                                  catIndex
                              ? FontWeight.w600
                              : FontWeight.w400,
                          fontSize:
                              boxConstraints.maxWidth >= AppText.tab ? 22 : 20),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }

  Widget categoryLableText(Size size, bool landscape) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Row(
        children: [
          Text(
            AppText.categories[globalController.language.value]!,
            style: TextStyle(
                color: AppColor.blackcolor[globalController.dark.value]!,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.54,
                fontSize: size.height * 0.024),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Get.to(() => Bookcategory(globalController: globalController));
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
}

class BlurPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..maskFilter = const MaskFilter.blur(
          BlurStyle.inner, 5.0); // Adjust the blur intensity

    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
