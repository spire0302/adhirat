import 'dart:ui';

import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';
import '../../../../../../../utils/app_color.dart';
import '../../../widgets/comman_widget.dart';

class Bookreadpopup extends StatefulWidget {
  final String bookImg;
  final String bookName;
  final GlobalController globalController;
  final double rating;
  final String date;
  final String discription;
  final String autherName;
  final String pdfUrl;

  Bookreadpopup(
      {required this.bookImg,
      required this.bookName,
      required this.rating,
      required this.globalController,
      required this.date,
      required this.discription,
      required this.autherName,
      required this.pdfUrl});

  @override
  State<Bookreadpopup> createState() => _BookreadpopupState();
}

class _BookreadpopupState extends State<Bookreadpopup> {
  @override
  var data;
  RxList<List<dynamic>> listData = <List<dynamic>>[].obs;
  final GlobalController globalController = Get.find();
  RxInt pageIndex = 0.obs;

  @override
  void initState() {
    _loadCSV();
    super.initState();
  }

  void _loadCSV() async {
    final rawData = await rootBundle.loadString("assets/file/book.csv");
    listData.value = const CsvToListConverter().convert(rawData);

    setState(() {
      data = listData;
    });
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    RxBool hide = false.obs;
    return Obx(() => Container(
          margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 500),
          decoration: BoxDecoration(
              color: AppColor.whitecolor[widget.globalController.dark.value],
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: AppColor.grey.withOpacity(0.2),
                  spreadRadius: 10,
                  blurRadius: 10,
                )
              ]),
          child:
              // hide.value == false
              //     ? Padding(
              //         padding:
              //             const EdgeInsets.symmetric(horizontal: 200, vertical: 10),
              //         child: Container(
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               image: const DecorationImage(
              //                   image: AssetImage(AppImages.book),
              //                   fit: BoxFit.cover)),
              //           child: Padding(
              //             padding: EdgeInsets.only(bottom: 60),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.end,
              //               children: [
              //                 GestureDetector(
              //                   onTap: () {
              //                     hide.value = true;
              //                   },
              //                   child: Padding(
              //                     padding: EdgeInsets.symmetric(horizontal: 100),
              //                     child: Container(
              //                       height: 50,
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(80),
              //                           color: AppColor.primaryColor,
              //                           border: Border.all(
              //                               color: Colors.white, width: 1.5)),
              //                       padding: const EdgeInsets.symmetric(
              //                           horizontal: 20, vertical: 10),
              //                       child: const Center(
              //                         child: Text(
              //                           "Let's Start Now",
              //                           style: TextStyle(
              //                             color: Colors.white,
              //                             fontSize: 24,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       )
              //     :
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  child: data == null
                      ? Center(
                          child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ))
                      : SafeArea(
                          child: Column(
                            children: [
                              SizedBox(height: size.height * 0.02),
                              customAppBar(
                                  data: "Chapter 2",
                                  context: context,
                                  size: size,
                                  globalController: widget.globalController),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: size.height,
                                  child: Zoom(
                                      canvasColor: AppColor.whitecolor[
                                          globalController.dark.value]!,
                                      enableScroll: false,
                                      // scrollWeight: 1,
                                      // initTotalZoomOut: false,
                                      //   maxZoomWidth: size.width,
                                      //   maxZoomHeight: size.height,
                                      backgroundColor: AppColor.whitecolor[
                                          widget.globalController.dark.value]!,
                                      child: Text(
                                        data.toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: AppColor.blackcolor[
                                                globalController.dark.value]),
                                      )),
                                ),
                              ),
                              // Text(data.toString()),
                              // Expanded(
                              //   child: PageView.builder(
                              //     scrollDirection: Axis.horizontal,
                              //     onPageChanged: (val) {
                              //       pageIndex.value = val;
                              //       debugPrint(val.toString());
                              //     },
                              //     itemBuilder: (context, index) {
                              //       return GestureDetector(
                              //         onTap: () {
                              //           print("--- >> $index");
                              //         },
                              //         child: Zoom(
                              //           scrollWeight: 1,
                              //           initTotalZoomOut: true,
                              //           // maxZoomWidth: Get.width / 1.1,
                              //           // maxZoomHeight: Get.height / 1.15,
                              //           backgroundColor: AppColor.whitecolor[
                              //               widget.globalController.dark
                              //                   .value]!,
                              //           child:Text(data,style:TextStyle(fontSize:18,color:AppColor.blackcolor[globalController.dark.value]),)
                              //         ),
                              //       );
                              //     },
                              //   ),
                              // ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                child: const Icon(Icons.navigate_next_outlined),
                                onTap: () {
                                  pageIndex.value + 1;
                                },
                              )
                            ],
                          ),
                        )),
        ));
  }

// String currentPageText(int index, RxString myText) {
//   if (index * 1550 < myText.value.length) {
//     if (index == 0) return myText.substring(0);
//     return myText.substring((index - 1) * 1550, index * 1550);
//   }
//   return '';
// }
}
