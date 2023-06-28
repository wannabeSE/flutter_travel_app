import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';
import 'package:travel_app/screens/components/appbar_widget.dart';
import 'package:travel_app/screens/components/image_container.dart';
import 'package:travel_app/shared/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AppBarWidget(
              leftIconPath: 'arrow_left.svg',
              text: 'My Profile',
              rightIconPath: 'bookmark.svg',
              leftIconDistance: 101.w,
              rightIconDistance: 87.w),
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
                    shape: BoxShape.circle),
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
                color: const Color(0xff9c9c9c)),
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            width: 156.h,
            child: const Row(
              children: [
                SocialIconContainer(
                  iconName: 'facebook.svg',
                ),
                SocialIconContainer(
                  iconName: 'twitter.svg',
                ),
                SocialIconContainer(
                  iconName: 'instagram.svg',
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(height: 32.h, width: 236.w, child: const ProfileElements()),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            height: 218.h,
            width: 394.w,
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
                locationTextContainerWidth: 86.w,
            ),
          )
        ],
      )),
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
          padding: const EdgeInsets.only(right: 24.0),
          child: Column(
            children: [
              Text(
                profileElements[index],
                style: TextStyle(
                    fontFamily: sans,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color:
                      index == selectedIndex ? activeColor : inactiveColor
                    ),
                  ),
                  const SizedBox(
                  height: 4,
                  ),
                  Container(
                    height: 8,
                    width: 8,
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
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: logoContainerColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: 16,
            width: 16,
            child: SvgPicture.asset(
              'assets/icons/$iconName',
            ),
          ),
        )
      ],
    );
  }
}
