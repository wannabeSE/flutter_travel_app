import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';
import 'package:travel_app/screens/components/icon_container.dart';
import 'package:travel_app/screens/components/image_container.dart';
import 'package:travel_app/shared/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              children: [
                const AppBarWidget(),
                SizedBox(
                  height: 30.h,
                ),
                Stack(
                  children: [
                    Container(
                      height: 140.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        color: circularContainerColorWithOpacity,
                        shape: BoxShape.circle
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0.w),
                      child: CircleAvatar(
                        radius: 60.r,
                        backgroundColor: circleAvatarColor,
                        foregroundImage: const AssetImage('assets/icons/dp.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                BoldText(text: 'Sam Smith', fontSize: 24.sp),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Premium Member',
                  style: TextStyle(
                    fontFamily: sans,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff9c9c9c)
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  width: 144.h,
                  child: Row(
                    children: [
                      const SocialIconContainer(
                        iconName: 'facebook.svg',
                      ),
                      SizedBox(width: 8.w,),
                      const SocialIconContainer(
                        iconName: 'twitter.svg',
                      ),
                      SizedBox(width: 8.w,),
                      const SocialIconContainer(
                        iconName: 'instagram.svg',
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  height: 32.h, 
                  width: 212.w, 
                  child: const ProfileElements()
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  height: 218.h,
                  width: 394.w,
                  margin: EdgeInsets.fromLTRB(25.w, 11.h, 23.w, 6.h),
                  child: ImageContainer(
                    imagePath: 'moon.png',
                    containerHeight: 201.h,
                    containerWidth: 327.w,
                    locationType: 'Dark Mountain',
                    price: '165',
                    location: 'Pennsylvania',
                    joinedPerson: '12',
                    upperInfoPadding: 110.w,
                    lowerInfoPadding: 15.w,
                    miniContainerHeight: 72.h,
                    miniContainerWidth: 295.w,
                    locationTextContainerWidth: 96.w,
                  ),
                )
              ],
          )
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
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
              Navigator.pushNamed(context, '/listing');
            },
            child: const IconContainer(
              iconName: 'arrow_left.svg'
              ),
          ),
          SizedBox(width: 84.w,),
          SemiBoldText(text: 'My Profile', fontSize: 20.sp),
          SizedBox(width: 81.w,),
          const IconContainer(iconName: 'bookmark.svg')
        ],
      ),
    );
  }
}

class ProfileElements extends StatefulWidget {
  const ProfileElements({
    super.key,
  });

  @override
  State<ProfileElements> createState() => _ProfileElementsState();
}

int selectedIndex = 0;
Color activeColor = Colors.black;
Color inactiveColor = const Color(0xff9c9c9c);
List profileElements = ['Favorites', 'Wallet', 'About'];
class _ProfileElementsState extends State<ProfileElements> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: profileElements.length,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Padding(
          padding: EdgeInsets.only(right: 22.0.w),
          child: Column(
            children: [
              Text(
                profileElements[index],
                style: TextStyle(
                    fontFamily: sans,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color:
                      index == selectedIndex ? activeColor : inactiveColor
                    ),
                  ),
                  SizedBox(
                  height: 4.h,
                  ),
                  Container(
                    height: 8.h,
                    width: 8.w,
                    decoration: BoxDecoration(
                      color: index == selectedIndex ? Colors.black : null,
                      shape: BoxShape.circle
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}

class SocialIconContainer extends StatelessWidget {
  final String iconName;
  const SocialIconContainer({
    super.key,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: const BoxDecoration(
            color: logoContainerColor,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: 16.h,
          width: 16.w,
          margin: EdgeInsets.all(12.w),
          child: SvgPicture.asset(
            'assets/icons/$iconName',
          ),
        )
      ],
    );
  }
}
