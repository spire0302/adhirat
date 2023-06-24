import 'package:adhirat/controller/global_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../widgets/custom_gradiant_appbar.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            globalController: globalController,
            lable: "Language",
            fun: () {
              Get.back();
            },
            size: size,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 20,
                        color: Colors.grey.withOpacity(0.23),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white12, width: 2),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Text(
                            "Language",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01,
                            horizontal: size.width * 0.05),
                        child: Row(
                          children: [
                            const Text(
                              "English",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.start,
                            ),
                            Expanded(child: Container()),
                            Obx(
                              () => FlutterSwitch(
                                height: size.height * 0.023,
                                width: size.width * 0.1,
                                value: globalController.language.value ==
                                    "ENGLISH",
                                onToggle: (bl) async {
                                  // final SharedPreferencesHelper _sharedHelp =
                                  // SharedPreferencesHelper(
                                  //   pref: await SharedPreferences.getInstance(),
                                  // );
                                  globalController.language.value = "ENGLISH";
                                  // _sharedHelp.setLang(global.language.value);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01,
                            horizontal: size.width * 0.05),
                        child: Row(
                          children: [
                            const Text(
                              "Hindi",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.start,
                            ),
                            Expanded(child: Container()),
                            Obx(
                              () => FlutterSwitch(
                                height: size.height * 0.023,
                                width: size.width * 0.1,
                                value:
                                    globalController.language.value == "FRENCH",
                                onToggle: (bl) async {
                                  // final SharedPreferencesHelper _sharedHelp =
                                  // SharedPreferencesHelper(
                                  //   pref: await SharedPreferences.getInstance(),
                                  // );
                                  globalController.language.value = "FRENCH";

                                  // _sharedHelp.setLang(global.language.value);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
