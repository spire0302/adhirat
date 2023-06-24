import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/quiz_module/page/qustion.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../album_module/widgets/book_view_box.dart';

class QuizDetails extends StatelessWidget {
  final GlobalController globalController;

  const QuizDetails({super.key, required this.globalController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Obx(
        () => Scaffold(
          backgroundColor: AppColor.lightgreyc[globalController.dark.value]!,
          appBar: AppBar(
            title: Text(
              AppText.details[globalController.language.value]!,
              style: TextStyle(
                  color: AppColor.blackcolor[globalController.dark.value]!,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 30 : 20),
            ),
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
            backgroundColor: AppColor.lightgreyc[globalController.dark.value]!,
            centerTitle: true,
            elevation: 0,
          ),
          bottomNavigationBar: Bottombutton(boxConstraints),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  thumbnail(),
                  SizedBox(
                    height: Get.height / 40,
                  ),
                  categoryLableText(size, false),
                  SizedBox(
                    height: Get.height / 60,
                  ),
                  Divider(
                    color: AppColor.grey,
                  ),
                  Detaisls(size, boxConstraints),
                  Divider(
                    color: AppColor.grey,
                  ),
                  SizedBox(
                    height: Get.height / 60,
                  ),
                  profile(boxConstraints),
                  SizedBox(
                    height: Get.height / 40,
                  ),
                  Text(
                    AppText.description[globalController.language.value]!,
                    style: TextStyle(
                        fontSize:
                            boxConstraints.maxWidth >= AppText.tab ? 22 : 16,
                        fontWeight: FontWeight.w600,
                        color:
                            AppColor.blackcolor[globalController.dark.value]!),
                  ),
                  SizedBox(height: 10),
                  Discription(boxConstraints),
                  SizedBox(
                    height: Get.height / 40,
                  ),
                  qestionlable(size, boxConstraints),
                  SizedBox(
                    height: Get.height / 40,
                  ),
                  listview(boxConstraints)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget Bottombutton(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width / 8, vertical: Get.height / 80),
      child: InkWell(
        onTap: () {
          Get.to(() => Question());
        },
        child: Container(
          height: Get.height / 16,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              boxShadow: [
                BoxShadow(
                  color: AppColor.grey.withOpacity(0.8),
                  offset: const Offset(0, 2),
                  blurRadius: 1,
                  spreadRadius: 0,
                )
              ],
              color: AppColor.primaryColor),
          child: Center(
            child: Text(
              AppText.playnow[globalController.language.value]!,
              style: TextStyle(
                  color: AppColor.whitecolor[globalController.dark.value]!,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 26 : 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  Widget listview(BoxConstraints boxConstraints) {
    return ListView.builder(
      itemCount: 8,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: Get.height / 70),
          child: InkWell(
            onTap: () {
              Get.to(() => QuizDetails(
                    globalController: globalController,
                  ));
            },
            child: Container(
              height: boxConstraints.maxWidth >= AppText.tab
                  ? Get.height / 7
                  : Get.height / 8,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.grey.withOpacity(0.4)),
                borderRadius: BorderRadius.circular(16),
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color:
                            AppColor.whitecolor[globalController.dark.value]!,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://img.freepik.com/free-photo/3d-student-graduation-cap-books-stack_107791-15667.jpg?size=626&ext=jpg&ga=GA1.1.440298206.1685705428&semt=ais ")),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    height: double.infinity,
                    width: Get.width / 3,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width / 30, vertical: Get.height / 60),
                    child: Column(
                      mainAxisAlignment: boxConstraints.maxWidth >= AppText.tab
                          ? MainAxisAlignment.spaceEvenly
                          : MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 2,
                          child: Text(
                            "Re-Train Your Brain now dejf3",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: boxConstraints.maxWidth >= AppText.tab
                                    ? 26
                                    : 16,
                                color: AppColor
                                    .blackcolor[globalController.dark.value]!,
                                fontWeight: FontWeight.w400),
                            maxLines: 1,
                          ),
                        ),
                        boxConstraints.maxWidth >= AppText.tab
                            ? SizedBox()
                            : Spacer(),
                        Text(
                          "2 weeks ago | 2.5k plays",
                          style: TextStyle(
                            fontSize: boxConstraints.maxWidth >= AppText.tab
                                ? 18
                                : 12,
                            color: AppColor
                                .blackcolor[globalController.dark.value]!,
                          ),
                        ),
                        boxConstraints.maxWidth >= AppText.tab
                            ? SizedBox()
                            : SizedBox(
                                height: Get.height / 100,
                              ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: const NetworkImage(
                                  "https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?cs=srgb&dl=pexels-jack-winbow-1559486.jpg&fm=jpg"),
                              radius: boxConstraints.maxWidth >= AppText.tab
                                  ? 15
                                  : 8,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Than eddings",
                              style: TextStyle(
                                fontSize: boxConstraints.maxWidth >= AppText.tab
                                    ? 18
                                    : 12,
                                color: AppColor
                                    .blackcolor[globalController.dark.value]!,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget categoryLableText(Size size, bool landscape) {
    return Row(
      children: [
        Text(
          "Back to School Quiz Game",
          style: TextStyle(
              color: AppColor.blackcolor[globalController.dark.value]!,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.54,
              fontSize: size.height * 0.024),
        ),
      ],
    );
  }

  Widget qestionlable(Size size, BoxConstraints boxConstraints) {
    return Row(
      children: [
        Text(
          "Question (10)",
          style: TextStyle(
              color: AppColor.blackcolor[globalController.dark.value]!,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.54,
              fontSize: size.height * 0.024),
        ),
        Spacer(),
        Text(
          AppText.viewall[globalController.language.value]!,
          style: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.54,
              fontSize: size.height * 0.020),
        ),
      ],
    );
  }

  Widget thumbnail() {
    return Container(
      height: Get.height / 4,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://img.freepik.com/free-photo/top-view-back-school-concept_23-2148559724.jpg?w=1380&t=st=1685786418~exp=1685787018~hmac=74fa13c4fae4420aa9dcda702329e6d46c7b18ec3e49e5fb281afee36190d5ef"))),
    );
  }

  Widget Detaisls(Size size, BoxConstraints boxConstraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "10",
              style: TextStyle(
                  color: AppColor.blackcolor[globalController.dark.value]!,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.54,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              AppText.Question[globalController.language.value]!,
              style: TextStyle(
                  color: AppColor.grey,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.54,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 18 : 14),
            ),
          ],
        ),
        Container(
          color: AppColor.grey.withOpacity(0.4),
          width: 1,
          height: Get.height / 16,
        ),
        Column(
          children: [
            Text(
              "32",
              style: TextStyle(
                  color: AppColor.blackcolor[globalController.dark.value]!,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.54,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              AppText.played[globalController.language.value]!,
              style: TextStyle(
                  color: AppColor.grey,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.54,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 18 : 14),
            ),
          ],
        ),
        Container(
          color: AppColor.grey.withOpacity(0.4),
          width: 1,
          height: Get.height / 16,
        ),
        Column(
          children: [
            Text(
              "12",
              style: TextStyle(
                  color: AppColor.blackcolor[globalController.dark.value]!,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.54,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              AppText.favorited[globalController.language.value]!,
              style: TextStyle(
                  color: AppColor.grey,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.54,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 18 : 14),
            ),
          ],
        ),
        Container(
          color: AppColor.grey.withOpacity(0.4),
          width: 1,
          height: Get.height / 16,
        ),
        Column(
          children: [
            Text(
              "8",
              style: TextStyle(
                  color: AppColor.blackcolor[globalController.dark.value]!,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.54,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              AppText.favorited[globalController.language.value]!,
              style: TextStyle(
                  color: AppColor.grey,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.54,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 18 : 14),
            ),
          ],
        ),
      ],
    );
  }

  Widget profile(BoxConstraints boxConstraints) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?cs=srgb&dl=pexels-jack-winbow-1559486.jpg&fm=jpg"),
          radius: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
        ),
        SizedBox(
          width: Get.width / 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Andrew Ainsle",
              style: TextStyle(
                  color: AppColor.blackcolor[globalController.dark.value]!,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.54,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 20 : 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "@andrew_ainle",
              style: TextStyle(
                  color: AppColor.grey,
                  letterSpacing: 0.54,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 20 : 12),
            ),
          ],
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColor.primaryColor, width: 1),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: boxConstraints.maxWidth >= AppText.tab ? 14 : 10,
                  vertical: 3),
              child: Text(
                AppText.you[globalController.language.value]!,
                style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: boxConstraints.maxWidth >= AppText.tab ? 20 : 12),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  Widget Discription(BoxConstraints boxConstraints) {
    return SizedBox(
        width: double.infinity,
        child: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it",
          style: TextStyle(
              fontSize: boxConstraints.maxWidth >= AppText.tab ? 18 : 14,
              color: AppColor.blackcolor[globalController.dark.value]!),
          maxLines: 4,
        ));
  }
}
