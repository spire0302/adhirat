import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CustomDrawerFild extends StatelessWidget {
  final String text;
  final Function ontap;
  final String imgchang;
  final GlobalController globalController;
  final Size size;

  const CustomDrawerFild(
      {Key? key,
      required this.text,
      required this.ontap,
      required this.globalController,
      required this.imgchang,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(width: size.width * 0.07),
            Image.asset(
              imgchang,
              fit: BoxFit.contain,
              width: size.width * 0.07,
              height: size.height * 0.07,
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            Obx(() => Text(
                  text,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackcolor[globalController.dark.value]!),
                ))
          ],
        ),
      ),
    );
  }
}
