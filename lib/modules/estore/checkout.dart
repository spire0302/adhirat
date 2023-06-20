import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/modules/estore/eshophome.dart';
import 'package:adhirat/modules/estore/paument.dart';
import 'package:adhirat/modules/estore/shipping.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/widgets/comman_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_text.dart';
import 'adress.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints boxConstraints) {
      return Obx(() => Scaffold(
          bottomNavigationBar: bottombar(boxConstraints),
          backgroundColor: AppColor.lightgreyc[globalController.dark.value]!,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                color: AppColor.blackcolor[globalController.dark.value]!,
              ),
            ),
            backgroundColor: AppColor.lightgreyc[globalController.dark.value]!,
            elevation: 0,
            title: Text(
              AppText.Checkout[globalController.language.value]!,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackcolor[globalController.dark.value]!,
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 30 : 20),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_outlined,
                    size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                    color: AppColor.blackcolor[globalController.dark.value]!,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                  child: Text(
                    AppText.shipingaddress[globalController.language.value]!,
                    style: TextStyle(
                      fontSize:
                          boxConstraints.maxWidth >= AppText.tab ? 22 : 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.blackcolor[globalController.dark.value]!,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                address(boxConstraints),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: AppColor.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                  child: Text(
                    AppText.orderlist[globalController.language.value]!,
                    style: TextStyle(
                      fontSize:
                          boxConstraints.maxWidth >= AppText.tab ? 22 : 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.blackcolor[globalController.dark.value]!,
                    ),
                  ),
                ),
                cartlist(boxConstraints),
                Divider(
                  color: AppColor.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                shippingtype(boxConstraints),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: AppColor.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                promocode(boxConstraints),
                const SizedBox(
                  height: 10,
                ),
                biil(boxConstraints),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )));
    });
  }

  Widget bottombar(BoxConstraints boxConstraints) {
    return Container(
      height: Get.height / 8,
      decoration: BoxDecoration(
        color: AppColor.whitecolor[globalController.dark.value]!,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.totalprise[globalController.language.value]!,
                  style: TextStyle(
                      color: AppColor.grey,
                      fontSize:
                          boxConstraints.maxWidth >= AppText.tab ? 28 : 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "\$99",
                  style: TextStyle(
                      color: AppColor.blackcolor[globalController.dark.value]!,
                      fontSize:
                          boxConstraints.maxWidth >= AppText.tab ? 28 : 22,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Get.to(() => Payment());
              },
              child: Container(
                height: Get.height / 14,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(80)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color:
                              AppColor.whitecolor[globalController.dark.value]!,
                          size:
                              boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          AppText.continuepayment[
                              globalController.language.value]!,
                          style: TextStyle(
                              color: AppColor
                                  .whitecolor[globalController.dark.value]!,
                              fontSize: boxConstraints.maxWidth >= AppText.tab
                                  ? 26
                                  : 18,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget biil(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: Container(
        height: Get.height / 6,
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30, vertical: 10),
        decoration: BoxDecoration(
            color: AppColor.whitecolor[globalController.dark.value]!,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppText.Amount[globalController.language.value]!,
                  style: TextStyle(
                    fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 14,
                    color: AppColor.grey,
                  ),
                ),
                Text(
                  "\$435",
                  style: TextStyle(
                    fontSize: boxConstraints.maxWidth >= AppText.tab ? 23 : 15,
                    color: AppColor.blackcolor[globalController.dark.value]!,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppText.Shipping[globalController.language.value]!,
                  style: TextStyle(
                    fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 14,
                    color: AppColor.grey,
                  ),
                ),
                Text(
                  "-",
                  style: TextStyle(
                    fontSize: boxConstraints.maxWidth >= AppText.tab ? 23 : 15,
                    color: AppColor.blackcolor[globalController.dark.value]!,
                  ),
                ),
              ],
            ),
            Divider(
              color: AppColor.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppText.total[globalController.language.value]!,
                  style: TextStyle(
                    fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 14,
                    color: AppColor.grey,
                  ),
                ),
                Text(
                  "-",
                  style: TextStyle(
                    fontSize: boxConstraints.maxWidth >= AppText.tab ? 23 : 15,
                    color: AppColor.blackcolor[globalController.dark.value]!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget promocode(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: Get.width / 1.25,
              child: eshoptextfeild(
                boxConstraints: boxConstraints,
                globalController: globalController,
                icon: false,
                fillColor: AppColor.whitecolor[globalController.dark.value]!,
                enabled: true,
                bordrcolor: Colors.transparent,
                prifix: false,
                hintText: AppText.enterpromo[globalController.language.value]!,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            backgroundColor: AppColor.primaryColor,
            radius: boxConstraints.maxWidth >= AppText.tab ? 25 : 20,
            child: Center(
              child: Icon(
                Icons.add,
                size: boxConstraints.maxWidth >= AppText.tab ? 35 : 20,
                color: AppColor.whitecolor[globalController.dark.value]!,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget shippingtype(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: InkWell(
        onTap: () {
          Get.to(() => Shipping());
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.whitecolor[globalController.dark.value]!,
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 30, vertical: Get.height / 50),
          child: Row(
            children: [
              Icon(
                Icons.delivery_dining,
                color: AppColor.primaryColor,
                size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                AppText.choosshipping[globalController.language.value]!,
                style: TextStyle(
                  fontSize: boxConstraints.maxWidth >= AppText.tab ? 22 : 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackcolor[globalController.dark.value]!,
                ),
              ),
              Spacer(),
              Icon(
                Icons.navigate_next,
                size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                color: AppColor.blackcolor[globalController.dark.value]!,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget address(BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width / 30, vertical: Get.height / 60),
        decoration: BoxDecoration(
            color: AppColor.whitecolor[globalController.dark.value]!,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor:
                  AppColor.lightgreyc[globalController.dark.value]!,
              radius: boxConstraints.maxWidth >= AppText.tab ? 30 : 20,
              child: Center(
                child: Icon(
                  Icons.location_on_outlined,
                  color: AppColor.primaryColor,
                  size: boxConstraints.maxWidth >= AppText.tab ? 30 : 25,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Home",
                  style: TextStyle(
                      fontSize:
                          boxConstraints.maxWidth >= AppText.tab ? 20 : 16,
                      color: AppColor.blackcolor[globalController.dark.value]!,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: Get.width / 1.6,
                  child: Text(
                    "Nana varachha katargam mota varachha surat",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize:
                            boxConstraints.maxWidth >= AppText.tab ? 18 : 14,
                        color: AppColor.grey),
                  ),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Get.to(() => SelectAddress());
              },
              child: Icon(
                Icons.edit,
                size: boxConstraints.maxWidth >= AppText.tab ? 35 : 25,
                color: AppColor.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget que(BoxConstraints boxConstraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: AppColor.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(60)),
          child: Text(
            globalController.Quant.value.toString(),
            style: TextStyle(
                fontSize: boxConstraints.maxWidth >= AppText.tab ? 28 : 18,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget cartlist(BoxConstraints boxConstraints) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: Get.height / 60),
          itemCount: globalController.cartlist.value.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Obx(() => Padding(
                  padding: EdgeInsets.only(top: Get.height / 60),
                  child: Container(
                    height: Get.height / 5.5,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color:
                            AppColor.whitecolor[globalController.dark.value]!,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(globalController
                                      .cartlist.value[index]['image'])),
                              color: AppColor
                                  .lightgreyc[globalController.dark.value]!),
                          height: Get.height / 6,
                          width: Get.width / 3,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              globalController.cartlist.value[index]['name'],
                              style: TextStyle(
                                fontSize: boxConstraints.maxWidth >= AppText.tab
                                    ? 28
                                    : 18,
                                fontWeight: FontWeight.w400,
                                color: AppColor
                                    .blackcolor[globalController.dark.value]!,
                              ),
                            ),
                            Text(
                              globalController.cartlist.value[index]['prise'],
                              style: TextStyle(
                                  fontSize:
                                      boxConstraints.maxWidth >= AppText.tab
                                          ? 28
                                          : 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.primaryColor),
                            ),
                            que(boxConstraints)
                          ],
                        )
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
