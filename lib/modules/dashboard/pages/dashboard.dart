import 'package:adhirat/modules/dashboard/pages/home/home_widget.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:adhirat/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adhirat/controller/global_cache.dart';
import '../../../utils/app_image.dart';
import '../../../utils/route_string.dart';
import '../../../widgets/customwendesh.dart';
import '../../audio_module/pages/audio_screen.dart';
import '../../image_module/page/image_sceen.dart';
import '../../video_module/pages/choose_video_category.dart';
import '../widgets/custom_drawer.dart';
import 'ebook/album_screen.dart';

class DashBoadScreen extends StatelessWidget {
  DashBoadScreen({super.key});

  final GlobalController globalController = Get.find();

  RxInt tabIndex = 0.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints boxConstraints) {
      if (boxConstraints.maxWidth >= AppText.web) {
        return MainView();
      } else {
        return Obx(
          () => Scaffold(
            key: scaffoldKey,
            drawer: Drawer(
              backgroundColor: Colors.white.withOpacity(0.8),
              child:
                  CustomDrawer(size: size, globalController: globalController),
            ),
            backgroundColor: AppColor.whitecolor[globalController.dark.value]!,
            body: Column(
              children: [
                SizedBox(
                  height: size.height * 0.042,
                ),
                Container(
                  padding: EdgeInsets.only(top: size.height * 0.01),
                  color: globalController.dark.value
                      ? AppColor.whitecolor[globalController.dark.value]!
                      : Colors.white.withOpacity(0.1),
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: size.width * 0.07, left: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            scaffoldKey.currentState!.openDrawer();
                          },
                          child: Image.asset(AppImages.menuIcon,
                              width: size.height * 0.032,
                              fit: BoxFit.cover,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Obx(
                          () => InkWell(
                            onTap: () {},
                            child: Text(
                              AppText.Adhirat[globalController.language.value]!,
                              style: TextStyle(
                                  color: AppColor
                                      .blackcolor[globalController.dark.value],
                                  fontSize:
                                      boxConstraints.maxWidth >= AppText.tab
                                          ? 30
                                          : size.width * 0.06,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteString.PROFILE_SCREEN);
                          },
                          child: CircleAvatar(
                            radius: boxConstraints.maxWidth >= AppText.tab
                                ? 35
                                : 20,
                            backgroundImage:
                                const AssetImage(AppImages.profile),
                          ),
                        ),
                        SizedBox(width: size.width * 0.03),
                        InkWell(
                          onTap: () {
                            globalController.dark.value = true;
                          },
                          child: CircleAvatar(
                              radius: boxConstraints.maxWidth >= AppText.tab
                                  ? 35
                                  : 20,
                              backgroundImage:
                                  const AssetImage(AppImages.notification)
                              // child: Center(
                              //   child: Icon(
                              //     Icons.notifications_none,
                              //     color: AppColor
                              //         .whitecolor[globalController.dark.value]!,
                              //     size: boxConstraints.maxWidth >= AppText.tab
                              //         ? 35
                              //         : 25,
                              //   ),
                              // ),
                              ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Obx(() => tabIndex.value == 0
                        ? HomeWidget(
                            size: size,
                          )
                        : tabIndex.value == 1
                            ? AlbumScreen(
                                landscape: false,
                              )
                            : tabIndex.value == 3
                                ? ChooseVideoCategoryScreen()
                                : tabIndex.value == 4
                                    ? ImageScreen()
                                    : tabIndex.value == 2
                                        ? AudioScreen()
                                        : Container())),
                Obx(
                  () => CustomBottomBar(
                    size: size,
                    globalController: globalController,
                    tabIndex: tabIndex.value,
                    tabFun1: () {
                      tabIndex.value = 0;
                    },
                    tabFun2: () {
                      tabIndex.value = 1;
                    },
                    tabFun3: () {
                      tabIndex.value = 2;
                    },
                    tabFun4: () {
                      tabIndex.value = 3;
                    },
                    tabFun5: () {
                      tabIndex.value = 4;
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
