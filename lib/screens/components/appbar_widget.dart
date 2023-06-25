import 'package:flutter/material.dart';
import 'package:travel_app/screens/components/icon_container.dart';

import '../../constants/fonts_and_colors.dart';

class AppBarWidget extends StatelessWidget {
  final String leftIconPath, text, rightIconPath;
  final double leftIconDistance, rightIconDistance;
  const AppBarWidget({
    super.key,
    required this.leftIconPath,
    required this.text,
    required this.rightIconPath, 
    required this.leftIconDistance, 
    required this.rightIconDistance,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: IconContainer(
            iconName: leftIconPath,
          ),
        ),
        SizedBox(
          width: leftIconDistance,
        ),
        Text(
          text,
          style: const TextStyle(
              fontFamily: sans, 
              fontSize: 20, 
              fontWeight: FontWeight.w500
            ),
        ),
        SizedBox(
          width: rightIconDistance,
        ),
        IconContainer(iconName: rightIconPath)
      ],
    );
  }
}