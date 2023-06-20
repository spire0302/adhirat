import 'package:adhirat/controller/global_cache.dart';
import 'package:adhirat/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomReadFild extends StatelessWidget {
  final int edittext;
  final String hint;
  final bool cngcolor;
  final bool width;
  final bool hight;
  final GlobalController globalController;
  final bool max;
  final bool textcng;
  final bool colcng;
  final Size size;
  final bool icon;
  final Function icontap;

  const CustomReadFild(
      {Key? key,
      this.edittext = 0,
      this.cngcolor = false,
      this.width = false,
      this.hint = "",
      this.max = false,
      this.textcng = false,
      this.colcng = false,
      this.hight = false,
      required this.size,
      this.icon = false,
      required this.icontap,
      required this.globalController,

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Obx(() =>  Container(
           padding: EdgeInsets.symmetric(
               horizontal: size.width * 0.028,
               vertical: hight ? size.height * 0.004 : size.height * 0.02),
           margin: width
               ? EdgeInsets.symmetric(horizontal: size.width * 0.03)
               : EdgeInsets.zero,
           width: double.infinity,
           alignment: Alignment.centerLeft,
           decoration: BoxDecoration(
             boxShadow: [
               BoxShadow(
                 // offset: const Offset(0, 1),
                 blurRadius: 10,
                 spreadRadius: 0,
                 color: Colors.grey.withOpacity(0.2),
               ),
             ],
             color: AppColor.whitecolor[globalController.dark.value]!,
             borderRadius: BorderRadius.circular(10),
             border: Border.all(
                 color: cngcolor ? Colors.white12 : AppColor.primaryColor,
                 width: 1),
           ),
           child: Row(children: [
             Expanded(
               child: TextField(
                 readOnly: true,
                 maxLines: max ? 2 : 1,
                 decoration: InputDecoration(
                   hintText: hint,
                   hintStyle: TextStyle(
                     fontSize: 16,
                     color: colcng ? Colors.black : Colors.black45,
                   ),
                   border: InputBorder.none,
                 ),
               ),
             ),
             icon
                 ? InkWell(
                 onTap: () {
                   icontap();
                 },
                 child: const Icon(Icons.edit))
                 : Container()
           ])

         // Text(
         //   edittext,
         //   style: TextStyle(
         //       fontSize: 15,
         //       fontWeight: cngcolor ? FontWeight.w400 : FontWeight.w500,
         //       color: cngcolor ? Colors.grey : ConstColors.blackColor),
         //   textAlign: cngcolor ? TextAlign.start : TextAlign.center,
         // ),
       ),)
      ],
    );
  }
}
