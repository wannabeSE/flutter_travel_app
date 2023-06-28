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
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.sp, 0, 24.sp, 24.sp),
        child: Container(
          height: miniContainerHeight,
          width: miniContainerWidth,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.82),
              borderRadius: BorderRadius.circular(16.sp)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.sp , 16.sp, 16.sp, 10.sp),
                child: Row(
                  children: [
                    SizedBox(
                      height: 16.h,
                      width: 111.w,
                      child: Text(
                        locationType,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: sans,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      width: upperInfoPadding,
                    ),
                    BoldText(text: '\$$price', fontSize: 16.sp)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.sp,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/location.svg'),
                    NormalText(text: location, fontSize: 12.sp),
                    SizedBox(
                      width: lowerInfoPadding,
                    ),
                    SvgPicture.asset('assets/icons/profile.svg'),
                    NormalText(text: '$joinedPerson joined', fontSize: 12.sp)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}