import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/album_module/pages/webreadbook.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../../utils/app_color.dart';

class BookDetailsPopUp extends StatefulWidget {
  final String bookImg;
  final String bookName;
  final GlobalController globalController;
  final double rating;
  final String date;
  final String discription;
  final String autherName;
  final String pdfUrl;

  BookDetailsPopUp(
      {required this.bookImg,
      required this.bookName,
      required this.rating,
      required this.globalController,
      required this.date,
      required this.discription,
      required this.autherName,
      required this.pdfUrl});

  @override
  State<BookDetailsPopUp> createState() => _BookDetailsPopUpState();
}

class _BookDetailsPopUpState extends State<BookDetailsPopUp> {
  @override
  bool filepdf = false;
  String file =
      "https://firebasestorage.googleapis.com/v0/b/adhiratadmin-b2181.appspot.com/o/BookPdf%2F1686832486557000%20(2).df?alt=media&token=c0314648-a825-46b8-b6fb-76f3c3f6bc6b";

  isPDF(String filename) {
    String extension = filename.split('.').last.toLowerCase();
    print("-->> ${extension[0]}");
    if (extension[0] == "p") {
      filepdf = true;
    } else {
      filepdf = false;
    }
  }

  @override
  void initState() {
    isPDF(file);
    super.initState();
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 100),
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
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: size.width * 0.25,
                height: size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.loginImg), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: AppColor.whitecolor[
                                  widget.globalController.dark.value],
                            ))),
                  ],
                ),
              ),
              SizedBox(width: size.width * 0.18),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.date,
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColor
                            .blackcolor[widget.globalController.dark.value]!),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.bookName,
                    style: TextStyle(
                        fontSize: size.width * 0.02,
                        fontWeight: FontWeight.bold,
                        color: AppColor
                            .blackcolor[widget.globalController.dark.value]),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.autherName,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: AppColor
                            .blackcolor[widget.globalController.dark.value]),
                  ),
                  const SizedBox(height: 12),
                  RatingBar(
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                        full: Icon(
                          Icons.star,
                          color: AppColor.primaryColor,
                        ),
                        half: Icon(
                          Icons.star,
                          color: AppColor.grey,
                        ),
                        empty: Icon(
                          Icons.star,
                          color: AppColor.grey,
                        )),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: size.width * 0.2,
                    height: 400,
                    child: Text(
                      widget.discription,
                      style: TextStyle(fontSize: 17, color: AppColor.grey),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.primaryColor, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Chapters 12",
                            style: TextStyle(
                                color: AppColor.blackcolor[
                                    widget.globalController.dark.value]!),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.primaryColor, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.favorite_border,
                                    size: 20,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "32",
                                style: TextStyle(
                                    color: AppColor.blackcolor[
                                        widget.globalController.dark.value]!),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.primaryColor, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.remove_red_eye,
                                    size: 20,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "32",
                                style: TextStyle(
                                    color: AppColor.blackcolor[
                                        widget.globalController.dark.value]!),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Spacer(),
              Container(
                width: 320,
                color: AppColor.lightgreyc[widget.globalController.dark.value],
                child: ListView.builder(
                  itemCount: 13,
                  padding: EdgeInsets.only(bottom: 25),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: GestureDetector(
                        onTap: () {
                          if (filepdf == true) {
                            _launchUrl();
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Bookreadpopup(
                                  bookImg: widget.bookImg,
                                  globalController: widget.globalController,
                                  autherName: widget.autherName,
                                  bookName: widget.bookName,
                                  date: widget.date,
                                  discription: widget.discription,
                                  pdfUrl: widget.pdfUrl,
                                  rating: widget.rating,
                                );
                              },
                            );
                          }
                          ;
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(AppImages.loginImg)),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SizedBox(
                                width: 140,
                                child: Text(
                                  "Chapter ${index + 1}",
                                  style: TextStyle(
                                      color: AppColor.blackcolor[
                                          widget.globalController.dark.value]!,
                                      fontSize: 22),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Positioned(
            top: Get.height / 10,
            bottom: Get.height / 10,
            left: size.width * 0.1,
            child: Container(
              width: size.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
              ),
              child: Image.asset(
                AppImages.book,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(file))) {
      throw Exception('Could not launch $file');
    }
  }
}
