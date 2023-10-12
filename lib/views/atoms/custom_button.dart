import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final String svg;
  final double width;
  final double height;
  final Color backgroundColor;

  CustomButton({
    required this.svg,
    this.width = 80,
    this.height = 40,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset('assets/icons/${svg}.svg', height: 15),
    );
  }
}