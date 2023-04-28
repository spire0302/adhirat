import 'package:adhirat/utils/app_color.dart';
import 'package:adhirat/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BookDetailscreen extends StatelessWidget {
  const BookDetailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CustomAppBar(size: size, title: 'RAMAYANA'),
    );
  }
}
