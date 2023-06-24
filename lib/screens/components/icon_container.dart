import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/fonts_and_colors.dart';

class IconContainer extends StatelessWidget {
  final String iconName;
  const IconContainer({
    required this.iconName,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      decoration: const BoxDecoration(color: iconsBackgroundColor),
      child: SvgPicture.asset(
        'assets/icons/$iconName',
      ),
    );
  }
}