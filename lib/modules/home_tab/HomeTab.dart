import 'package:adhirat/controller/global_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTabePage extends StatefulWidget {
  const HomeTabePage({Key? key}) : super(key: key);

  @override
  State<HomeTabePage> createState() => _HomeTabePageState();
}

class _HomeTabePageState extends State<HomeTabePage> {
  @override
  final GlobalController globle = Get.find();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }
}
