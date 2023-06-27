import 'package:flutter/material.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';

class BoldText extends StatelessWidget {
  final String text;
  final double fontSize;
  const BoldText({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: sans, fontSize: fontSize, fontWeight: FontWeight.w600),
    );
  }
}

class SemiBoldText extends StatelessWidget {
  final String text;
  final double fontSize;
  const SemiBoldText({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: sans, fontSize: fontSize, fontWeight: FontWeight.w500),
    );
  }
}

class NormalText extends StatelessWidget {
  final String text;
  final double fontSize;
  const NormalText({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: sans, fontSize: fontSize, fontWeight: FontWeight.w400),
    );
  }
}
