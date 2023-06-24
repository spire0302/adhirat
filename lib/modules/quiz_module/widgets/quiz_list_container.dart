import 'package:adhirat/controller/global_cache.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_image.dart';

class QuizListContainer extends StatelessWidget {
  final Size size;
  final GlobalController  globalController;
  final String img;
  final String title;
  final String que;
  final String timeDuration;

  const QuizListContainer(
      {Key? key,
      required this.size,
      required this.globalController,
      required this.img,
      required this.title,
      required this.que,
      required this.timeDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.014,
        ),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: AppColor.whitecolor[globalController.dark.value]!,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColor.grey.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 4,
                offset: const Offset(0, 5),
              )
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.08,
              width: size.width * 0.17,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(img),
                  )),
            ),
            SizedBox(width: size.width * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColor.blackcolor[globalController.dark.value]!,
                    fontSize: size.width * 0.038,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  children: [
                    Icon(Icons.book, color: AppColor.grey, size: 15),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      que,
                      style: TextStyle(
                        color: AppColor.grey,
                        fontSize: size.width * 0.033,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.005),
                Row(
                  children: [
                    Icon(Icons.watch_later_outlined,
                        color: AppColor.grey, size: 15),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      timeDuration,
                      style: TextStyle(
                        color: AppColor.grey,
                        fontSize: size.width * 0.033,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
