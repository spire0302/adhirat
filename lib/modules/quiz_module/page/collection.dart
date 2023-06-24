import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/quiz_module/page/quizlist.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_color.dart';
import 'package:get/get.dart';

class QuizeCategory extends StatelessWidget {
  QuizeCategory({Key? key}) : super(key: key);

  @override
  final GlobalController globalController = Get.find();

  Widget build(BuildContext context) {
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
                AppText.Collection[globalController.language.value]!,
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
            body: grids(boxConstraints),
          ));
    });
  }

  Widget grids(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: GridView.builder(
          padding: EdgeInsets.only(bottom: Get.height / 80),
          itemCount: 17,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: boxConstraints.maxWidth >= AppText.tab ? 3 : 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 0.7),
          itemBuilder: (_, int index) {
            return InkWell(
              onTap: () {
                Get.to(() => Quizelist(
                      globalController: globalController,
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColor.whitecolor[globalController.dark.value]!,
                      AppColor.blackcolor[globalController.dark.value]!
                    ], begin: Alignment.bottomLeft, end: Alignment.bottomRight),
                    color: AppColor.whitecolor[globalController.dark.value]!,
                    borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.9),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0, 1],
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://img.freepik.com/premium-photo/shrug-gesture-so-what-clueless-man-raising-shoulders-smiling-isolated-orange-wall_201836-8245.jpg?w=2000",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width / 30,
                            vertical: Get.height / 80),
                        child: Text(
                          'Education',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.54,
                              fontSize: boxConstraints.maxWidth >= AppText.tab
                                  ? 18
                                  : 13),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
