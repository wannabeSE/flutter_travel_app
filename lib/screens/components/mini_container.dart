import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';
import 'package:travel_app/shared/text_style.dart';

class MiniContainer extends StatelessWidget {
  final String locationType;
  final String price, joinedPerson;
  final String location;
  final double upperInfoPadding, lowerInfoPadding, miniContainerHeight, miniContainerWidth;
  const MiniContainer({
    super.key,
    required this.locationType,
    required this.price,
    required this.location,
    required this.joinedPerson, 
    required this.upperInfoPadding, 
    required this.lowerInfoPadding, 
    required this.miniContainerHeight, 
    required this.miniContainerWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 113.h, 16.w, 16.h),
      height: miniContainerHeight,
      width: miniContainerWidth,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.82),
        borderRadius: BorderRadius.circular(16.r)
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(16.w, 16.h, 15.w, 16.h),
        height: 40.h, //inner info containing box
        width: 177.w,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 16.h,
                  width: 110.w,
                  child: Text(
                    locationType,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: sans,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                SizedBox(
                  width: upperInfoPadding,
                ),
                BoldText(text: '\$$price', fontSize: 16.sp)
              ],
            ),
            SizedBox(height: 3.5.h,),
            Row(
              children: [
                SizedBox(
                  height: 16.h,
                  width: 59.w,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/location.svg',height: 16.h,width: 16.w,),
                      SizedBox(width: 3.w,),
                      NormalText(text: location, fontSize: 12.sp),
                    ],
                  ),
                ),
                SizedBox(
                  width: lowerInfoPadding,
                ),
                SizedBox(
                  height: 16.h,
                  width: 75.w,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/profile.svg',height: 16.h, width: 16.h,),
                      SizedBox(width: 3.w,),
                      NormalText(text: '$joinedPerson joined', fontSize: 12.sp)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}