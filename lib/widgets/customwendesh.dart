import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/dashboard/pages/ebook/album_screen.dart';
import 'package:adhirat/modules/dashboard/pages/home/home_widget.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:get/get.dart';

import '../modules/audio_module/pages/audio_screen.dart';
import '../modules/estore/eshophome.dart';
import '../modules/image_module/page/image_sceen.dart';
import '../modules/quiz_module/page/quiz_screen.dart';
import '../modules/sadhnacard/sadhnacard.dart';
import '../modules/video_module/pages/choose_video_category.dart';

class MainView extends StatelessWidget {
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> views = [
      AudioScreen(),
      AlbumScreen(landscape: false),
      HomeWidget(
        size: size,
      ),
      ChooseVideoCategoryScreen(),
      ImageScreen(),
      const EshopHomePage(),
      QuizScreen(),
      const SadhnaCard(),
      const Center(
        child: Text("Calander "),
      )
    ];
    return Obx(() => Scaffold(
          backgroundColor: AppColor.whitecolor[globalController.dark.value]!,
          body: Row(
            children: [
              SideNavigationBar(
                selectedIndex: globalController.dashindex.value,
                toggler: const SideBarToggler(
                    expandIcon: Icons.navigate_next_outlined,
                    shrinkIcon: Icons.arrow_back_ios_rounded),
                header: SideNavigationBarHeader(
                    image: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.loginImg)),
                    title: Text(
                      "Adhirat",
                      style: TextStyle(
                          color: AppColor
                              .blackcolor[globalController.dark.value]!),
                    ),
                    subtitle: Text(
                      "Adhirat",
                      style: TextStyle(
                          color: AppColor
                              .blackcolor[globalController.dark.value]!),
                    )),
                theme: SideNavigationBarTheme(
                    // backgroundColor:
                    //     AppColor.whitecolor[globalController.dark.value]!,
                    itemTheme: SideNavigationBarItemTheme(
                      labelTextStyle: TextStyle(
                        fontSize: 22,
                      ),
                      selectedItemColor: AppColor.primaryColor,
                    ),
                    togglerTheme: SideNavigationBarTogglerTheme.standard(),
                    dividerTheme: SideNavigationBarDividerTheme.standard()),
                items: const [
                  SideNavigationBarItem(
                    icon: Icons.settings,
                    label: 'Audio Player',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.dashboard,
                    label: "Album",
                  ),
                  SideNavigationBarItem(
                    icon: Icons.person,
                    label: 'Home',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.settings,
                    label: 'Vedio Player',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.settings,
                    label: 'Image',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.settings,
                    label: 'E - Shope',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.settings,
                    label: 'Quiz',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.settings,
                    label: 'Sadhna Card',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.settings,
                    label: 'Vaishnav Callander',
                  ),
                ],
                onTap: (index) {
                  globalController.dashindex.value = index;
                },
              ),
              Expanded(
                child: views.elementAt(globalController.dashindex.value),
              )
            ],
          ),
        ));
  }
}
