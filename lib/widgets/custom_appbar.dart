import 'package:adhirat/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool showLeading;
  final bool showTitle;
  final void Function()? onTapLead;
  final Size size;
  final String title;
  final List<Widget>? iconWidgets;
  const CustomAppBar(
      {super.key,
      this.showLeading = false,
      this.showTitle = true,
      this.onTapLead,
      required this.size,
      required this.title,
      this.iconWidgets});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColor.white,
      leading: showLeading
          ? InkWell(
              onTap: onTapLead,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.black,
                size: size.height * 0.025,
              ),
            )
          : const SizedBox.shrink(),
      title: showTitle
          ? Text(
              title,
              style: TextStyle(
                color: AppColor.black,
                fontSize: size.height * 0.024,
                letterSpacing: 0.6,
              ),
            )
          : const SizedBox.shrink(),
      actions: iconWidgets,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size.height * 0.07);
}
