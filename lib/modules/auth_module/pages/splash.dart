import 'package:adhirat/modules/dashboard/pages/dashboard.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../utils/route_string.dart';
import '../../../controller/global_cache.dart';
import '../../../utils/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GlobalController globalController = Get.find();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0)).then((value) {
      Get.off(() => DashBoadScreen());
      // Navigator.pushNamed(context, RouteString.LOGIN_SCREEN);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.whitecolor[globalController.dark.value]!,
      body: Center(
        child: Image.asset(
          AppImages.whiteLogo,
          height: size.height * 0.3,
        ),
      ),
    );
  }
}
