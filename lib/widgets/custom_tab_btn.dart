import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final String image;
  final String label;
  final Size size;

  const CustomImageContainer({
    Key? key,
    required this.size,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //       spreadRadius: 5,
          //       blurRadius: 10,
          //       color: AppColor.grey.withOpacity(0.2),
          //       offset: const Offset(0, 2))
          // ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.043, vertical: size.height * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.09),
              child: Image.asset(image, fit: BoxFit.contain),
            ),
            SizedBox(height: size.width * 0.04),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size.width * 0.043, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
