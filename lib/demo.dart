import 'package:adhirat/modules/audio_module/widgets/audio_album_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_image.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:adhirat/widgets/custom_text_feaild.dart';

import 'modules/audio_module/controller/audio_controller.dart';
import 'modules/audio_module/pages/audio_detail.dart';

class DemoScreen extends StatefulWidget {
  DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  final TextEditingController searchController = TextEditingController();

  final AudioController audioController = Get.put(AudioController());

  final GlobalController globalController = Get.find();

  RxBool hover = false.obs;
  RxInt hoverIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Obx(
            () => Scaffold(
          backgroundColor: AppColor.whitecolor[globalController.dark.value]!,
          body: LayoutBuilder(
              builder: (BuildContext ctx, BoxConstraints constraints) {
                if (constraints.maxWidth >= AppText.web) {
                  return Scaffold(
                    backgroundColor:
                    AppColor.whitecolor[globalController.dark.value]!,
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 450,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AppImages.loginImg),
                                  fit: BoxFit.cover),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    "Album Catagory",
                                    style: TextStyle(
                                        color: AppColor.blackcolor[
                                        globalController.dark.value],
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 175,
                                  child: ListView.builder(
                                      itemCount: 19,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, int i) {
                                        return InkWell(
                                          onTap: () {},
                                          onTapCancel: () {
                                            hoverIndex.value = 0;
                                          },
                                          onHover: (val) {
                                            hover.value = val;
                                            if (hover.value) {
                                              hoverIndex.value = i + 1;
                                            }
                                          },
                                          child: Obx(
                                                () => MouseRegion(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, bottom: 10),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                      hoverIndex.value == i + 1
                                                          ? AppColor.whitecolor[
                                                      globalController
                                                          .dark.value]
                                                          : Colors.transparent,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 125,
                                                          width: 145,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                            image:
                                                            const DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                  AppImages
                                                                      .loginImg),
                                                            ),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        SizedBox(
                                                          width: 145,
                                                          height: 20,
                                                          child: Text(
                                                            "Morning Bhajane",
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: TextStyle(
                                                                color: AppColor
                                                                    .blackcolor[
                                                                globalController
                                                                    .dark
                                                                    .value],
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: 10,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                          height: 70,
                                          decoration: BoxDecoration(
                                              color: AppColor.lightgreyc[
                                              globalController.dark.value]!,
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          padding: EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(5),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            AppImages.book2))),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: 10,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                          height: 70,
                                          decoration: BoxDecoration(
                                              color: AppColor.lightgreyc[
                                              globalController.dark.value]!,
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return GetBuilder(
                      init: GlobalController(),
                      builder: (controller) {
                        List albumHeader = [
                          AppText.trendingNow[controller.language.value]!,
                          AppText.topCharts[controller.language.value]!,
                          AppText.newRelease[controller.language.value]!,
                        ];
                        return SingleChildScrollView(
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: size.height * 0.01),
                                Text(
                                  AppText
                                      .recommendedAlbum[controller.language.value]!,
                                  style: TextStyle(
                                    color: AppColor
                                        .blackcolor[globalController.dark.value]!,
                                    fontSize: size.height * 0.021,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                    wordSpacing: 1,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.015),
                                SizedBox(
                                  height: size.height * 0.2,
                                  child: ListView.builder(
                                      itemCount: 10,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              right: size.width * 0.03),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                    const AlbumDetailsScreen(),
                                                  ));
                                            },
                                            child: CircleAvatar(
                                              radius: size.height * 0.09,
                                              backgroundColor: AppColor.whitecolor[
                                              globalController.dark.value]!,
                                              backgroundImage:
                                              const AssetImage(AppImages.mhb2),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(height: size.height * 0.015),
                                ListView.builder(
                                  itemCount: albumHeader.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return AudioAlbumWidget(
                                      size: size,
                                      albumImage: AppImages.mhb,
                                      albumCreateby: 'Mahabharata by Vyasa',
                                      albumName: 'Mahabharat',
                                      headerTitle: albumHeader[index],
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                              const AlbumDetailsScreen(),
                                            ));
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
              }),
        ),
      ),
    );
  }

  Widget searchHeader(Size size, GlobalController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.menu,
          color: AppColor.blackcolor[globalController.dark.value]!,
          size: size.height * 0.03,
        ),
        SizedBox(width: size.width * 0.04),
        Expanded(
          child: CustomTextFild(
              size: size,
              globalController: globalController,
              height: size.height * 0.055,
              custmPadding: true,
              max: false,
              hint: AppText.searchAudio[controller.language.value]!,
              controller: searchController),
        ),
      ],
    );
  }
}
