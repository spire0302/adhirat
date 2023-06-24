// ignore_for_file: prefer_const_constructors

import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/estore/eshophome.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalController globalController = Get.find();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints boxConstraints) {return

      Obx(()=> Scaffold(
        backgroundColor: AppColor.whitecolor[globalController.dark.value]!,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                child: eshoptextfeild(boxConstraints:boxConstraints,
                  globalController:globalController,
                    hintText: AppText.search[globalController.language.value]!,
                    icon: true,
                    enabled: true,
                    fillColor: AppColor.lightgreyc[globalController.dark.value]!),
              ),
              recentlable(),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color:AppColor.grey,
                indent: Get.width / 30,
                endIndent: Get.width / 30,
              ),
              Expanded(
                child: SizedBox(
                  child: searchlist(),
                ),
              )
            ],
          ),
        ),
      ));});
  }

  Widget recentlable() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: Row(
        children: [
          Text(
            AppText.recenr[globalController.language.value]!,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color:AppColor.blackcolor[globalController.dark.value]!),
          ),
          Spacer(),
          Text(
            AppText.clearall[globalController.language.value]!,
            style: TextStyle(fontSize: 16, color: AppColor.primaryColor),
          )
        ],
      ),
    );
  }

  Widget searchlist() {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView.builder(
        itemCount: 10,
        // padding: EdgeInsets.only(right: Get.width / 30),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Silver Netver plant",style:TextStyle(color:AppColor.blackcolor[globalController.dark.value]!),),
            trailing: Icon(Icons.close,color:AppColor.grey,),
          );
        },
      ),
    );
  }
}
