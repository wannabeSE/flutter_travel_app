import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/screens/components/icon_container.dart';
import 'package:travel_app/shared/text_style.dart';


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
          padding: EdgeInsets.only(left: 23.w),
          child: IconContainer(
            iconName: leftIconPath,
          ),
        ),
        SizedBox(
          width: leftIconDistance,
        ),
        SemiBoldText(text: text, fontSize: 20.sp),
        SizedBox(
          width: rightIconDistance,
        ),
        IconContainer(iconName: rightIconPath)
      ],
    );
  }
}