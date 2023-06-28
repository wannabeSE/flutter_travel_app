import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/screens/components/icon_container.dart';

import '../../shared/text_style.dart';

class AppBarWidget extends StatelessWidget {
  final String text, route;
  final double leftIconGap, rightIconGap;
  const AppBarWidget({
    super.key, 
    required this.text, 
    required this.route, 
    required this.leftIconGap, 
    required this.rightIconGap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      width: 327.w,
      margin: EdgeInsets.only(left: 24.w, top: 16.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/$route');
            },
            child: const IconContainer(
              iconName: 'arrow_left.svg'
              ),
          ),
          SizedBox(width: leftIconGap,),
          SemiBoldText(text: text, fontSize: 20.sp),
          SizedBox(width: rightIconGap,),
          const IconContainer(iconName: 'bookmark.svg')
        ],
      ),
    );
  }
}