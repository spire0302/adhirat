import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:adhirat/utils/route_string.dart';
import 'package:adhirat/widgets/custom_appbar.dart';
import '../model/book_model.dart';
import '../widgets/book_view_box.dart';

class BookDetailscreen extends StatefulWidget {
  final BookModel? bookData;
  final GlobalController globalController;

  BookDetailscreen({Key? key, this.bookData, required this.globalController})
      : super(key: key);

  @override
  State<BookDetailscreen> createState() => _BookDetailscreenState();
}

class _BookDetailscreenState extends State<BookDetailscreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Obx(
        () => Scaffold(
          backgroundColor:
              AppColor.lightgreyc[widget.globalController.dark.value]!,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor:
                AppColor.lightgreyc[widget.globalController.dark.value]!,
            leading: IconButton(
              icon: Icon(Icons.arrow_back,
                  size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                  color:
                      AppColor.blackcolor[widget.globalController.dark.value]!),
              color: AppColor.whitecolor[widget.globalController.dark.value]!,
              onPressed: () {
                Get.back();
              },
            ),
            title: Text(
              "Details",
              style: TextStyle(
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 30 : 20,
                  color:
                      AppColor.blackcolor[widget.globalController.dark.value]!),
            ),
            actions: [
              Obx(() => IconButton(
                  onPressed: () {
                    widget.globalController.likeBookFun();
                  },
                  icon: Icon(
                    widget.globalController.likeBook.isTrue
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: AppColor
                        .blackcolor[widget.globalController.dark.value]!,
                    size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                  )))
            ],
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints boxConstraints) {
              if (boxConstraints.maxWidth >= 1000) {
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
                return GetBuilder(
                    init: GlobalController(),
                    builder: (globalController) {
                      return Stack(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: Get.height / 5),
                                child: Container(
                                  height: size.height / 1.4,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: AppColor.whitecolor[
                                        widget.globalController.dark.value]!,
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(25)),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: Get.height / 7,
                                          left: Get.width / 30,
                                          right: Get.width / 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          bookName(size, globalController,
                                              boxConstraints),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          authorName(size, globalController,
                                              boxConstraints),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          ratinBar(size),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          bookCategories(size, globalController,
                                              boxConstraints),
                                          Container(
                                            color: AppColor.whitecolor[widget
                                                .globalController.dark.value]!,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    width: size.width * 0.07),
                                                Icon(
                                                  Icons.ios_share,
                                                  color: AppColor.blackcolor[
                                                      widget.globalController
                                                          .dark.value]!,
                                                  size: size.height * 0.03,
                                                ),
                                                SizedBox(
                                                    width: size.width * 0.07),
                                                GestureDetector(
                                                  onTap: () {
                                                    widget.globalController
                                                        .addTCollectionFun();
                                                  },
                                                  child: Icon(
                                                    globalController
                                                            .addToCollection
                                                            .isTrue
                                                        ? Icons.bookmark
                                                        : Icons.bookmark_border,
                                                    color: globalController
                                                            .addToCollection
                                                            .isTrue
                                                        ? AppColor.primaryColor
                                                        : AppColor.blackcolor[
                                                            widget
                                                                .globalController
                                                                .dark
                                                                .value]!,
                                                    size: size.height * 0.03,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: size.width * 0.07),
                                                Expanded(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      // OpenFilex.open("http://docs.google.com/viewer?url=http://www.pdf995.com/samples/pdf.pdf");
                                                      Navigator.pushNamed(
                                                          context,
                                                          RouteString
                                                              .READ_BOOK);
                                                    },
                                                    child: Container(
                                                        height: size
                                                                .height *
                                                            0.055,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: size
                                                                        .width *
                                                                    0.02,
                                                                vertical: size
                                                                        .height *
                                                                    0.01),
                                                        decoration: BoxDecoration(
                                                            color: AppColor
                                                                .primaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              AppText.read[widget
                                                                  .globalController
                                                                  .language
                                                                  .value]!,
                                                              style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.043,
                                                                color: AppColor
                                                                        .whitecolor[
                                                                    widget
                                                                        .globalController
                                                                        .dark
                                                                        .value]!,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.02),
                                                            Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color: AppColor
                                                                      .whitecolor[
                                                                  widget
                                                                      .globalController
                                                                      .dark
                                                                      .value]!,
                                                              size:
                                                                  size.height *
                                                                      0.02,
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          bookDetails(size, globalController),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              bookImage(size, context),
                              // likeButton(size),
                            ],
                          ),
                        ],
                      );
                    });
              }
            },
          ),
        ),
      );
    });
  }

  Widget likeButton(Size size) {
    return FractionalTranslation(
      translation: Offset(size.width * 0.022, 8.3),
      child: Obx(
        () => GestureDetector(
          onTap: () {
            widget.globalController.likeBookFun();
          },
          child: CircleAvatar(
            radius: size.height * 0.023,
            backgroundColor: AppColor.primaryColor,
            child: Icon(
              widget.globalController.likeBook.isTrue
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: AppColor.whitecolor[widget.globalController.dark.value]!,
              size: size.height * 0.022,
            ),
          ),
        ),
      ),
    );
  }

  Widget ratinBar(Size size) {
    return RatingBar(
      initialRating: 3,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: size.height * 0.028,
      updateOnDrag: true,
      ratingWidget: RatingWidget(
          full: Icon(
            Icons.star,
            color: AppColor.ambr,
          ),
          half: Icon(
            Icons.star_half,
            color: AppColor.ambr,
          ),
          empty: Icon(
            Icons.star_border,
            color: AppColor.ambr,
          )),
      itemPadding: EdgeInsets.only(right: size.width * 0.008),
      onRatingUpdate: (rating) {},
    );
  }

  Widget bookImage(Size size, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Get.height / 3.5,
            width: Get.width / 2.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: AppColor
                        .whitecolor[widget.globalController.dark.value]!),
                image: const DecorationImage(
                    image: AssetImage(AppImages.book2), fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }

  Widget moreAlbumList(Size size, GlobalController globalController) {
    return ListView.builder(
      itemCount: globalController.bookList.length > 5
          ? 4
          : globalController.bookList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: size.height * 0.023),
      itemBuilder: (context, index) {
        return BookViewBox(
          bookData: globalController.bookList[index],
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailscreen(
                    bookData: globalController.bookList[index],
                    globalController: globalController,
                  ),
                ));
          },
          size: size,
        );
      },
    );
  }

  Widget moreAlbumsHeader(
      Size size, BuildContext context, GlobalController globalController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'More Albums',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: AppColor.blackcolor[globalController.dark.value]!,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.54,
              wordSpacing: 1,
              fontSize: size.height * 0.024),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteString.BOOK_LIST);
          },
          child: Text(
            AppText.viewAll[globalController.language.value]!,
            style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.54,
                fontSize: size.height * 0.015),
          ),
        )
      ],
    );
  }

  Widget bookDetails(Size size, GlobalController globalController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${AppText.description[globalController.language.value]!}:",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: AppColor.blackcolor[globalController.dark.value]!,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.54,
              wordSpacing: 1,
              fontSize: size.height * 0.02),
        ),
        SizedBox(height: size.height * 0.021),
        RichText(
          text: TextSpan(
            text: globalController.readMoreDesc.isTrue
                ? widget.bookData?.bookDesc
                : widget.bookData?.bookDesc
                    ?.substring(0, (size.height * 0.45).toInt()),
            style: TextStyle(
                color: AppColor.blackcolor[globalController.dark.value]!
                    .withOpacity(0.4),
                fontWeight: FontWeight.w400,
                letterSpacing: 0.6,
                wordSpacing: 1,
                fontSize: size.height * 0.015),
            children: [
              TextSpan(
                text: globalController.readMoreDesc.isFalse
                    ? "..${AppText.showMore[globalController.language.value]!}"
                    : AppText.showLess[globalController.language.value]!,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    globalController.showMoreTextFunc();
                  },
                style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.54,
                    wordSpacing: 1,
                    fontSize: size.height * 0.015),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget bookCategories(Size size, GlobalController globalController,
      BoxConstraints boxConstraints) {
    return Wrap(
      direction: Axis.horizontal,
      children: List.generate(
          3,
          (index) => Container(
                margin: EdgeInsets.only(
                    right: size.width * 0.013, bottom: size.height * 0.01),
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 30, vertical: Get.height / 80),
                decoration: BoxDecoration(
                    color: AppColor.whitecolor[globalController.dark.value]!,
                    border: Border.all(color: AppColor.primaryColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Mythology',
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.54,
                      fontSize:
                          boxConstraints.maxWidth >= AppText.tab ? 18 : 12),
                ),
              )),
    );
  }

  Widget authorName(Size size, GlobalController globalController,
      BoxConstraints boxConstraints) {
    return Text(
      "By ${widget.bookData?.authorName}",
      style: TextStyle(
          color: AppColor.blackcolor[globalController.dark.value]!
              .withOpacity(0.3),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.54,
          fontSize: boxConstraints.maxWidth >= AppText.tab ? 20 : 14),
    );
  }

  Widget bookName(Size size, GlobalController globalController,
      BoxConstraints boxConstraints) {
    return Text(
      widget.bookData?.bookName ?? 'Book Name',
      style: TextStyle(
          color: AppColor.blackcolor[globalController.dark.value]!,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
          fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 18),
    );
  }

  Widget appBar(Size size, GlobalController globalController) {
    return CustomAppBar(
      globalController: globalController,
      size: size,
      title: '',
      showLeading: true,
      showTitle: false,
      iconWidgets: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.more_vert,
              color: AppColor.blackcolor[globalController.dark.value]!,
              size: size.height * 0.025,
            ),
          ),
        )
      ],
    );
  }
}
