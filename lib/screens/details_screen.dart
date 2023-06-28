import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';
import 'package:travel_app/shared/text_style.dart';
import 'components/app_bar_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.place});
  final Map place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            AppBarWidget(
              text: 'Details',
              route: 'home',
              leftIconGap: 99.w,
              rightIconGap: 96.w,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 30.h, 24.w, 16.h),
              child: Container(
                  height: 199.h,
                  width: 327.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/icons/${place['image']}'),
                    ),
                  )
                ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 23.0.w),
              child: SemiBoldText(text: place['name'], fontSize: 24.sp,),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 8.h, 0, 26.h),
              child: Row(
                children: [
                  SizedBox(
                    height: 16.h,
                    width: 59.w,
                    child: Row(
                      children: [
                        SvgPicture.asset('${defaultIconLocation}location.svg',height: 16.h,width: 16.h,),
                        NormalText(text: place['point'], fontSize: 12.sp)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 42.w,
                  ),
                  SizedBox(
                    height: 16.h,
                    width: 75.w,
                    child: Row(
                      children: [
                        SvgPicture.asset('${defaultIconLocation}profile.svg',height: 16.h, width: 16.w,),
                        NormalText(text: '${place['joined']} Joined', fontSize: 12.sp)
                
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 0, 0, 24.h),
              child: SizedBox(
                height: 160.h,
                width: 327.w,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 160.h,
                          width: 156.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.r),
                              color: searchBarColor,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x0a141513),
                                  blurRadius: 25.r,
                                  offset: Offset(0, 4.sp),
                                )
                              ]),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(24.w, 32.h, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  '${defaultIconLocation}itinerary.png',
                                  height: 48.h,
                                  width: 48.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0.h),
                                  child: SizedBox(
                                    height: 44.h,
                                    width: 77.5.w,
                                    child: SemiBoldText(
                                      text: 'Choose\nDates', 
                                      fontSize: 20.sp
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      children: [
                        const DetailsMiniInfoContainer(
                          imageName: 'weather.png',
                          text: 'Mon 07 Oct',
                          value: '24°',
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const DetailsMiniInfoContainer(
                          text: 'Package Start',
                          imageName: 'save_money.png',
                          value: '\$124'
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0.w),
              child: BoldText(text: 'About Destination', fontSize: 18.sp),
                
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 24.w, top: 16.h),
              child: const Wrap(
                children: [
                  NormalText(text: 'Denali also known as Mount McKinley, its the official name. Which is the highest mountain peak in North America.',
                  fontSize: 14
                ),
                BoldText(text: '...Read More', fontSize: 14)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 29.h, 24.w, 26.h),
              child: SizedBox(
                height: 70.h,
                width: 327.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.r)
                      )
                    ),
                    onPressed: () {},
                    child: SemiBoldText(text: 'Book Now', fontSize: 20.sp,),
                  ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

class ExpandTextWidget extends StatefulWidget {
  final String text;
  const ExpandTextWidget({
    super.key,
    required this.text,
  });

  @override
  State<ExpandTextWidget> createState() => _ExpandTextWidgetState();
}

class _ExpandTextWidgetState extends State<ExpandTextWidget> {
  late String firstHalfText, secondHalfText;
  bool flag = false;

  @override
  void initState() {
    if (widget.text.length > 50) {
      firstHalfText = widget.text.substring(0, 50);
      secondHalfText = widget.text.substring(51, widget.text.length);
    } else {
      firstHalfText = widget.text;
      secondHalfText.isEmpty;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(26.w, 16.h, 23.w, 29.h),
      child: SizedBox(
        //height: 100.h,
        width: 326.w,
        child: secondHalfText.isEmpty
            ? Text(widget.text)
            : Column(
                children: [
                  Text(
                    flag ? firstHalfText : widget.text,
                    style: TextStyle(
                      fontFamily: sans,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                        child: BoldText(text: '...Read More', fontSize: 14.sp),
                        
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}

class DetailsMiniInfoContainer extends StatelessWidget {
  final String text, imageName, value;
  const DetailsMiniInfoContainer({
    super.key,
    required this.text,
    required this.imageName,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 72.h,
          width: 155.w,
          decoration: BoxDecoration(
              color: firstPlaceContainerColor,
              borderRadius: BorderRadius.circular(24.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 0, 8.h),
                child: Text(
                  text,
                  style: TextStyle(
                      fontFamily: sans,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0.w),
                child: Row(
                  children: [
                    Image.asset('$defaultIconLocation$imageName'),
                    SizedBox(
                      width: 11.w,
                    ),
                    SemiBoldText(text: value, fontSize: 20.sp)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
