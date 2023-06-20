import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:adhirat/widgets/comman_widget.dart';
import 'package:adhirat/widgets/custom_back_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_text.dart';
import '../widgets/book_view_box.dart';
import 'book_details_screen.dart';
import 'book_list_screen.dart';

class Bookcategory extends StatelessWidget {
  final GlobalController globalController;

  const Bookcategory({super.key, required this.globalController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(
      () => Scaffold(
        backgroundColor: AppColor.whitecolor[globalController.dark.value]!,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints boxConstraints) {
                if (boxConstraints.maxWidth >= AppText.tab) {
                  return GetBuilder(
                      init: GlobalController(),
                      builder: (globalController) => GridView.builder(
                            padding: EdgeInsets.only(left: size.width * 0.01),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 9,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              mainAxisExtent: 200,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BookDetailscreen(
                                            globalController: globalController,
                                            bookData: globalController
                                                .bookList[index]),
                                      ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 50,
                                  ),
                                  child: Row(
                                    children: [
                                      Material(
                                        elevation: 10,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.asset(
                                            AppImages.book,
                                            height: 150,
                                            width: 115,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: size.width * 0.023),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Ramayana',
                                              style: TextStyle(
                                                  color: AppColor.blackcolor[
                                                      globalController
                                                          .dark.value]!,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0.54,
                                                  fontSize:
                                                      size.height * 0.022),
                                            ),
                                            SizedBox(
                                                height: size.height * 0.003),
                                            Text(
                                              'Rishi Valmiki',
                                              style: TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.54,
                                                  fontSize:
                                                      size.height * 0.017),
                                            ),
                                            SizedBox(
                                                height: size.height * 0.005),
                                            Text(
                                              'The Ramayana is an ancient Sanskrit epic which follows Prince Rama\'s quest to rescue his beloved wife Sita from the clutches of Ravana with the help of an army of monkeys. It is traditionally attributed to the authorship of the sage Valmiki and dated to around 500 BCE to 100 BCE.',
                                              maxLines: 4,
                                              textAlign: TextAlign.justify,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: AppColor.blackcolor[
                                                          globalController
                                                              .dark.value]!
                                                      ?.withOpacity(0.4),
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.54,
                                                  fontSize:
                                                      size.height * 0.014),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ));
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBackBar(
                          size: size,
                          globalController: globalController,
                          onClick: () {
                            Get.back();
                          },
                          title: "Category"),
                      textfeild(
                          icon: true,
                          globalController: globalController,
                          boxConstraints: boxConstraints),
                      Expanded(
                        child: ListView.builder(
                          itemCount: globalController.bookList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return BookViewBox(
                              bookData: globalController.bookList[index],
                              onTap: () {
                                Get.to(() => BookList(
                                      globalController: globalController,
                                    ));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => BookDetailscreen(
                                //         bookData:
                                //             globalController.bookList[index]),
                                //   ),
                                // );
                              },
                              size: size,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
