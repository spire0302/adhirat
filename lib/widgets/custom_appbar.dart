import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/widgets/comman_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/global_cache.dart';

class CustomAppBar extends StatelessWidget {
  final bool showLeading;
  final GlobalController globalController;
  final bool showTitle;
  final void Function()? onTapLead;
  final Size size;
  final double? elevation;
  final String title;
  final List<Widget>? iconWidgets;

  const CustomAppBar(
      {super.key,
      this.showLeading = false,
      this.showTitle = true,
      this.onTapLead,
      required this.size,
      required this.globalController,
      required this.title,
      this.iconWidgets,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: elevation ?? 0,
      backgroundColor: AppColor.whitecolor[globalController.dark.value]!,
      leading: showLeading ? backArrow(globalController:globalController,context:context,size:size): const SizedBox.shrink(),
      title: showTitle
          ? Text(
        title,
        style: TextStyle(
          color: AppColor.blackcolor[globalController.dark.value]!,
          fontSize: size.height * 0.024,
          letterSpacing: 0.6,
        ),
      )
          : const SizedBox.shrink(),
      actions: iconWidgets,
    ));
  }
}
