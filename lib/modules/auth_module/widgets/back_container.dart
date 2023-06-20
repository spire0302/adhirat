import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:flutter/cupertino.dart';

class BackContainer extends StatelessWidget {
  final Size size;
  final GlobalController globalController;
  final Widget widget;
  final bool landScape;

  const BackContainer({
    Key? key,
    required this.size,
    required this.globalController,
    required this.widget,
    this.landScape = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return landScape
        ? Container(
            width: 500,
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
            ),
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.025, horizontal: size.width * 0.015),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.whitecolor[globalController.dark.value]!.withOpacity(0.3),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 20,
                  color: AppColor.grey.withOpacity(0.23),
                ),
              ],
            ),
            child: widget,
          )
        : Container(
            width: size.width,
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.09),
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01, horizontal: size.width * 0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.whitecolor[globalController.dark.value]!.withOpacity(0.6),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 20,
                  color: AppColor.grey.withOpacity(0.23),
                ),
              ],
            ),
            child: widget,
          );
  }
}
