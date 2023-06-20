import 'package:flutter/material.dart';

import 'package:adhirat/utils/app_image.dart';
import 'package:adhirat/utils/app_text.dart';

import '../../../controller/global_cache.dart';
import '../../../utils/app_color.dart';
import '../../../utils/route_string.dart';
import '../../../widgets/custom_drawer_tab.dart';

class CustomDrawer extends StatelessWidget {
  final Size size;
  final GlobalController globalController;

  const CustomDrawer({
    Key? key,
    required this.size,
    required this.globalController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: size.width,
          height: size.height * 0.25,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.whiteLogo,
                height: size.height * 0.15,
              ),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.02),
        CustomDrawerFild(
          size: size,
          globalController: globalController,
          text: AppText.profile[globalController.language.value]!,
          ontap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, RouteString.PROFILE_SCREEN);
          },
          imgchang: AppImages.profileIcon,
        ),
        CustomDrawerFild(
            globalController: globalController,
            size: size,
            text: AppText.contactUs[globalController.language.value]!,
            ontap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RouteString.CONTACT_US_SCREEN);
            },
            imgchang: AppImages.contactUSIcon),
        CustomDrawerFild(
            size: size,
            globalController: globalController,
            text: AppText.aboutUS[globalController.language.value]!,
            ontap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RouteString.ABOUT_US_SCREEN);
            },
            imgchang: AppImages.aboutUSIcon),
        CustomDrawerFild(
            size: size,
            globalController: globalController,
            text: AppText.setting[globalController.language.value]!,
            ontap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RouteString.SETTING_US_SCREEN);
            },
            imgchang: AppImages.settingIcon),
        CustomDrawerFild(
            size: size,
            globalController: globalController,
            text: AppText.privacyPolicy[globalController.language.value]!,
            ontap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RouteString.PRIVACY_POLICY_SCREEN);
            },
            imgchang: AppImages.privacyPolicyIcon),
        CustomDrawerFild(
            size: size,
            globalController: globalController,
            text: AppText.share[globalController.language.value]!,
            ontap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, RouteString.SHARE_SCREEN);
            },
            imgchang: AppImages.shareIcon),
        CustomDrawerFild(
            size: size,
            globalController: globalController,
            text: AppText.logout[globalController.language.value]!,
            ontap: () {
              Navigator.pop(context);
            },
            imgchang: AppImages.logOutIcon),
      ],
    );
  }
}
