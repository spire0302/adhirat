import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final Size size;
  final Color color;
  final double fontsize;
  final FontWeight weight;
  final String text;
  final bool authLabel;

  const CustomLabel({
    Key? key,
    required this.color,
    required this.fontsize,
    required this.weight,
    required this.text,
    this.authLabel = false,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return authLabel
        ? Row(
            children: [
              SizedBox(width: size.width * 0.06),
              Text(
                text,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: color,
                  fontSize: fontsize,
                  fontWeight: weight,
                ),
              ),
            ],
          )
        : Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: color,
              fontSize: fontsize,
              fontWeight: weight,
            ),
          );
  }
}
