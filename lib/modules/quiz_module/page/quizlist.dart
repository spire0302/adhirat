import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/quiz_module/page/quizdetails.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_text.dart';
import '../../album_module/widgets/book_view_box.dart';

class Quizelist extends StatelessWidget {
  final GlobalController globalController;

  const Quizelist({super.key, required this.globalController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      return Obx(() => Scaffold(
            backgroundColor: AppColor.lightgreyc[globalController.dark.value]!,
            appBar: AppBar(
              backgroundColor:
                  AppColor.lightgreyc[globalController.dark.value]!,
              centerTitle: true,
              elevation: 0,
              title: Text(
                AppText.education[globalController.language.value]!,
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
                    color: AppColor.blackcolor[globalController.dark.value]!,
                    size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                  )),
            ),
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
                      height: Get.height / 40,
                    ),
                    ListView.builder(
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
                                border: Border.all(
                                    color: AppColor.grey.withOpacity(0.4)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.whitecolor[
                                            globalController.dark.value]!,
                                        image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://m.media-amazon.com/images/I/51VqdauL1RL.jpg")),
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15))),
                                    height: double.infinity,
                                    width: Get.width / 3,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.width / 30,
                                        vertical: Get.height / 60),
                                    child: Column(
                                      mainAxisAlignment:
                                          boxConstraints.maxWidth >= AppText.tab
                                              ? MainAxisAlignment.spaceEvenly
                                              : MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width / 2,
                                          child: Text(
                                            "Re-Train Your Brain now dejf3",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize:
                                                    boxConstraints.maxWidth >=
                                                            AppText.tab
                                                        ? 26
                                                        : 16,
                                                color: AppColor.blackcolor[
                                                    globalController
                                                        .dark.value]!,
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
                                            fontSize: boxConstraints.maxWidth >=
                                                    AppText.tab
                                                ? 18
                                                : 12,
                                            color: AppColor.blackcolor[
                                                globalController.dark.value]!,
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
                                              radius: boxConstraints.maxWidth >=
                                                      AppText.tab
                                                  ? 15
                                                  : 8,
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              "Than eddings",
                                              style: TextStyle(
                                                fontSize:
                                                    boxConstraints.maxWidth >=
                                                            AppText.tab
                                                        ? 18
                                                        : 12,
                                                color: AppColor.blackcolor[
                                                    globalController
                                                        .dark.value]!,
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
                    ),
                  ],
                ),
              ),
            ),
          ));
    });
  }

  Widget categoryLableText(Size size, bool landscape) {
    return Row(
      children: [
        Text(
          "245 Quiz",
          style: TextStyle(
              color: AppColor.blackcolor[globalController.dark.value]!,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.54,
              fontSize: size.height * 0.024),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: Text(
            AppText.viewall[globalController.language.value]!,
            style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.54,
                fontSize: size.height * 0.020),
          ),
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
                  "https://img.freepik.com/free-photo/pleased-asain-female-student-believes-good-luck-exam-stands-with-eyes-closed-fingers-crossed-believes-dreams-come-true-stuck-with-papers-holds-folders_273609-46379.jpg?w=1380&t=st=1685786554~exp=1685787154~hmac=e0218cb998007045a5679bc221953e1f1ad84bc41bc7284eef1509487a823378"))),
    );
  }
}
