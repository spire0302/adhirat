import 'package:adhirat/utils/app_image.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/route_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.pushNamed(context, RouteString.LOGIN_SCREEN);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Image.asset(
          AppImages.whiteLogo,
          height: size.height * 0.3,
        ),
      ),
    );
  }
}
