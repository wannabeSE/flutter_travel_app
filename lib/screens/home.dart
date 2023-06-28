import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/dummy_data.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';
import 'package:travel_app/screens/components/icon_container.dart';
import 'package:travel_app/screens/components/place_container.dart';
import 'package:travel_app/screens/details_screen.dart';
import 'package:travel_app/shared/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(24.w, 16.h, 0, 0),
                      child: const IconContainer(
                        iconName: 'menu.svg',
                      )
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: 17.h),
                    child: SizedBox(
                      height: 30.h,
                      width: 109.w,
                      child: Column(
                        children: [
                          NormalText(text: 'Location', fontSize: 12.sp),
                          BoldText(text: 'South City, Florida', fontSize: 12.sp)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16.h, 24.w, 0),
                    child: const IconContainer(
                      iconName: 'notification.svg',
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 25.h, 24.w, 24.h),
                child: SizedBox(
                  height: 48.h,
                  width: 327.w,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: searchBarColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide.none
                          ),
                        hintText: 'Search Destination',
                        hintStyle: TextStyle(
                          fontFamily: sans,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Align(
                            widthFactor: 0.2.w,
                            heightFactor: 1.h,
                            child: SvgPicture.asset(
                              'assets/icons/search.svg',
                            ),
                          ),
                        )
                      ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: BoldText(text: 'Where do you want to be?', fontSize: 18.sp),
              ),
             
              SizedBox(height: 16.h,),
              SizedBox(
                height: 197.h,
                width: double.infinity.w,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 25.w),
                          height: index == 0 ? 197.h : 146.h,
                          width: 155.w,
                          decoration: BoxDecoration(
                              color: index == 0
                                  ? firstPlaceContainerColor
                                  : placeContainerColor,
                              borderRadius: BorderRadius.circular(32.r)
                            ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15.0.h),
                                child: SizedBox(
                                  height: 50.h,
                                  width: 112.w,
                                  child: Text(
                                    '${placeData[index]['place']}\nPlace',
                                    style: TextStyle(
                                      fontFamily: sans,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w500,
                                      color: index == 0
                                          ? Colors.black
                                          : Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: index == 0
                                    ? EdgeInsets.fromLTRB(27.w, 40.h, 0, 20.h)
                                    : EdgeInsets.fromLTRB(27.w, 12.h, 0, 20.h),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: index == 0
                                      ? SvgPicture.asset('assets/icons/arrow.svg')
                                      : const Padding(padding: EdgeInsets.zero),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 24.w),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 24.h,
                                      width: 82.w,
                                      child: Row(
                                        mainAxisAlignment:MainAxisAlignment.start,
                                        children: [
                                          for (int i = 0; i < placeData.length; i++)
                                            Align(
                                              widthFactor: 0.5.w,
                                              child: CircleAvatar(
                                                radius: 12.r,
                                                backgroundColor: Colors.white,
                                                backgroundImage: AssetImage(
                                                    'assets/icons/${placeData[i]['image']}'),
                                              ),
                                            ),
                                            SizedBox(width: 6.w,),
                                            Text(
                                            '${placeData[index]['suggestionNumber']}+',
                                            style: TextStyle(
                                              fontFamily: sans,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: index == 0
                                                  ? Colors.black
                                                  : Colors.white
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
              SizedBox(height: 24.h,),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24.0.w),
                    child: BoldText(text: 'Recommended', fontSize: 18.sp),
                  ),
                  SizedBox(
                    width: 145.w,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/listing');
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontFamily: sans,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(24.w, 11.h, 0, 6.h),
                height: 218.h,
                width: double.infinity.w,
                child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context)=>
                                DetailsScreen(place: locationData[index])
                                )
                              );
                            },
                            child: PlaceContainer(
                              imagePath: locationData[index]['image'],
                              locationType: locationData[index]['name'],
                              location: locationData[index]['point'],
                              price: locationData[index]['price'],
                              joinedPerson: locationData[index]['joined'],
                            ),
                          ),
                          SizedBox(width: 16.w,)
                        ],
                      );
                    }
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
