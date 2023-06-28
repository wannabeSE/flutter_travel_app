import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/constants/dummy_data.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';
import 'package:travel_app/screens/components/icon_container.dart';
import 'package:travel_app/screens/components/image_container.dart';
import 'package:travel_app/screens/components/place_container.dart';
import 'package:travel_app/screens/details_screen.dart';
import 'package:travel_app/shared/text_style.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 230.w,
                height: 32.h,
                margin: EdgeInsets.only(left: 23.w, top: 16.h),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/main');
                        },
                        child: const IconContainer(iconName: 'arrow_left.svg')
                      ),
                    SizedBox(
                      width: 66.w,
                    ),
                    SemiBoldText(text: 'Natural Place', fontSize: 20.sp)
                  ],
                ),
              ),
      
              const ListOfCategoryContainers(),
              Padding(
                padding: EdgeInsets.only(left: 25.0.w, top: 24.h, bottom: 12.h),
                child: Row(
                  children: [
                    SizedBox(
                      height: 25.h,
                      width: 177.w,
                      child: Text(
                        'Popular in Quite Place',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: sans,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 102.w,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: TextStyle(
                              fontFamily: sans,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54),
                        ))
                  ],
                ),
              ),
              Container(
                height: 206.h,
                width: double.infinity,
                padding: EdgeInsets.only(left: 15.w, top:4.h, bottom: 1.h),
                child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          place: locationData[index])
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
                    }),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(23.w, 23.h, 0, 10.h),
                child: BoldText(text: 'All Natural Places', fontSize: 18.sp)
              ),
              Container(
                height: 218.h,
                width: 394.w,
                margin: EdgeInsets.fromLTRB(24.w, 11.h, 24.w, 6.h),
                child: ImageContainer(
                    imagePath: 'moon.png',
                    containerHeight: 201.h,
                    containerWidth: 327.w,
                    locationType: 'Dark Mountain',
                    price: '165',
                    location: 'Pennsylvania',
                    joinedPerson: '12',
                    upperInfoPadding: 110.w,
                    lowerInfoPadding: 10.w,
                    miniContainerHeight: 72.h,
                    miniContainerWidth: 295.w,
                    locationTextContainerWidth: 96.w,
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListOfCategoryContainers extends StatefulWidget {
  const ListOfCategoryContainers({
    super.key,
  });

  @override
  State<ListOfCategoryContainers> createState() =>
      _ListOfCategoryContainersState();
}

class _ListOfCategoryContainersState extends State<ListOfCategoryContainers> {
  int selectedIndex = 0;
  List categories = ['All', 'Mountain', 'Forest', 'Hills'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      //width: double.infinity,
      margin: EdgeInsets.only(left: 24.w, top: 30.h),
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8.0.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 40.h,
                      width: index == 1 ? 126.w : 88.w,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.w,
                            color: index == selectedIndex
                                ? categoryActiveColor
                                : categoryMainColor,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                          color: index == selectedIndex
                              ? categoryActiveColor
                              : null
                        ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/category.png',
                            height: 16.h,
                            width: 16.h,
                            color: index == selectedIndex
                                ? categoryActiveIconFontColor
                                : categoryMainColor,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            categories[index],
                            style: TextStyle(
                              fontFamily: sans,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: index == selectedIndex
                                  ? categoryActiveIconFontColor
                                  : categoryMainColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        ),
    );
  }
}
