import 'package:adhirat/utils/app_color.dart';
import 'package:flutter/cupertino.dart';

class BackContainer extends StatelessWidget {
  final Size size;
  final Widget widget;
  final bool landScape;

  const BackContainer({
    Key? key,
    required this.size,
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
              color: AppColor.white.withOpacity(0.3),
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
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01, horizontal: size.width * 0.035),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.white.withOpacity(0.3),
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
